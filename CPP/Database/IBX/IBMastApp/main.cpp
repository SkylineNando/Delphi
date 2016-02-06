//---------------------------------------------------------------------------
// C++Builder
// Copyright (c) 1995-2010 Embarcadero Technologies, Inc.

// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
#include <typeinfo.h>
#include "main.h"
#include "Datamod.h"
#include "brcstord.h"
#include "brparts.h"
#include "edorders.h"
#include "qrycust.h"
#include "about.h"
#include "pickinvc.h"
//---------------------------------------------------------------------------
#pragma resource "*.dfm"
TMainForm *MainForm;
//---------------------------------------------------------------------------
__fastcall TMainForm::TMainForm(TComponent* Owner)
  : TForm(Owner)
{
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::StyleClick(TObject *Sender)
{
  String StyleName = StringReplace(((TMenuItem*)(Sender))->Caption, "&", "",
	TReplaceFlags() << rfReplaceAll << rfIgnoreCase);
  TStyleManager::TrySetStyle(StyleName);
  MainForm->Show();

}

//---------------------------------------------------------------------------
void __fastcall TMainForm::FormCreate(TObject *Sender)
{
   ClientWidth = CloseBtn->Left + CloseBtn->Width + 1;
   ClientHeight = CloseBtn->Top + CloseBtn->Height;
   MainPanel->Align = alClient;
   // position the form at the top of display
   Left = 10;
   Top = 10;


  PMStyles->Items->Clear();

  String Style;
  for (int i = 0; i < TStyleManager::StyleNames.Length-1; i++) {
	Style = TStyleManager::StyleNames[i];
	TMenuItem* Item  = new TMenuItem(this);
	Item->Caption = Style;
	Item->OnClick = StyleClick;
	PMStyles->Items->Add(Item);
  }

}
//---------------------------------------------------------------------
void TMainForm::CloseAllWindows()
{
  int I;
  TForm *F;
  for (I = 0; I < Application->ComponentCount; I++)
  {
    if ( typeid(Application->Components[I]) == typeid(TForm) )
    {
      F = new TForm(Application->Components[I]);
      if (F != this && F->Visible)
       F->Close();
    }
  }
}


//---------------------------------------------------------------------------
void __fastcall TMainForm::FormDestroy(TObject *Sender)
{
  Application->HelpCommand(HELP_QUIT,0);
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::BrowseCustOrd(TObject *Sender)
{
  BrCustOrdForm->Show();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::BrowseParts(TObject *Sender)
{
  BrPartsForm->Show();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::ToggleStayOnTop(TObject *Sender)
{
    static_cast<TMenuItem*>(Sender)->Checked = !(static_cast<TMenuItem*>(Sender)->Checked);
    if (static_cast<TMenuItem*>(Sender)->Checked)
      MainForm->FormStyle = fsStayOnTop;
    else
      MainForm->FormStyle = fsNormal;
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::NewOrder(TObject *Sender)
{
   EdOrderForm->Enter();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::CloseApp(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::ViewLocalClick(TObject *Sender)
{
  // Paradox support has been disabled
  CloseAllWindows();
//  MastData->UseLocalData();
  ViewLocal->Checked = True;
  Caption = Application->Title + " (Paradox Data)";
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::ViewRemoteClick(TObject *Sender)
{
  CloseAllWindows();
//  MastData->UseRemoteData();
  ViewRemote->Checked = True;
  Caption = Application->Title + " (Interbase)";
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::AboutClick(TObject *Sender)
{
  AboutBox->ShowModal();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::HelpContentsClick(TObject *Sender)
{
  Application->HelpCommand(HELP_CONTENTS, 0);
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::HelpBtn1Click(TObject *Sender)
{
  Application->HelpCommand(HELP_CONTENTS, 0);
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::ViewMenuClick(TObject *Sender)
{
  // Enable the Remote data menu item only if Interbase Server is running }
//  ViewRemote->Enabled = ( FindWindow(NULL, "InterBase Server") != 0 );

}
//---------------------------------------------------------------------------



