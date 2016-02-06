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

#include "VersionInfoUI.h"

#pragma package(smart_init)
//---------------------------------------------------------------------------
// ValidCtrCheck is used to assure that the components created do not have
// any pure virtual functions.
//

static inline void ValidCtrCheck(TCustomVersionInfoLabel *)
{
  delete new TVersionInfoGenericLabel(NULL);

  delete new TVersionInfoCompanyNameLabel(NULL);
  delete new TVersionInfoCommentsLabel(NULL);
  delete new TVersionInfoFileDescriptionLabel(NULL);
  delete new TVersionInfoFileVersionLabel(NULL);
  delete new TVersionInfoFileVersionLabel(NULL);
  delete new TVersionInfoInternalNameLabel(NULL);
  delete new TVersionInfoLegalCopyrightLabel(NULL);
  delete new TVersionInfoLegalTrademarksLabel(NULL);
  delete new TVersionInfoOriginalFileNameLabel(NULL);
  delete new TVersionInfoProductNameLabel(NULL);
  delete new TVersionInfoProductVersionLabel(NULL);
}

//---------------------------------------------------------------------------

__fastcall TCustomVersionInfoLabel::TCustomVersionInfoLabel(TComponent* Owner)
  : inherited(Owner)
{
  // It is not useful to use the ampersand ("&") as the
  // accelerator character.
  ShowAccelChar = false;
}

void __fastcall TCustomVersionInfoLabel::CMVersionInfoChange(TMessage& Message)
{
  UpdateLabelContent();
}

System::UnicodeString __fastcall TCustomVersionInfoLabel::GetLabelText(void)
{
  System::UnicodeString Result;

  if (FVersionInfo != NULL)
  {
    Result = GetVersionLabelText();

    if ((Result.Length() == 0) && ComponentState.Contains(csDesigning))
    {
      Result = L"(No VersionInfo data)";
    }
  }
  else
  {
    if (ComponentState.Contains(csDesigning))
      Result = L"(Assign VersionInfo property)";
    else
      Result = L"";
  }

  return Result;
}

void __fastcall TCustomVersionInfoLabel::Notification(TComponent* AComponent, TOperation Operation)
{
  inherited::Notification(AComponent, Operation);

  if ((Operation == opRemove) && (AComponent == FVersionInfo))
  {
    FVersionInfo = NULL;
    UpdateLabelContent();
  }
}

void __fastcall TCustomVersionInfoLabel::SetVersionInfo(TVersionInfo* Value)
{
  if (Value != FVersionInfo)
  {
    TCMVersionInfoUi NotifcationMessage = { };
    TObject* Downcast;

    NotifcationMessage.UiElement = this;

    if (FVersionInfo != NULL)
    {
      NotifcationMessage.Msg = CM_VERSIONINFOUIDETACH;
      Downcast = FVersionInfo;
      Downcast->Dispatch(&NotifcationMessage);
    }

    FVersionInfo = Value;

    if (FVersionInfo != NULL)
    {
      NotifcationMessage.Msg = CM_VERSIONINFOUIATTACH;
      Downcast = FVersionInfo;
      Downcast->Dispatch(&NotifcationMessage);
    }

    UpdateLabelContent();
  }
}

void __fastcall TCustomVersionInfoLabel::UpdateLabelContent(void)
{
  this->Perform(CM_TEXTCHANGED, 0, NativeInt(0));
}

//---------------------------------------------------------------------------

__fastcall TVersionInfoGenericLabel::TVersionInfoGenericLabel(TComponent* Owner)
  : inherited(Owner)
{
  // Do nothing in addition.
}

void __fastcall TVersionInfoGenericLabel::SetStringEntry(const String Value)
{
  FStringEntry = Value;
  UpdateLabelContent();
}

System::UnicodeString __fastcall TVersionInfoGenericLabel::GetVersionLabelText(void)
{
  System::UnicodeString Result;

  if (FStringEntry.Length() != 0)
  {
    Result = FVersionInfo->QueryStringValue(FStringEntry);
  }
  else
  {
    Result = L"(Undefined generic entry)";
  }

  return Result;
}

//---------------------------------------------------------------------------

__fastcall TVersionInfoCommentsLabel::TVersionInfoCommentsLabel(TComponent* Owner)
  : inherited(Owner)
{
  // Do nothing in addition.
}

System::UnicodeString __fastcall TVersionInfoCommentsLabel::GetVersionLabelText(void)
{
  return FVersionInfo->Comments;
}

//---------------------------------------------------------------------------

__fastcall TVersionInfoCompanyNameLabel::TVersionInfoCompanyNameLabel(TComponent* Owner)
  : inherited(Owner)
{
  // Do nothing in addition.
}

System::UnicodeString __fastcall TVersionInfoCompanyNameLabel::GetVersionLabelText(void)
{
  return FVersionInfo->CompanyName;
}

//---------------------------------------------------------------------------

__fastcall TVersionInfoFileDescriptionLabel::TVersionInfoFileDescriptionLabel(TComponent* Owner)
  : inherited(Owner)
{
  // Do nothing in addition.
}

System::UnicodeString __fastcall TVersionInfoFileDescriptionLabel::GetVersionLabelText(void)
{
  return FVersionInfo->FileDescription;
}

//---------------------------------------------------------------------------

__fastcall TVersionInfoFileVersionLabel::TVersionInfoFileVersionLabel(TComponent* Owner)
  : inherited(Owner)
{
  // Do nothing in addition.
}

System::UnicodeString __fastcall TVersionInfoFileVersionLabel::GetVersionLabelText(void)
{
  return FVersionInfo->FileVersion;
}

//---------------------------------------------------------------------------

__fastcall TVersionInfoInternalNameLabel::TVersionInfoInternalNameLabel(TComponent* Owner)
  : inherited(Owner)
{
  // Do nothing in addition.
}

System::UnicodeString __fastcall TVersionInfoInternalNameLabel::GetVersionLabelText(void)
{
  return FVersionInfo->InternalName;
}

//---------------------------------------------------------------------------

__fastcall TVersionInfoLegalCopyrightLabel::TVersionInfoLegalCopyrightLabel(TComponent* Owner)
  : inherited(Owner)
{
  // Do nothing in addition.
}

System::UnicodeString __fastcall TVersionInfoLegalCopyrightLabel::GetVersionLabelText(void)
{
  return FVersionInfo->LegalCopyright;
}

//---------------------------------------------------------------------------

__fastcall TVersionInfoLegalTrademarksLabel::TVersionInfoLegalTrademarksLabel(TComponent* Owner)
  : inherited(Owner)
{
  // Do nothing in addition.
}

System::UnicodeString __fastcall TVersionInfoLegalTrademarksLabel::GetVersionLabelText(void)
{
  return FVersionInfo->LegalTrademarks;
}

//---------------------------------------------------------------------------

__fastcall TVersionInfoOriginalFileNameLabel::TVersionInfoOriginalFileNameLabel(TComponent* Owner)
  : inherited(Owner)
{
  // Do nothing in addition.
}

System::UnicodeString __fastcall TVersionInfoOriginalFileNameLabel::GetVersionLabelText(void)
{
  return FVersionInfo->OriginalFileName;
}

//---------------------------------------------------------------------------

__fastcall TVersionInfoProductNameLabel::TVersionInfoProductNameLabel(TComponent* Owner)
  : inherited(Owner)
{
  // Do nothing in addition.
}

System::UnicodeString __fastcall TVersionInfoProductNameLabel::GetVersionLabelText(void)
{
  return FVersionInfo->ProductName;
}

//---------------------------------------------------------------------------

__fastcall TVersionInfoProductVersionLabel::TVersionInfoProductVersionLabel(TComponent* Owner)
  : inherited(Owner)
{
  // Do nothing in addition.
}

System::UnicodeString __fastcall TVersionInfoProductVersionLabel::GetVersionLabelText(void)
{
  return FVersionInfo->ProductVersion;
}

