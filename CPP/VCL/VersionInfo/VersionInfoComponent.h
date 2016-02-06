
#ifndef VersionInfoComponentH
#define VersionInfoComponentH

#include <SysUtils.hpp>
#include <Controls.hpp>
#include <Classes.hpp>

static const Word CM_VERSIONINFOBASE = 0xf000;
static const Word CM_VERSIONINFOCHANGE = CM_VERSIONINFOBASE + 0;
static const Word CM_VERSIONINFOUIATTACH = CM_VERSIONINFOBASE + 1;
static const Word CM_VERSIONINFOUIDETACH = CM_VERSIONINFOBASE + 2;

#pragma pack(push, 1)

struct TCMVersionInfoUi
{
  unsigned int Msg;
  TObject* UiElement;
};

struct TCMVersionInfoComponent
{
  unsigned int Msg;
  TObject* Component;
};

#pragma pack(pop)


class PACKAGE TVersionInfo : public TComponent
{
  private:
    typedef TComponent inherited;

  private:
	UnicodeString FFileName;
    bool FEnabled;
    Classes::TNotifyEvent FOnChange;

    void* FFileVersionInfoData;

    DWORD __fastcall GetFileVersionMajor(void) const;
    DWORD __fastcall GetFileVersionMinor(void) const;
    DWORD __fastcall GetFileVersionRelease(void) const;
    DWORD __fastcall GetFileVersionBuild(void) const;

    DWORD __fastcall GetProductVersionMajor(void) const;
    DWORD __fastcall GetProductVersionMinor(void) const;
    DWORD __fastcall GetProductVersionRelease(void) const;
    DWORD __fastcall GetProductVersionBuild(void) const;

	UnicodeString  __fastcall GetComments(void) const;
	UnicodeString __fastcall GetCompanyName(void) const;
	UnicodeString __fastcall GetFileDescription(void) const;
	UnicodeString __fastcall GetFileVersion(void) const;
	UnicodeString __fastcall GetInternalName(void) const;
	UnicodeString __fastcall GetLegalCopyright(void) const;
	UnicodeString __fastcall GetLegalTrademarks(void) const;
	UnicodeString __fastcall GetOriginalFileName(void) const;
	UnicodeString __fastcall GetProductName(void) const;
	UnicodeString __fastcall GetProductVersion(void) const;

    TDateTime __fastcall GetFileDate(void) const;

    bool __fastcall GetIsDebugBuild(void) const;
    bool __fastcall GetIsDll(void) const;
    bool __fastcall GetIsPatched(void) const;
    bool __fastcall GetIsPreRelease(void) const;
    bool __fastcall GetIsPrivateBuild(void) const;
    bool __fastcall GetIsSpecialBuild(void) const;

    __int64 __fastcall GetRawFileVersion(void) const;
    __int64 __fastcall GetRawProductVersion(void) const;
    FILETIME __fastcall GetRawFileDate(void) const;

    void __fastcall SetDummyBool(const bool) const { /* Do nothing */ };
    void __fastcall SetDummyDWORD(const DWORD) const { /* Do nothing */ };
    void __fastcall SetDummyInt(const int) const { /* Do nothing */ };
    void __fastcall SetDummyString(const String&) const { /* Do nothing */ };
    void __fastcall SetDummyTDateTime(const TDateTime) const { /* Do nothing */ };

  private:
    TList* FUiElements;

    void __fastcall CMVersionInfoUiAttach(TCMVersionInfoUi& Message);
    void __fastcall CMVersionInfoUiDetach(TCMVersionInfoUi& Message);

    BEGIN_MESSAGE_MAP
      VCL_MESSAGE_HANDLER(CM_VERSIONINFOUIATTACH, TCMVersionInfoUi, CMVersionInfoUiAttach)
      VCL_MESSAGE_HANDLER(CM_VERSIONINFOUIDETACH, TCMVersionInfoUi, CMVersionInfoUiDetach)
    END_MESSAGE_MAP(inherited)

  private:
    bool FHasVersionInfo;

    void __fastcall InitializeFixedFileInfoField(void);

    TStrings* FTranslations;
    void __fastcall InitializeTranslationTable(void);

	UnicodeString __fastcall BuildStringFileInfo(const UnicodeString& StringName) const;

  protected:
    // We cache the fixed file information for efficiency
    bool FHasValidFixedFileInfo;
    VS_FIXEDFILEINFO FFixedFileInfo;

    virtual void __fastcall ClearVersionInfoData(void);
	virtual void __fastcall FreeVersionInfoMemory(void);
    virtual void __fastcall ReadVersionInfoFromFile(void);

	virtual void __fastcall SetFileName(const UnicodeString AFileName);
	virtual void __fastcall SetEnabled(const bool Value);
	virtual void __fastcall DoChanged(void);

	int FLanguageCharsetIndex;

    virtual String __fastcall GetAboutBoxString(void) const;

  public:
    __fastcall TVersionInfo(TComponent* Owner);
    virtual __fastcall ~TVersionInfo(void);

	bool __fastcall QueryValue(const UnicodeString& SubBlock, LPVOID& Buffer,
	  unsigned int& BufferLength) const;
	UnicodeString __fastcall QueryStringValue(const UnicodeString& SubBlock) const;

    virtual void __fastcall ShowAboutBox(void) const;

    // Pure VERSIONINFO data.
    // This is RAW data from the fixed version information block (VS_FIXEDFILEINFO)
    __property __int64 RawFileVersion = { read = GetRawFileVersion };
    __property __int64 RawProductVersion = { read = GetRawProductVersion };
    __property FILETIME RawFileDate = { read = GetRawFileDate };

    __property DWORD FileVersionMS = { read = FFixedFileInfo.dwFileVersionMS };
    __property DWORD FileVersionLS = { read = FFixedFileInfo.dwFileVersionLS };
    __property DWORD ProductVersionMS = { read = FFixedFileInfo.dwProductVersionMS };
    __property DWORD ProductVersionLS = { read = FFixedFileInfo.dwProductVersionLS };

    __property DWORD FileFlagsMask = { read = FFixedFileInfo.dwFileFlagsMask};
    __property DWORD FileFlags = { read = FFixedFileInfo.dwFileFlags };
    __property DWORD FileOS = { read = FFixedFileInfo.dwFileOS };
    __property DWORD FileType = { read = FFixedFileInfo.dwFileType };
    __property DWORD FileSubtype = { read = FFixedFileInfo.dwFileSubtype };

    __property TStrings* Translations = { read = FTranslations };

	static UnicodeString __fastcall GetCurrentModuleFileName(void);
	static UnicodeString __fastcall TranslateVersionLanguageName(DWORD Language);

  __published:

	__property bool Enabled = { read = FEnabled, write = SetEnabled };
	__property UnicodeString FileName = { read = FFileName, write = SetFileName };

	// Properties related to the translations part
    // of the VERSIONINFO resource
    __property int LanguageCharsetIndex = { read = FLanguageCharsetIndex, write = FLanguageCharsetIndex, stored = false };

    // Query some state information
    __property bool HasVersionInfo = { read = FHasVersionInfo, write = SetDummyBool, stored = false };

    // Pure VERSIONINFO data.
    // This is data from the fixed version information block (VS_FIXEDFILEINFO)
    __property DWORD FileVersionMajor = { read = GetFileVersionMajor, write = SetDummyDWORD, stored = false };
    __property DWORD FileVersionMinor = { read = GetFileVersionMinor, write = SetDummyDWORD, stored = false };
    __property DWORD FileVersionRelease = { read = GetFileVersionRelease, write = SetDummyDWORD, stored = false };
    __property DWORD FileVersionBuild = { read = GetFileVersionBuild, write = SetDummyDWORD, stored = false };

    __property DWORD ProductVersionMajor = { read = GetProductVersionMajor, write = SetDummyDWORD, stored = false };
    __property DWORD ProductVersionMinor = { read = GetProductVersionMinor, write = SetDummyDWORD, stored = false };
    __property DWORD ProductVersionRelease = { read = GetProductVersionRelease, write = SetDummyDWORD, stored = false };
    __property DWORD ProductVersionBuild = { read = GetProductVersionBuild, write = SetDummyDWORD, stored = false };

    __property bool IsDebugBuild = { read = GetIsDebugBuild, write = SetDummyBool, stored = false };
    __property bool IsDll = { read = GetIsDll, write = SetDummyBool, stored = false };
    __property bool IsPatched = { read = GetIsPatched, write = SetDummyBool, stored = false };
    __property bool IsPreRelease = { read = GetIsPreRelease, write = SetDummyBool, stored = false };
    __property bool IsPrivateBuild = { read = GetIsPrivateBuild, write = SetDummyBool, stored = false };
    __property bool IsSpecialBuild = { read = GetIsSpecialBuild, write = SetDummyBool, stored = false };

    __property TDateTime FileDate = { read = GetFileDate, write = SetDummyTDateTime, stored = false };

    // Pure VERSIONINFO data.
    // The following string items are pre-defined by the Win32 API.
	__property UnicodeString CompanyName = { read = GetCompanyName, write = SetDummyString, stored = false };
	__property UnicodeString FileDescription = { read = GetFileDescription, write = SetDummyString, stored = false };
	__property UnicodeString FileVersion = { read = GetFileVersion, write = SetDummyString, stored = false };
	__property UnicodeString InternalName = { read = GetInternalName, write = SetDummyString, stored = false };
	__property UnicodeString LegalCopyright = { read = GetLegalCopyright, write = SetDummyString, stored = false };
	__property UnicodeString OriginalFileName = { read = GetOriginalFileName, write = SetDummyString, stored = false };
	__property UnicodeString ProductName = { read = GetProductName, write = SetDummyString, stored = false };
	__property UnicodeString ProductVersion = { read = GetProductVersion, write = SetDummyString, stored = false };

	// Pure VERSIONINFO data.
	// The following string items are commonly used.
	__property UnicodeString LegalTrademarks = { read = GetLegalTrademarks, write = SetDummyString, stored = false };
	__property UnicodeString Comments = { read = GetComments, write = SetDummyString, stored = false };

    // Events
    __property Classes::TNotifyEvent OnChange = { read = FOnChange, write = FOnChange};

};


// In order to be able to communicate with
// design-time code without actually linking
// to it statically, we need to provide a
// way for the design-time code to "install"
// itself into the component.
// This hook is set from
//    VersionInfoRegistration.cpp
//typedef
//  void __fastcall(* TDesignTimeHook)(void);

//extern PACKAGE TDesignTimeHook DesignTimeHook;


#endif // VersionInfoComponentH

