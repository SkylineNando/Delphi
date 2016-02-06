
//---------------------------------------------------------------------------

// This software is Copyright (c) 2011 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include <Dialogs.Hpp>

#include <windows.h>

//
// Includes to support design-time code
//
#include <DesignIntf.hpp>
#include <ToolsApi.hpp>

//
// Version info component and declarations of component + property editor
//
#include "VersionInfoComponent.h"
#include "VersionInfoUI.h"
#include "VersionInfoDesignTimeCode.h"

#define NDEBUG
#include <cassert>

#pragma package(smart_init)

//---------------------------------------------------------------------------

static bool __fastcall GetVersionInfoFileNameViaDialog(UnicodeString& ResultFileName)
{
  TOpenDialog* AOpenDialog;
  bool ResultAccepted;

  AOpenDialog = new TOpenDialog(NULL);
  try
  {
	AOpenDialog->DefaultExt = L"*.exe";
	AOpenDialog->FileName = ResultFileName;
	AOpenDialog->Filter = L"Binary files (*.exe;*.dll;*.ocx)|*.EXE;*.DLL;*.OCX|All files (*.*)|*.*";

    AOpenDialog->Options = TOpenOptions() << ofPathMustExist << ofFileMustExist
                                          << ofHideReadOnly << ofEnableSizing;

    ResultAccepted = AOpenDialog->Execute();
    if (ResultAccepted)
    {
      ResultFileName = ExpandFileName(AOpenDialog->FileName);
    }
  }
  __finally
  {
    delete AOpenDialog;
  }

  return ResultAccepted;
}

//---------------------------------------------------------------------------

void __fastcall TVersionInfoFileNameEditor::Edit(void)
{
  UnicodeString NewFileName;

  NewFileName = this->GetStrValue();

  if (GetVersionInfoFileNameViaDialog(NewFileName))
  {
    // Update the property with the new value...
	SetValue(NewFileName);
    // ...and notify the designer that (implicitly)
    // the whole component has changed its state
	// as a result of the FileName's setter method.

  }
}

TPropertyAttributes __fastcall TVersionInfoFileNameEditor::GetAttributes(void)
{
  return (TPropertyAttributes() << paDialog);
}

UnicodeString __fastcall TVersionInfoFileNameEditor::GetValue(void)
{
  UnicodeString Result;

  Result = inherited::GetValue();
  if (Result.Length() == 0)
	Result = L"(Current Application)";

  return Result;
}

//void __fastcall TVersionInfoFileNameEditor::SetValue(const UnicodeString Value)
//{
//  inherited::SetValue(Value);
//}

//-----------------------------------------------------------------------------------

TPropertyAttributes __fastcall TVersionInfoFileDateEditor::GetAttributes(void)
{
  return TPropertyAttributes() << paReadOnly;
}

UnicodeString __fastcall TVersionInfoFileDateEditor::GetValue(void)
{
  UnicodeString DateTimeString;
  TVersionInfo* VersionInfoComponent;

  VersionInfoComponent = dynamic_cast<TVersionInfo*>(this->GetComponent(0));
  assert(VersionInfoComponent != NULL);

  if (VersionInfoComponent->Enabled && VersionInfoComponent->HasVersionInfo)
  {
    try
    {
	  DateTimeString = FormatDateTime(L"dddddd - tt", TDateTime(double(GetFloatValue())));
	}
	catch(...)
	{
	  DateTimeString = L"(Invalid file date)";
    }
  }
  else
  {
	DateTimeString = L"";
  }

  return DateTimeString;
}

//-----------------------------------------------------------------------------------

void __fastcall TVersionInfoLanguageCharsetIndexEditor::Edit(void)
{
  // Do nothing.
}

TPropertyAttributes __fastcall TVersionInfoLanguageCharsetIndexEditor::GetAttributes(void)
{
  return TPropertyAttributes() << paValueList;
}

UnicodeString __fastcall TVersionInfoLanguageCharsetIndexEditor::GetTranslationNameAtIndex(const int Index)
{
  DWORD LanguageCode;
  DWORD Charset;
  TVersionInfo* VersionInfoComponent;

  VersionInfoComponent = dynamic_cast<TVersionInfo*>(GetComponent(0));
  assert(VersionInfoComponent != NULL);

  LanguageCode = reinterpret_cast<DWORD>(VersionInfoComponent->Translations->Objects[Index]);
  Charset = (LanguageCode >> 16) & 0xFFFF; // Get bits 15-31 and mask out the rest
  LanguageCode = LanguageCode & 0xFFFF; // Mask out upper 16 bits

  // Return the formatted result string
  UnicodeString Result;

  return Result.sprintf( L"%s%.4x:%s%.4x - %s",
						 HexDisplayPrefix.c_str(),
						 LanguageCode,
						 HexDisplayPrefix.c_str(),
						 Charset,
						 TVersionInfo::TranslateVersionLanguageName(LanguageCode).c_str()
                         );
}

bool __fastcall TVersionInfoLanguageCharsetIndexEditor::GetIndexForTranslationName(
  const UnicodeString &TranslationName, int& Index)
{
  // OK, this is pretty inefficient, but it is
  // pretty effective and idiot-proof, too.

  TVersionInfo* VersionInfoComponent;

  VersionInfoComponent = dynamic_cast<TVersionInfo*>(GetComponent(0));
  assert(VersionInfoComponent != NULL);

  Index = VersionInfoComponent->Translations->Count-1;

  while (Index >= 0)
  {
    if (TranslationName == GetTranslationNameAtIndex(Index))
      break;
    Index--;
  }

  return (Index >= 0);
}

UnicodeString __fastcall TVersionInfoLanguageCharsetIndexEditor::GetValue(void)
{
  UnicodeString Result;
  TVersionInfo* VersionInfoComponent;

  VersionInfoComponent = dynamic_cast<TVersionInfo*>(GetComponent(0));
  assert(VersionInfoComponent != NULL);

  if (VersionInfoComponent->LanguageCharsetIndex >= 0)
  {
    Result = GetTranslationNameAtIndex(VersionInfoComponent->LanguageCharsetIndex);
  }
  else
  {
	Result = L"(No language selected)";
  }

  return Result;
}

void __fastcall TVersionInfoLanguageCharsetIndexEditor::SetValue(const UnicodeString Value)
{
  int NewLanguageCharsetIndex;
  TVersionInfo* VersionInfoComponent;

  VersionInfoComponent = dynamic_cast<TVersionInfo*>(GetComponent(0));
  assert(VersionInfoComponent != NULL);

  if ( VersionInfoComponent->Enabled &&
	   GetIndexForTranslationName(Value, NewLanguageCharsetIndex) )
  {
	SetOrdValue(NewLanguageCharsetIndex);
  }
  else
  {
	inherited::SetValue(Value);
  }
}

void __fastcall TVersionInfoLanguageCharsetIndexEditor::GetValues(Classes::TGetStrProc Proc)
{
  TVersionInfo* VersionInfoComponent;
  int NumberElements;

  VersionInfoComponent = dynamic_cast<TVersionInfo*>(GetComponent(0));
  assert(VersionInfoComponent != NULL);

  if (!VersionInfoComponent->Enabled || !VersionInfoComponent->HasVersionInfo)
	return;

  NumberElements = VersionInfoComponent->Translations->Count;

  for (int i = 0; i < NumberElements; ++i)
  {
	Proc( GetTranslationNameAtIndex(i) );
  }
}

//-----------------------------------------------------------------------------------

void __fastcall TVersionInfoComponentEditor::DoTestAboutBox(void)
{
  TVersionInfo* VersionInfoComponent;

  VersionInfoComponent = dynamic_cast<TVersionInfo*>(this->Component);
  assert(VersionInfoComponent != NULL);

  VersionInfoComponent->ShowAboutBox();
}

void __fastcall TVersionInfoComponentEditor::DoChangeFileNameProperty(void)
{
  TVersionInfo* VersionInfoComponent;
  String NewFileName;

  VersionInfoComponent = dynamic_cast<TVersionInfo*>(this->Component);
  assert(VersionInfoComponent != NULL);

  NewFileName = VersionInfoComponent->FileName;

  if (GetVersionInfoFileNameViaDialog(NewFileName))
  {
    // Update
    VersionInfoComponent->FileName = NewFileName;
    Designer->Modified();
  }
}

void __fastcall TVersionInfoComponentEditor::Edit(void)
{
  // Execute default action
  DoTestAboutBox();
}

void __fastcall TVersionInfoComponentEditor::ExecuteVerb(int Index)
{
  switch(Index)
  {
    case 0:
      DoTestAboutBox();
      break;

    case 1:
      DoChangeFileNameProperty();
      break;

    default:
      // This ought not to happen
      assert(false);
  }
}

UnicodeString __fastcall TVersionInfoComponentEditor::GetVerb(int Index)
{
  UnicodeString VerbResult;

  switch(Index)
  {
	case 0:
	  VerbResult = L"Test About box";
	  break;

	case 1:
	  VerbResult = L"Select file...";
      break;

    default:
      // This ought not to happen
      assert(false);
  }

  return VerbResult;
}

int __fastcall TVersionInfoComponentEditor::GetVerbCount(void)
{
  const int NumberVerbs = 2;

  return NumberVerbs;
}


