//---------------------------------------------------------------------------
// C++Builder
// Copyright (c) 1995-2010 Embarcadero Technologies, Inc.
//---------------------------------------------------------------------------
#ifndef IBRegHPP
#define IBRegHPP
//----------------------------------------------------------------------------
#include <propsys.h>  // Ensure IPropertyDescription is seen before designintf.hpp brings a new declaration of the same name

#include <DB.hpp>
#include <Classes.hpp>
#include <DesignIntf.hpp>
#include <DesignEditors.hpp>
#include <SysUtils.hpp>
#include <System.hpp>

#include "ibctrls.h"
#include "ibevnts.h"
#include "ibproc32.h"

namespace Ibreg
{
//-- type declarations -------------------------------------------------------
class PACKAGE TIBEventListProperty : public TClassProperty
{
public:
	virtual TPropertyAttributes __fastcall GetAttributes(void);
	virtual void __fastcall Edit(void);
public:
	__fastcall virtual ~TIBEventListProperty(void);
	__fastcall TIBEventListProperty(const Designintf::_di_IDesigner ADesigner, int APropCount);
};

//-- var, const, procedure ---------------------------------------------------
extern void __fastcall Register(void);
//-- end unit ----------------------------------------------------------------
} //namespace ibreg

#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Ibreg;
#endif

#endif	// IBReg
