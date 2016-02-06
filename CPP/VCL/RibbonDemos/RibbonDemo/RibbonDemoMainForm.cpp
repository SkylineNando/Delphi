//---------------------------------------------------------------------------
// Copyright (c) 1995-2010 Embarcadero Technologies, Inc.

// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

#include <vcl.h>
#include <Richedit.h>

#pragma hdrstop

#include "RibbonDemoMainForm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ActionManager1StyleChanged(TCustomActionManager *Sender)
{
  if (Sender->Style == RibbonLunaStyle)
    GridPanel1->Color = clSkyBlue;
  else
    if (Sender->Style == RibbonObsidianStyle)
      GridPanel1->Color = TColor(0x00444444);
    else
      GridPanel1->Color = TColor(0x00CBC2BF);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  TRect LRect;

  ReportMemoryLeaksOnShutdown = true;
  EnableEmptyActions();

  if (ParamCount > 0 && FileExists(ParamStr(1)))
    LoadFile(ParamStr(1));
  else
    CreateNewFile();

  LoadRecentFiles();
  LRect = RichEdit1->ClientRect;
  InflateRect(&LRect, -25, -25);
  RichEdit1->Perform(EM_SETRECT, 0, LRect);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ChangeCaseLowerActnExecute(TObject *Sender)
{
  RichEdit1->SelText = AnsiLowerCase(RichEdit1->SelText);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FontCalibriActnExecute(TObject *Sender)
{
  TTextAttributes *LAttribs;

  LAttribs = RichEdit1->SelAttributes;
  LAttribs->Name = ((TAction*)(Sender))->Caption;
}
//---------------------------------------------------------------------------


void __fastcall TForm1::FontGrowSizeActnExecute(TObject *Sender)
{
  RichEdit1->SelAttributes->Size++;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FontShrinkSizeActnExecute(TObject *Sender)
{
  RichEdit1->SelAttributes->Size--;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FontSubscriptActnExecute(TObject *Sender)
{
  TCharFormat2 aCharFormat2;

  aCharFormat2.cbSize = sizeof(aCharFormat2);
  aCharFormat2.dwMask = CFM_SUBSCRIPT;
  if (((TAction*)(Sender))->Checked)
    aCharFormat2.dwEffects = CFE_SUBSCRIPT;
  SendMessage(RichEdit1->Handle, EM_SETCHARFORMAT, (WPARAM)SCF_SELECTION, (LPARAM)&aCharFormat2);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FontSubscriptActnUpdate(TObject *Sender)
{
  TCharFormat2 aCharFormat2;

  aCharFormat2.cbSize = sizeof(aCharFormat2);
  aCharFormat2.dwMask = CFM_SUBSCRIPT;
  SendMessage(RichEdit1->Handle, EM_GETCHARFORMAT, (WPARAM)SCF_SELECTION, (LPARAM)&aCharFormat2);
  ((TAction*)(Sender))->Checked =(aCharFormat2.dwEffects && CFE_SUBSCRIPT) == CFE_SUBSCRIPT;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FontSuperScriptActnExecute(TObject *Sender)
{
  TCharFormat2 aCharFormat2;

  aCharFormat2.cbSize = sizeof(aCharFormat2);
  aCharFormat2.dwMask = CFM_SUPERSCRIPT;
  if (((TAction*)(Sender))->Checked)
    aCharFormat2.dwEffects = CFE_SUPERSCRIPT;
  SendMessage(RichEdit1->Handle, EM_SETCHARFORMAT, (WPARAM)SCF_SELECTION, (LPARAM)&aCharFormat2);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FontSuperScriptActnUpdate(TObject *Sender)
{
  TCharFormat2 aCharFormat2;

  aCharFormat2.cbSize = sizeof(aCharFormat2);
  aCharFormat2.dwMask = CFM_SUPERSCRIPT;
  SendMessage(RichEdit1->Handle, EM_GETCHARFORMAT, (WPARAM)SCF_SELECTION, (LPARAM)&aCharFormat2);
  ((TAction*)(Sender))->Checked = (aCharFormat2.dwEffects && CFE_SUPERSCRIPT) == CFE_SUPERSCRIPT;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::NumberingActnExecute(TObject *Sender)
{
  if (((TAction*)(Sender))->Checked)
    NumberNoneActn->Execute();
  else
    NumberArabicDotActn->Execute();
}
//---------------------------------------------------------------------------


void __fastcall TForm1::NumberingActnUpdate(TObject *Sender)
{
  TParaFormat2 AParaFormat2;

  AParaFormat2.cbSize = sizeof(AParaFormat2);
  AParaFormat2.dwMask = PFM_NUMBERING || PFM_NUMBERINGSTYLE;
  SendMessage(RichEdit1->Handle, EM_GETPARAFORMAT, 0, (LPARAM)&AParaFormat2);
  ((TAction*)(Sender))->Checked = AParaFormat2.wNumbering > 1;

  NumberNoneActn->Checked        = (AParaFormat2.wNumbering == 0);
  NumberArabicDotActn->Checked   = (AParaFormat2.wNumbering == 2) && (AParaFormat2.wNumberingStyle == 0x200);
  NumberArabicParenActn->Checked = (AParaFormat2.wNumbering == 2) && (AParaFormat2.wNumberingStyle == 0x000);
  NumberUpperRomanActn->Checked  = (AParaFormat2.wNumbering == 6) && (AParaFormat2.wNumberingStyle == 0x200);
  NumberUpperActn->Checked       = (AParaFormat2.wNumbering == 4) && (AParaFormat2.wNumberingStyle == 0x200);
  NumberLowerParenActn->Checked  = (AParaFormat2.wNumbering == 3) && (AParaFormat2.wNumberingStyle == 0x000);
  NumberLowerDotActn->Checked    = (AParaFormat2.wNumbering == 3) && (AParaFormat2.wNumberingStyle == 0x200);
  NumberLowerRomanActn->Checked  = (AParaFormat2.wNumbering == 5) && (AParaFormat2.wNumberingStyle == 0x200);

  ((TAction*)(Sender))->Enabled = ActiveControl == RichEdit1;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::CheckboxAction1Execute(TObject *Sender)
{
  // check box execute handlers
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FontEdit1BeforeExecute(TObject *Sender)
{
  FontEdit1->Dialog->Font->Assign(RichEdit1->SelAttributes);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FontEdit1Accept(TObject *Sender)
{
  RichEdit1->SelAttributes->Assign(FontEdit1->Dialog->Font);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FileOpen1Accept(TObject *Sender)
{
  LoadFile(FileOpen1->Dialog->FileName);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FileSaveAs1Accept(TObject *Sender)
{
  SaveFile(FileSaveAs1->Dialog->FileName);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FileSaveAs1Update(TObject *Sender)
{
  ((TAction*)(Sender))->Enabled = GetIsFileOpen();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FileSaveActnExecute(TObject *Sender)
{
  SaveFile(FFileName);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FileNewActnExecute(TObject *Sender)
{
  CreateNewFile();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FileCloseActnExecute(TObject *Sender)
{
  CloseFile();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FileSaveAsTextExecute(TObject *Sender)
{
  SaveFile(FFileName, ffTXT);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FileSaveAsRTFExecute(TObject *Sender)
{
  SaveFile(FFileName, ffRTF);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FileQuickPrintExecute(TObject *Sender)
{
  RichEdit1->Print("Printing " + Ribbon1->DocumentName + "...");
}
//---------------------------------------------------------------------------

void __fastcall TForm1::RadioAction1Execute(TObject *Sender)
{
  // Radio Button execute handlers
}
//---------------------------------------------------------------------------

void __fastcall TForm1::LunaStyleActnExecute(TObject *Sender)
{
  Ribbon1->Style = RibbonLunaStyle;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ObsidianStyleActnExecute(TObject *Sender)
{
  Ribbon1->Style = RibbonObsidianStyle;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::SilverStyleActnExecute(TObject *Sender)
{
//  Ribbon1->Style = RibbonSilverStyle;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::NumberNoneActnExecute(TObject *Sender)
{
  SetNumberStyle(0, 0);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::NumberArabicDotActnExecute(TObject *Sender)
{
  SetNumberStyle(2, 0x200);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::NumberArabicParenActnExecute(TObject *Sender)
{
  SetNumberStyle(2, 0);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::NumberUpperRomanActnExecute(TObject *Sender)
{
  SetNumberStyle(6, 0x200);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::NumberUpperActnExecute(TObject *Sender)
{
  SetNumberStyle(4, 0x200);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::NumberLowerParenActnExecute(TObject *Sender)
{
  SetNumberStyle(3, 0);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::NumberLowerDotActnExecute(TObject *Sender)
{
  SetNumberStyle(3, 0x200);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::NumberLowerRomanActnExecute(TObject *Sender)
{
  SetNumberStyle(5, 0x200);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::RichEdit1Change(TObject *Sender)
{
  UpdateUI();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::RichEdit1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)
{
  UpdateUI();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::RichEdit1MouseDown(TObject *Sender, TMouseButton Button, TShiftState Shift,
          int X, int Y)
{
  UpdateUI();
}
//---------------------------------------------------------------------------


void __fastcall TForm1::FormKeyDown(TObject *Sender, WORD &Key, TShiftState Shift) {
  if ((Shift == TShiftState() << ssCtrl) && (Key == VK_F1)) {
    Ribbon1->Minimized = !Ribbon1->Minimized;
    Key = 0;
  }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::rcbFontSizeChange(TObject *Sender)
{
  SetFontSize(StrToIntDef(((TCustomEdit*)(Sender))->Text, 8));
}
//---------------------------------------------------------------------------

void TForm1::SetFontSize(Integer NewSize) {
  TTextAttributes *LAttribs;

  LAttribs = RichEdit1->SelAttributes;
  LAttribs->Size = NewSize;
  UpdateUI();
}

// Form additional actions
void TForm1::LoadRecentFiles() {
  TSearchRec LSearchRec;
  String LFolder = "C:\\Temp\\Filenames\\";

  Ribbon1->ClearRecentItems();
  if (DirectoryExists(LFolder)) {
    if (FindFirst(LFolder + "*.txt", faAnyFile, LSearchRec) == 0) {
      Ribbon1->AddRecentItem(LFolder + LSearchRec.Name);
      while (FindNext(LSearchRec) == 0)
        Ribbon1->AddRecentItem(LFolder + LSearchRec.Name);
    }
  }
}

void TForm1::UpdateUI() {
  TTextAttributes *LAttribs;

  LAttribs = RichEdit1->SelAttributes;
  rcbFontSize->Text = IntToStr(LAttribs->Size);
  rcbFonts->Text = LAttribs->Name;
}

void TForm1::LoadFile(const String FileName) {
  FileNewActn->Execute();
  RichEdit1->Lines->LoadFromFile(FileName);
  FFileName = FileName;
  Ribbon1->DocumentName = ChangeFileExt(ExtractFileName(FileName), "");
  RichEdit1->PlainText = SameText(ExtractFileExt(FileName), FormatExt[ffTXT]);
  RichEdit1->Modified = false;
}

void TForm1::SaveFile(const String FileName, const TFileFormat Format) {
  String lNewFileName;

  if (GetIsFileOpen()) {
    if (FileName == "") {
      FileSaveAs1->Execute();
      exit;
    }
    lNewFileName = FileName;
    if (Format == ffTXT) {
      RichEdit1->PlainText = true;
      lNewFileName = ChangeFileExt(FileName, FormatExt[Format]);
    }
    RichEdit1->Lines->SaveToFile(lNewFileName);
    FFileName = FileName;
  }
}

void TForm1::CreateNewFile() {
  if (RichEdit1->Visible) {
    if (RichEdit1->Modified)
      SaveFile(FFileName);
  }

  RichEdit1->PlainText = false;
  RichEdit1->Visible = true;
  RichEdit1->Lines->Clear();
  ActiveControl = RichEdit1;
}

void TForm1::CloseFile() {
  if (GetIsFileOpen() && RichEdit1->Modified) {
    if (FFileName == "")
      FileSaveAs1->Execute();
    else
      FileSaveActn->Execute();
  }
  FFileName = "";
  Ribbon1->DocumentName = "";
  RichEdit1->Visible = false;
  RichEdit1->Lines->Clear();
}

bool TForm1::GetIsFileOpen() {
  return RichEdit1->Visible;
}

void TForm1::SetNumberStyle(Word Numbering, Word Style) {
  TParaFormat2 AParaFormat2;

  AParaFormat2.cbSize = sizeof(AParaFormat2);
  AParaFormat2.dwMask = PFM_NUMBERING; //(PFM_NUMBERING || PFM_NUMBERINGSTART || PFM_NUMBERINGSTYLE);
  AParaFormat2.wNumbering = Numbering;
  AParaFormat2.wNumberingStart = 1;
  AParaFormat2.wNumberingStyle = Style;

  SendMessage(RichEdit1->Handle, EM_SETPARAFORMAT, 0, (LPARAM)&AParaFormat2);
}

void TForm1::EnableEmptyActions() {
  ChangeCaseActn->DisableIfNoHandler           = false;
  ChangeCaseSentenceActn->DisableIfNoHandler   = false;
  ChangeCaseLowerActn->DisableIfNoHandler      = false;
  ChangeCaseUpperActn->DisableIfNoHandler      = false;
  ChangeCaseCapitalizeActn->DisableIfNoHandler = false;
  ChangeCaseToggleActn->DisableIfNoHandler     = false;
  FontSubscriptActn->DisableIfNoHandler        = false;
  FontSuperScriptActn->DisableIfNoHandler      = false;
  FontHighlightActn->DisableIfNoHandler        = false;
  FontColorActn->DisableIfNoHandler            = false;
}
