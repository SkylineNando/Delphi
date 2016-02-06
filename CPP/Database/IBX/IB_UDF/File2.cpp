//---------------------------------------------------------------------------

// This software is Copyright (c) 2013 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.
//---------------------------------------------------------------------------

//   Important note about DLL memory management when your DLL uses the
//   static version of the RunTime Library:
//
//   If your DLL exports any functions that pass String objects (or structs/
//   classes containing nested Strings) as parameter or function results,
//   you will need to add the library MEMMGR.LIB to both the DLL project and
//   any other projects that use the DLL.  You will also need to use MEMMGR.LIB
//   if any other projects which use the DLL will be performing new or delete
//   operations on any non-TObject-derived classes which are exported from the
//   DLL. Adding MEMMGR.LIB to your project will change the DLL and its calling
//   EXE's to use the BORLNDMM.DLL as their memory manager.  In these cases,
//   the file BORLNDMM.DLL should be deployed along with your DLL.
//
//   To avoid using BORLNDMM.DLL, pass string information using "char *" or
//   ShortString parameters.
//
//   If your DLL uses the dynamic version of the RTL, you do not need to
//   explicitly add MEMMGR.LIB as this will be done implicitly for you

#pragma hdrstop
#pragma argsused

#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <math.h>
#include <ibase.h>
#include <ib_util.h>
#include "example.h"

#define BADVAL -9999L
#define MYBUF_LEN 15		/* number of chars to get for */

#ifdef __cplusplus
extern "C" {
#endif

/*===============================================================
 fn_lower_c() - Puts its argument longo lower case, for C programs
 Input is of VARCHAR, output is of CSTRING.
 Not international or non-ascii friendly.
================================================================= */
char* EXPORT fn_lower_c (ARG(char*, s));

char* EXPORT fn_lower_c (ARG(char*, s))
ARGLIST(char *s)			/* VARCHAR input */
{
	char *buf;
	short length = 0;
	char *buffer = (char *)ib_util_malloc(256);
	length = (short)*s;
	s += 2;
	buf = buffer;
	while (*s)
		if (*s >= 'A' && *s <= 'Z')
			*buf++ = *s++ - 'A' + 'a';
		else
			*buf++ = *s++;
	*buf = '\0';
	buffer [length] = '\0';
	return buffer;
}
#ifdef __cplusplus
}
#endif
