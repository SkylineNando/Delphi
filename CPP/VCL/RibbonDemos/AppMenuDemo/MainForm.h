//---------------------------------------------------------------------------

#ifndef MainFormH
#define MainFormH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Ribbon.hpp>
#include <RibbonLunaStyleActnCtrls.hpp>
#include <ActnCtrls.hpp>
#include <ActnMan.hpp>
#include <ToolWin.hpp>
#include <ActnList.hpp>
#include <AppEvnts.hpp>
#include <ImgList.hpp>
#include <ActnMenus.hpp>
#include <RibbonActnMenus.hpp>
#include <System.Actions.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TRibbon *Ribbon1;
	TRibbonPage *RibbonPage1;
	TMemo *Memo1;
	TRibbonGroup *RibbonGroup1;
	TApplicationEvents *ApplicationEvents1;
	TImageList *ImageList3;
	TImageList *ImageList4;
	TImageList *ImageList5;
	TImageList *ImageList2;
	TImageList *ImageList1;
	TActionManager *ActionManager1;
	TAction *SaveActn;
	TAction *SaveAsActn;
	TAction *DeleteActn;
	TAction *MoveActn;
	TAction *PermissionActn;
	TAction *PrintActn;
	TAction *PropertiesActn;
	TAction *CloseActn;
	TAction *PermissionNoRestrictionsActn;
	TAction *PermissionDoNotForward;
	TAction *PermissionManageCredentials;
	TAction *PrintQuickPrintActn;
	TAction *PrintPrintPreviewActn;
	TAction *PrintDefinePrintStylesActn;
	TAction *PrintMemoStyle;
	TAction *NewMailMessageActn;
	TAction *CreateAppointmentActn;
	TAction *ExitDemoActn;
	TRibbonQuickAccessToolbar *RibbonQuickAccessToolbar1;
	TRibbonPage *RibbonPage2;
	TRibbonPage *RibbonPage3;
	TRibbonApplicationMenuBar *RibbonApplicationMenuBar1;
	void __fastcall ApplicationEvents1ActionExecute(TBasicAction *Action, bool &Handled);
	void __fastcall ExitDemoActnExecute(TObject *Sender);
	void __fastcall CreateAppointmentActnExecute(TObject *Sender);
	void __fastcall NewMailMessageActnExecute(TObject *Sender);
	void __fastcall PermissionNoRestrictionsActnExecute(TObject *Sender);
	void __fastcall PrintQuickPrintActnExecute(TObject *Sender);
	void __fastcall SaveActnExecute(TObject *Sender);


private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
