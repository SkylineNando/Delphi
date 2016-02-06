/*
 * Copyright 1986-2010 Embarcadero Technologies, Inc. 
 * All rights reserved.
 */
#if defined __STDC__ || defined __BORLANDC__ || defined _MSC_VER
#define args		args
#define ARG(type, arg)		type arg
#define ARGLIST(arg)
#else
#define args		()
#define ARG(type, arg)		arg
#define ARGLIST(arg)	arg;
#endif

#if defined __BORLANDC__
#define EXPORT _export
#else
#define EXPORT
#endif

#define ERREXIT(status, rc)	{isc_print_status(status); return rc;}
