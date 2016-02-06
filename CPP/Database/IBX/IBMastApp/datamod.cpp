



//---------------------------------------------------------------------------

// This software is Copyright (c) 2011 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "datamod.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "IBCustomDataSet"
#pragma link "IBDatabase"
#pragma link "IBQuery"
#pragma link "IBTable"
#pragma resource "*.dfm"
TMastData *MastData;
//---------------------------------------------------------------------------
__fastcall TMastData::TMastData(TComponent* Owner)
	: TDataModule(Owner)
{
}

/* Steps through Items and gathers sum of ExtPrice. After OrdersItemsTotal
  is calculated, OrdersCalcFields is automatically called (which
  updates other calculated fields.) */

void TMastData::UpdateTotals()
{

  double TempTotal;
  TBookmark PrevRecord ;

  if (DeletingItems)
	return;		/* don't calculate if deleting all items */
  PrevRecord = Items->GetBookmark();	/* returns nil if table is empty */
  try {
	Items->DisableControls();
	Items->First();
	TempTotal = 0;			/* use temp for efficiency */
	while (!Items->Eof)
	{
	  TempTotal = TempTotal + ItemsExtPrice->Value;
	  Items->Next();
	}
	OrdersItemsTotal->Value = TempTotal;
	}

  __finally {
	 Items->EnableControls();
	 if (PrevRecord.Length > 0  )
	 {
	   Items->GotoBookmark(PrevRecord);
	   Items->FreeBookmark(PrevRecord);
	 }
  }
}
//---------------------------------------------------------------------------

void TMastData::DeleteItems()
{
  DeletingItems = True;    /* suppress recalc of totals during delete */
  Items->DisableControls();    /* for faster table traversal */
  try {
	Items->First();
	while (!Items->Eof)
	  Items->Delete();
  }
  __finally {
	DeletingItems = False;
	Items->EnableControls();   /* always re-enable controls after disabling */
  }
}
//---------------------------------------------------------------------------

bool TMastData::DataSetApplyUpdates(TDataSet *DataSet, bool Apply)
{
	TIBDataSet * v[] = { (TIBDataSet *)DataSet};
	if (  dsEditModes.Contains(DataSet->State)
	  || ((TIBCustomDataSet *)(DataSet))->UpdatesPending)
	{
	  if (Apply)
	  {
		Database->ApplyUpdates( (TDataSet * const *)v,0);
		Transaction->CommitRetaining();

	   /* Always call CancelUpdates to remove any discard changes */

		((TIBCustomDataSet *)(DataSet))->CancelUpdates();
	  }
	  else
	  {
		if (MessageDlg("Unsaved changes, exit anyway?", mtConfirmation,
		  TMsgDlgButtons() << mbYes << mbCancel, 0) == mrYes)
		  ((TIBCustomDataSet *)(DataSet))->CancelUpdates();
		else
		  return False;
	  }
	}
	return True;
}
//---------------------------------------------------------------------------

/* If user cancels the updates to the orders table, cancel the updates to
  the line items as well */

void __fastcall TMastData::OrdersAfterCancel(TDataSet *DataSet)
{
  Cust->CancelUpdates();
  Parts->CancelUpdates();
  Items->CancelUpdates();
  Orders->CancelUpdates();
}
//---------------------------------------------------------------------------

void __fastcall TMastData::OrdersAfterDelete(TDataSet *DataSet)
{
  Database->ApplyUpdates(OPENARRAY(TDataSet *,(Cust, Parts, Items, Orders)));
  Transaction->CommitRetaining();
}
//---------------------------------------------------------------------------

/* Post new LastInvoiceDate to CUST table. */

void __fastcall TMastData::OrdersAfterPost(TDataSet *DataSet)
{
  Set<TLocateOption,TLocateOption(0),TLocateOption(1)> flags;

  if (Cust->Locate("CustNo", OrdersCustNo->Value, flags) &&
	(CustLastInvoiceDate->Value < OrdersShipDate->Value))
  {
	Cust->Edit();
	CustLastInvoiceDate->Value = OrdersShipDate->Value;
	Cust->Post();
  };
  Database->ApplyUpdates(OPENARRAY(TDataSet *,(Orders, Items, Parts, Cust)));
  Transaction->CommitRetaining();
}
//---------------------------------------------------------------------------

void __fastcall TMastData::OrdersBeforeCancel(TDataSet *DataSet)
{
  if (Orders->State == dsInsert &&  !Items->Bof && Items->Eof)
	if (! Confirm("Cancel order being inserted and delete all line items?"))
	  Abort();
}
//---------------------------------------------------------------------------

void __fastcall TMastData::OrdersBeforeClose(TDataSet *DataSet)
{
  Items->Close();
  Emps->Close();
  CustByOrd->Close();
}
//---------------------------------------------------------------------------

void __fastcall TMastData::OrdersBeforeDelete(TDataSet *DataSet)
{
  if (! Confirm("Delete order and line items?"))
	Abort();
  else
	DeleteItems();
}
//---------------------------------------------------------------------------

/* Determine the next available ItemNo for this order */
void __fastcall TMastData::OrdersBeforeEdit(TDataSet *DataSet)
{
  LastItemQuery->Close();
  LastItemQuery->Open();

  /* SQL servers return Null for some aggregates if no items are present */

  if (LastItemQuery->Fields->Fields[0]->IsNull)
	FItemNo = 1;
  else
	FItemNo = LastItemQuery->Fields->Fields[0]->AsInteger + 1;
}
//---------------------------------------------------------------------------

void __fastcall TMastData::OrdersBeforeInsert(TDataSet *DataSet)
{
  if (dsEditModes.Contains(Orders->State))
  {
	if (Confirm("An order is being processed.  Save changes and start a new one?"))
	  Orders->Post();
	else
	  Abort();
  };
  FItemNo = 1;
}
//---------------------------------------------------------------------------

void __fastcall TMastData::OrdersBeforeOpen(TDataSet *DataSet)
{
  CustByComp->Open();
  CustByOrd->Open();
  Cust->Open();
  Emps->Open();
  Items->Open();
}
//---------------------------------------------------------------------------

/* Calculate the order's tax totals and amount due */

void __fastcall TMastData::OrdersCalcFields(TDataSet *DataSet)
{
  OrdersTaxTotal->Value = OrdersItemsTotal->Value * (OrdersTaxRate->Value / 100);
  OrdersAmountDue->Value = OrdersItemsTotal->Value + OrdersTaxTotal->Value +
	OrdersFreight->Value - OrdersAmountPaid->Value;
}
//---------------------------------------------------------------------------

/* Inititializes the record values as a result of an Orders.Insert. */
void __fastcall TMastData::OrdersNewRecord(TDataSet *DataSet)
{
  /* Get the Next Order Value from the NextOrd Table */

  NextOrd->Open();
  try {
	  NextOrd->Edit();
	  OrdersOrderNo->Value = NextOrdNewKey->Value;
	  NextOrdNewKey->Value = NextOrdNewKey->Value + 1;
	  NextOrd->Post();
  }
  __finally {
	  NextOrd->Close();
  };
  OrdersSaleDate->Value = Date();
  OrdersShipVIA->Value = "UPS";
  OrdersTerms->Value = "net 30";
  OrdersPaymentMethod->Value = "Check";
  OrdersItemsTotal->Value = 0;
  OrdersTaxRate->Value = 0;
  OrdersFreight->Value = 0;
  OrdersAmountPaid->Value = 0;
}
//---------------------------------------------------------------------------

void __fastcall TMastData::ItemsAfterDelete(TDataSet *DataSet)
{
  UpdateTotals();
}
//---------------------------------------------------------------------------

/*  When a change to the detail table affects a field in the master, always make
  sure the master (orders) table is in edit or insert mode before allowing the
  detail table to be modified. */

void __fastcall TMastData::EnsureOrdersEdit(TDataSet *DataSet)
{
  Orders->Edit();
}
//---------------------------------------------------------------------------

  /* Reduce/increase Parts table's OnOrder field */

void TMastData::UpdateParts(double PartNo, long Qty )
{
  Set<TLocateOption,TLocateOption(0),TLocateOption(1)> flags;
  if (PartNo > 0 && Qty != 0) {
	  try {
		if (! Parts->Locate("PartNo", PartNo, flags))
			Abort;
		Parts->Edit();
		PartsOnOrder->Value = PartsOnOrder->Value + Qty;
		Parts->Post();
	  }
	  catch(Exception &E) {
			ShowMessage(Format("Error updating parts table for PartNo: %d", ARRAYOFCONST((PartNo))));
	  }
  }
};
//---------------------------------------------------------------------------

	/* Update the order totals and the Parts table */

void __fastcall TMastData::ItemsAfterPost(TDataSet *DataSet)
{

  /* Maintain next available item number */
  FItemNo++;
  UpdateTotals();
  if (! (PrevPartNo == ItemsPartNo->Value) && (PrevQty == ItemsQty->Value))
  {
   /* Reduce previous Part#'s OnOrder field by previous Qty */
	UpdateParts(PrevPartNo, -PrevQty);
   /* Increase new Part#'s OnOrder field by previous Qty */
	UpdateParts(ItemsPartNo->Value, ItemsQty->Value);
  };
}
//---------------------------------------------------------------------------

/* Remember previous PartNo and Qty for updating Parts.OnOrder after post.
  When a change to the detail table affects a field in the master, always make
  sure the master table is in edit or insert mode before allowing the
  detail table to be modified. */

void __fastcall TMastData::ItemsBeforeEdit(TDataSet *DataSet)
{
  Orders->Edit();
  PrevPartNo = ItemsPartNo->Value;
  PrevQty = ItemsQty->Value;
}
//---------------------------------------------------------------------------

/* Make sure the Parts table opens before the Items table, since there are
  lookups which depend on it. */

void __fastcall TMastData::ItemsBeforeOpen(TDataSet *DataSet)
{
  Parts->Open();
}
//---------------------------------------------------------------------------

/* Complete the item's key by initializing its NextItemNo field */

void __fastcall TMastData::ItemsBeforePost(TDataSet *DataSet)
{
  ItemsItemNo->Value = FItemNo;
}
//---------------------------------------------------------------------------

/* Lookup PartNo info for the item; calculate its extended price */

void __fastcall TMastData::ItemsCalcFields(TDataSet *DataSet)
{
  ItemsExtPrice->Value = ItemsQty->Value *
	ItemsSellPrice->Value * (100 - ItemsDiscount->Value) / 100;
}
//---------------------------------------------------------------------------

/* New item. Zero the "prev" buckets, initialize the key */

void __fastcall TMastData::ItemsNewRecord(TDataSet *DataSet)
{
  PrevPartNo = 0;
  PrevQty = 0;
  ItemsOrderNo->Value = OrdersOrderNo->Value;
  ItemsQty->Value = 1;
  ItemsDiscount->Value = 0;
}
//---------------------------------------------------------------------------

void __fastcall TMastData::PartsBeforeOpen(TDataSet *DataSet)
{
  Vendors->Open();
}
//---------------------------------------------------------------------------

void __fastcall TMastData::PartsCalcFields(TDataSet *DataSet)
{
  PartsBackOrd->Value = PartsOnOrder->Value > PartsOnHand->Value;
}
//---------------------------------------------------------------------------

/* Concatenate last name + first name for the order's SoldBy DBLookupCombo */

void __fastcall TMastData::EmpsCalcFields(TDataSet *DataSet)
{
  EmpsFullName->Value = Format("%s, %s", ARRAYOFCONST((EmpsLastName->Value, EmpsFirstName->Value)));
}
//---------------------------------------------------------------------------

void __fastcall TMastData::CustBeforeOpen(TDataSet *DataSet)
{
  OrdByCust->Open();
}
//---------------------------------------------------------------------------

/* Get the next available customer number from the NextCust table */

void __fastcall TMastData::CustBeforePost(TDataSet *DataSet)
{
  if (Cust->State == dsInsert) {
	  NextCust->Open();
	  try {
		NextCust->Edit();
		CustCustNo->Value = NextCustNewCust->Value;
		NextCustNewCust->Value = NextCustNewCust->Value + 1;
		NextCust->Post();
	  }
	  __finally {
		NextCust->Close();
	  }
  }
}
//---------------------------------------------------------------------------

void __fastcall TMastData::OrdByCustCalcFields(TDataSet *DataSet)
{
  OrdByCustAmountDue->Value = OrdByCustItemsTotal->Value +
	OrdByCustItemsTotal->Value * OrdByCustTaxRate->Value / 100 +
	OrdByCustFreight->Value - OrdByCustAmountPaid->Value;
}
//---------------------------------------------------------------------------

void __fastcall TMastData::DataModuleCreate(TObject *Sender)
{
  Database->Open();
  Transaction->StartTransaction();
}
//---------------------------------------------------------------------------

void __fastcall TMastData::PartsQueryCalcFields(TDataSet *DataSet)
{
  PartsQueryBackOrd->Value = PartsOnOrder->Value > PartsOnHand->Value;
}
//---------------------------------------------------------------------------

/* Alternatively, could set the Qty field's Min and Max values in code
  or in the Object Inspector. */

void __fastcall TMastData::ItemsQtyValidate(TField *Sender)
{
  if (ItemsQty->Value < 1)
	throw Exception("Must specify quantity");
}
//---------------------------------------------------------------------------

void __fastcall TMastData::ItemsPartNoValidate(TField *Sender)
{
  Set<TLocateOption,TLocateOption(0),TLocateOption(1)> flags;

  if (! Parts->Locate("PartNo", ItemsPartNo->Value, flags))
	throw Exception("You must specify a valid PartNo");
}
//---------------------------------------------------------------------------

void __fastcall TMastData::OrdersCustNoChange(TField *Sender)
{
  float TaxRate;

  OrdersShipToContact->Value = "";
  OrdersShipToPhone->Value = "";
  OrdersShipToAddr1->Value = "";
  OrdersShipToAddr2->Value = "";
  OrdersShipToCity->Value = "";
  OrdersShipToState->Value = "";
  OrdersShipToZip->Value = "";
  OrdersShipToCountry->Value = "";
  TaxRate = Cust->Lookup("CustNo", OrdersCustNo->Value, "TaxRate");
  if (TaxRate != 0)   // todo: check tax rate init
	OrdersTaxRate->Value = TaxRate;
}
//---------------------------------------------------------------------------

void __fastcall TMastData::OrdersSaleDateValidate(TField *Sender)
{
  if (OrdersSaleDate->Value > Now())
	throw Exception("Cannot enter a future date");
}
//---------------------------------------------------------------------------

/* Alternatively, could set the Freight field's Min and Max values in code
  or in the Object Inspector. */

void __fastcall TMastData::OrdersFreightValidate(TField *Sender)
{
  if (OrdersFreight->Value < 0)
	throw Exception("Freight cannot be less than zero");
}

//---------------------------------------------------------------------------
bool Confirm(String Msg)
{
  return MessageDlg(Msg, mtConfirmation, mbYesNoCancel, 0) == mrYes;
}

