//---------------------------------------------------------------------------

#ifndef datamodH
#define datamodH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "IBCustomDataSet.hpp"
#include "IBDatabase.hpp"
#include "IBQuery.hpp"
#include "IBTable.hpp"
#include <DB.hpp>
#include <Dialogs.hpp>
//---------------------------------------------------------------------------
class TMastData : public TDataModule
{
__published:	// IDE-managed Components
	TIBTable *Orders;
	TFloatField *OrdersOrderNo;
	TFloatField *OrdersCustNo;
	TDateTimeField *OrdersSaleDate;
	TDateTimeField *OrdersShipDate;
	TIBStringField *OrdersShipToContact;
	TIBStringField *OrdersShipToAddr1;
	TIBStringField *OrdersShipToAddr2;
	TIBStringField *OrdersShipToCity;
	TIBStringField *OrdersShipToState;
	TIBStringField *OrdersShipToZip;
	TIBStringField *OrdersShipToCountry;
	TIBStringField *OrdersShipToPhone;
	TIBStringField *OrdersShipVIA;
	TIBStringField *OrdersPO;
	TIntegerField *OrdersEmpNo;
	TIBStringField *OrdersTerms;
	TIBStringField *OrdersPaymentMethod;
	TCurrencyField *OrdersItemsTotal;
	TFloatField *OrdersTaxRate;
	TCurrencyField *OrdersTaxTotal;
	TCurrencyField *OrdersFreight;
	TCurrencyField *OrdersAmountPaid;
	TCurrencyField *OrdersAmountDue;
	TIBStringField *OrdersSalesPerson;
	TDataSource *CustByCompSrc;
	TDataSource *OrdByCustSrc;
	TDataSource *CustMasterSrc;
	TDataSource *CustSource;
	TDataSource *VendorSource;
	TDataSource *EmpsSource;
	TDataSource *PartsSource;
	TDataSource *ItemsSource;
	TDataSource *CustByOrdSrc;
	TDataSource *OrdersSource;
	TOpenDialog *OpenDialog;
	TIBTransaction *Transaction;
	TIBQuery *OrdersByDateQuery;
	TFloatField *OrdersByDateQueryOrderNo;
	TFloatField *OrdersByDateQueryCustNo;
	TDateTimeField *OrdersByDateQuerySaleDate;
	TDateTimeField *OrdersByDateQueryShipDate;
	TIntegerField *OrdersByDateQueryEmpNo;
	TIBStringField *OrdersByDateQueryShipToContact;
	TIBStringField *OrdersByDateQueryShipToAddr1;
	TIBStringField *OrdersByDateQueryShipToAddr2;
	TIBStringField *OrdersByDateQueryShipToCity;
	TIBStringField *OrdersByDateQueryShipToState;
	TIBStringField *OrdersByDateQueryShipToZip;
	TIBStringField *OrdersByDateQueryShipToCountry;
	TIBStringField *OrdersByDateQueryShipToPhone;
	TIBStringField *OrdersByDateQueryShipVIA;
	TIBStringField *OrdersByDateQueryPO;
	TIBStringField *OrdersByDateQueryTerms;
	TIBStringField *OrdersByDateQueryPaymentMethod;
	TCurrencyField *OrdersByDateQueryItemsTotal;
	TFloatField *OrdersByDateQueryTaxRate;
	TCurrencyField *OrdersByDateQueryFreight;
	TCurrencyField *OrdersByDateQueryAmountPaid;
	TIBStringField *OrdersByDateQueryCompany;
	TIBQuery *CustByLastInvQuery;
	TFloatField *CustByLastInvQueryCustNo;
	TIBStringField *CustByLastInvQueryCompany;
	TIBStringField *CustByLastInvQueryAddr1;
	TIBStringField *CustByLastInvQueryAddr2;
	TIBStringField *CustByLastInvQueryCity;
	TIBStringField *CustByLastInvQueryState;
	TIBStringField *CustByLastInvQueryZip;
	TIBStringField *CustByLastInvQueryCountry;
	TIBStringField *CustByLastInvQueryPhone;
	TIBStringField *CustByLastInvQueryFAX;
	TFloatField *CustByLastInvQueryTaxRate;
	TIBStringField *CustByLastInvQueryContact;
	TDateTimeField *CustByLastInvQueryLastInvoiceDate;
	TIBTable *CustByComp;
	TIBTable *OrdByCust;
	TFloatField *OrdByCustOrderNo;
	TFloatField *OrdByCustCustNo;
	TDateTimeField *OrdByCustSaleDate;
	TDateTimeField *OrdByCustShipDate;
	TCurrencyField *OrdByCustItemsTotal;
	TFloatField *OrdByCustTaxRate;
	TCurrencyField *OrdByCustFreight;
	TCurrencyField *OrdByCustAmountPaid;
	TCurrencyField *OrdByCustAmountDue;
	TIBQuery *CustQuery;
	TFloatField *CustQueryCustNo;
	TIBStringField *CustQueryCompany;
	TIBStringField *CustQueryPhone;
	TDateTimeField *CustQueryLastInvoiceDate;
	TIBTable *Cust;
	TFloatField *CustCustNo;
	TIBStringField *CustCompany;
	TIBStringField *CustPhone;
	TDateTimeField *CustLastInvoiceDate;
	TIBStringField *CustAddr1;
	TIBStringField *CustAddr2;
	TIBStringField *CustCity;
	TIBStringField *CustState;
	TIBStringField *CustZip;
	TIBStringField *CustCountry;
	TIBStringField *CustFAX;
	TFloatField *CustTaxRate;
	TIBStringField *CustContact;
	TIBQuery *LastItemQuery;
	TIBTable *Emps;
	TIntegerField *EmpsEmpNo;
	TIBStringField *EmpsFullName;
	TIBStringField *EmpsLastName;
	TIBStringField *EmpsFirstName;
	TIBStringField *EmpsPhoneExt;
	TDateTimeField *EmpsHireDate;
	TFloatField *EmpsSalary;
	TIBTable *NextOrd;
	TFloatField *NextOrdNewKey;
	TIBTable *Items;
	TFloatField *ItemsItemNo;
	TFloatField *ItemsOrderNo;
	TFloatField *ItemsPartNo;
	TIBStringField *ItemsDescription;
	TCurrencyField *ItemsSellPrice;
	TIntegerField *ItemsQty;
	TFloatField *ItemsDiscount;
	TCurrencyField *ItemsExtPrice;
	TIBTable *CustByOrd;
	TFloatField *CustByOrdCustNo;
	TIBStringField *CustByOrdCompany;
	TIBStringField *CustByOrdAddr1;
	TIBStringField *CustByOrdAddr2;
	TIBStringField *CustByOrdCity;
	TIBStringField *CustByOrdState;
	TIBStringField *CustByOrdZip;
	TIBStringField *CustByOrdCountry;
	TIBStringField *CustByOrdPhone;
	TIBStringField *CustByOrdFAX;
	TFloatField *CustByOrdTaxRate;
	TIBStringField *CustByOrdContact;
	TDateTimeField *CustByOrdLastInvoiceDate;
	TIBTable *Vendors;
	TIBQuery *PartsQuery;
	TFloatField *PartsQueryPartNo;
	TIBStringField *PartsQueryDescription;
	TFloatField *PartsQueryVendorNo;
	TFloatField *PartsQueryOnHand;
	TFloatField *PartsQueryOnOrder;
	TBooleanField *PartsQueryBackOrd;
	TCurrencyField *PartsQueryCost;
	TCurrencyField *PartsQueryListPrice;
	TIBTable *Parts;
	TFloatField *PartsPartNo;
	TIBStringField *PartsDescription;
	TFloatField *PartsVendorNo;
	TFloatField *PartsOnHand;
	TFloatField *PartsOnOrder;
	TBooleanField *PartsBackOrd;
	TCurrencyField *PartsCost;
	TCurrencyField *PartsListPrice;
	TIBTable *NextCust;
	TFloatField *NextCustNewCust;
	TIBDatabase *Database;
	void __fastcall OrdersAfterCancel(TDataSet *DataSet);
	void __fastcall OrdersAfterDelete(TDataSet *DataSet);
	void __fastcall OrdersAfterPost(TDataSet *DataSet);
	void __fastcall OrdersBeforeCancel(TDataSet *DataSet);
	void __fastcall OrdersBeforeClose(TDataSet *DataSet);
	void __fastcall OrdersBeforeDelete(TDataSet *DataSet);
	void __fastcall OrdersBeforeEdit(TDataSet *DataSet);
	void __fastcall OrdersBeforeInsert(TDataSet *DataSet);
	void __fastcall OrdersBeforeOpen(TDataSet *DataSet);
	void __fastcall OrdersCalcFields(TDataSet *DataSet);
	void __fastcall OrdersNewRecord(TDataSet *DataSet);
	void __fastcall ItemsAfterDelete(TDataSet *DataSet);
	void __fastcall ItemsAfterPost(TDataSet *DataSet);
	void __fastcall EnsureOrdersEdit(TDataSet *DataSet);
	void __fastcall ItemsBeforeEdit(TDataSet *DataSet);
	void __fastcall ItemsBeforeOpen(TDataSet *DataSet);
	void __fastcall ItemsBeforePost(TDataSet *DataSet);
	void __fastcall ItemsCalcFields(TDataSet *DataSet);
	void __fastcall ItemsNewRecord(TDataSet *DataSet);
	void __fastcall PartsBeforeOpen(TDataSet *DataSet);
	void __fastcall PartsCalcFields(TDataSet *DataSet);
	void __fastcall EmpsCalcFields(TDataSet *DataSet);
	void __fastcall CustBeforeOpen(TDataSet *DataSet);
	void __fastcall CustBeforePost(TDataSet *DataSet);
	void __fastcall OrdByCustCalcFields(TDataSet *DataSet);
	void __fastcall DataModuleCreate(TObject *Sender);
	void __fastcall PartsQueryCalcFields(TDataSet *DataSet);
	void __fastcall ItemsQtyValidate(TField *Sender);
	void __fastcall ItemsPartNoValidate(TField *Sender);
	void __fastcall OrdersCustNoChange(TField *Sender);
	void __fastcall OrdersSaleDateValidate(TField *Sender);
	void __fastcall OrdersFreightValidate(TField *Sender);
private:	// User declarations
	double PrevPartNo;       /* remembers Item's previous part# */
	long PrevQty;         /* remembers Item's previous qty */
	bool DeletingItems;   /* suppress totals calc. if deleting items */
	int FItemNo;
	void UpdateTotals();
	void DeleteItems();
	void UpdateParts(double PartNo, long Qty );
public:		// User declarations
	__fastcall TMastData(TComponent* Owner);
	bool DataSetApplyUpdates(TDataSet *DataSet, bool Apply);
};
bool Confirm(String Msg);

//---------------------------------------------------------------------------
extern PACKAGE TMastData *MastData;
//---------------------------------------------------------------------------
#endif
