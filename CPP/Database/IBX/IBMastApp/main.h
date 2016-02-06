//---------------------------------------------------------------------------
// C++Builder
// Copyright (c) 1995-2010 Embarcadero Technologies, Inc.
//---------------------------------------------------------------------------
#include <ExtCtrls.hpp>
#include <Controls.hpp>
#include <Classes.hpp>
#include <Buttons.hpp>
#include <Menus.hpp>
#include <Dialogs.hpp>
#include <WinHelpViewer.hpp>
#include <XPMan.hpp>
#include <Vcl.StdCtrls.hpp>

//---------------------------------------------------------------------------
#ifndef __MAIN_H
#define __MAIN_H
//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
#ifndef WindowsHPP
#include <windows.hpp>
#endif

#ifndef MessagesHPP
#include <messages.hpp>
#endif

#ifndef SysUtilsHPP
#include <sysutils.hpp>
#endif

#ifndef ClassesHPP
#include <classes.hpp>
#endif

#ifndef GraphicsHPP
#include <graphics.hpp>
#endif

#ifndef ControlsHPP
#include <controls.hpp>
#endif

#ifndef FormsHPP
#include <forms.hpp>
#endif

#ifndef DialogsHPP
#include <dialogs.hpp>
#endif

#ifndef MenusHPP
#include <menus.hpp>
#endif

#ifndef ExtCtrlsHPP
#include <extctrls.hpp>
#endif

#ifndef ButtonsHPP
#include <buttons.hpp>
#endif

#include <bde.hpp>
//---------------------------------------------------------------------------
class TMainForm : public TForm
{
__published:
    TMainMenu *MainMenu;
    TMenuItem *FileMenu;
    TMenuItem *FileNewOrder;
    TMenuItem *N5;
    TMenuItem *FileExit;
	TMenuItem *ViewMenu;
	TMenuItem *ViewOrders;
    TMenuItem *ViewPartsInventory;
    TMenuItem *N7;
    TMenuItem *ViewStayOnTop;
    TMenuItem *N1;
    TMenuItem *ViewLocal;
    TMenuItem *ViewRemote;
    TMenuItem *HelpMenu;
    TMenuItem *HelpContents;
    TMenuItem *N6;
    TMenuItem *HelpAbout;
	TPanel *MainPanel;
	TSpeedButton *OrderBtn;
	TSpeedButton *BrowseBtn;
	TSpeedButton *PartsBtn;
	TSpeedButton *HelpBtn;
	TSpeedButton *CloseBtn;
	TButton *Button1;
	TPopupMenu *PMStyles;
	TMenuItem *Style11;
	TMenuItem *Style21;
	TMenuItem *Style31;
    void __fastcall FormCreate(TObject *Sender);
	void __fastcall FormDestroy(TObject *Sender);
	void __fastcall BrowseCustOrd(TObject *Sender);
	void __fastcall BrowseParts(TObject *Sender);
	void __fastcall ToggleStayOnTop(TObject *Sender);
	void __fastcall NewOrder(TObject *Sender);
	void __fastcall CloseApp(TObject *Sender);
	void __fastcall ViewLocalClick(TObject *Sender);
	void __fastcall ViewRemoteClick(TObject *Sender);
	void __fastcall AboutClick(TObject *Sender);
	void __fastcall HelpContentsClick(TObject *Sender);
	void __fastcall HelpBtn1Click(TObject *Sender);
	void __fastcall ViewMenuClick(TObject *Sender);
	void __fastcall StyleClick(TObject *Sender);

private:        // private user declarations
	 void CloseAllWindows();
public:         // public user declarations
	virtual __fastcall TMainForm(TComponent* Owner);
};                           
//---------------------------------------------------------------------------
extern TMainForm *MainForm;
//---------------------------------------------------------------------------
#endif
