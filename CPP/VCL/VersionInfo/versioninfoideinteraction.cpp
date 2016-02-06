
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

#include <ToolsApi.Hpp>

#include "VersionInfoIdeInteraction.h"

#define NDEBUG
#include <cassert>

#pragma package(smart_init)

static _di_IOTAProjectGroup GetProjectGroup(const _di_IOTAModuleServices& IModuleServices)
{
  assert(IModuleServices);

  int ModuleCount = IModuleServices->GetModuleCount();

  _di_IOTAProjectGroup Result;
  for (int i = 0; i < ModuleCount; ++i)
  {
    _di_IOTAModule IModule;
    IModule = IModuleServices->GetModule(i);
    assert(IModule != NULL);

    if (Supports(IModule, __uuidof(IOTAProjectGroup),
                 &Result))
      break;
  }

  assert(Result);
  return Result;
}

bool __fastcall ConfirmInclusionOfVersionInfo(void)
{
  bool Result;

  Result = (MessageDlg( "Currently version information data is not included " \
                        "into your compiled binary.\n" \
                        "\n" \
                        "Do you enable inclusion of this into the binary?",
                        mtConfirmation,
                        TMsgDlgButtons() << mbYes << mbNo,
                        0 ) == mrYes);

  return Result;
}

void __fastcall EnableVersionInfoInIDE(void)
{
  const UnicodeString IncludeVersionInfoSetting = L"IncludeVersionInfo";

  _di_IOTAModuleServices ModuleServices;
  if (Supports(BorlandIDEServices, __uuidof(IOTAModuleServices),
               &ModuleServices))
  {
    _di_IOTAProjectGroup IProjectGroup;
    IProjectGroup = GetProjectGroup(ModuleServices);

    _di_IOTAProject IProject;
    IProject = IProjectGroup->GetActiveProject();
    assert(IProject != NULL);

    _di_IOTAProjectOptions IProjectOptions;
    IProjectOptions = IProject->GetProjectOptions();
    assert(IProjectOptions != NULL);

#ifdef _WIN64 // FIXME
    Variant v = IProjectOptions->GetOptionValue(IncludeVersionInfoSetting);
    bool VersionInfoInProject = v.operator bool();
#else
    bool VersionInfoInProject = IProjectOptions->GetOptionValue(IncludeVersionInfoSetting);
#endif
    if (!VersionInfoInProject)
    {
      if (ConfirmInclusionOfVersionInfo())
        IProjectOptions->SetOptionValue(IncludeVersionInfoSetting, true);
    }
  }
}

