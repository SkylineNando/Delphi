//---------------------------------------------------------------------------

#ifndef DM1H
#define DM1H
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Data.DB.hpp>
#include <IBCustomDataSet.hpp>
#include <IBDatabase.hpp>
//---------------------------------------------------------------------------
class TDM : public TDataModule
{
__published:	// IDE-managed Components
	TDataSource *CustomerSource;
	TDataSource *OrdersSource;
	TDataSource *ItemsSource;
	TIBDatabase *Database;
	TIBTransaction *IBTransaction1;
	TIBDataSet *Customer;
	TIBDataSet *Orders;
	TIBDataSet *Items;
private:	// User declarations
public:		// User declarations
	__fastcall TDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDM *DM;
//---------------------------------------------------------------------------
#endif
