/*
 * Macros which cannot be declared before inclusion of system headers from config.h
 * (say, #define mkdir rpl_mkdir) due to conflicts arising from it, are declared here.
 */


#define ctime rpl_ctime
