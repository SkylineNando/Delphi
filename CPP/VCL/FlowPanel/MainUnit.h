//---------------------------------------------------------------------------
#ifndef MainUnitH
#define MainUnitH

//---------------------------------------------------------------------------
#include <Windows.hpp>
#include <Messages.hpp>
#include <SysUtils.hpp>
#include <Variants.hpp>
#include <Classes.hpp>
#include <Graphics.hpp>
#include <Controls.hpp>
#include <Forms.hpp>
#include <Dialogs.hpp>
#include <StdCtrls.hpp>
#include <ExtCtrls.hpp>
#include <Contnrs.hpp>
#include <XPMan.hpp> 

//---------------------------------------------------------------------------
 class TMainForm: public TForm
{
__published:	// IDE-managed Components
    TPanel *Panel1;
    TFlowPanel *FlowPanel1;
    TButton *bExit;
    TComboBox *cboxFlowStyle;
    TLabel *Label1;
    TPanel *Panel2;
    TLabel *Label2;
    TXPManifest *XPManifest1;
    void __fastcall FormDestroy(TObject *Sender);
    void __fastcall cboxFlowStyleChange(TObject *Sender);
    void __fastcall bExitClick(TObject *Sender);
    void __fastcall FormCreate(TObject *Sender);
private: // User declarations
    TObjectList *FControlList;
    void __fastcall CreateControls();
public:  // User declarations
	__fastcall TMainForm(TComponent *AOwner);
};

//---------------------------------------------------------------------------
extern PACKAGE   TMainForm *MainForm;
//---------------------------------------------------------------------------

#endif

