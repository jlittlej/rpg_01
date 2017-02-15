000000170213/*------------------------------------------------------------------*/
000000170213/*                                                                  */
000000170213/*  FILE ID     : BLTINFUN               DATE       : March 29. 2005*/
000000170213/*                                                                  */
000000170213/*  SUPPLEMENTAL: Robin Gong             ORIGIN     : NEW           */
000000170213/*                                       SELF CHECK : YES           */
000000170213/*                                                                  */
000000170213/*  LIBRARY     : ECLIPSTEST             PRODUCT    : ECLIPSE       */
000000170213/*                                                                  */
000000170213/*  OBJECTIVE   : VARIOUS CL COMMANDS TO TEST BUILT-IN FUNCTIONS    */
000000170213/*                PROMPTING.  THIS IS ONLY A SAMPLE OF THE LARGE    */
000000170213/*                NUMBER OF COMMANDS.                               */
000000170213/*                                                                  */
000000170213/*------------------------------------------------------------------*/
000000170213/*PROLOG END                                                        */
000000170213/*------------------------------------------------------------------*/
000000170213/* MODIFICATION LOG                                                 */
000000170213/* MOD# PROGRAMMER           DATE     REASON                        */
000000170213/* ---- -------------------- -------- ------------------------------*/
000000170213/* $00  Robin Gong           03/29/05 CREATE                        */
000000170213/* $01  FIRST LAST           MM/DD/YY WHATEVER YOU CHANGED IT       */
000000170213/*                                    FOR - GIVE AS GOOD AN         */
000000170213/*                                    EXPLANATION AS IS REQUIRED    */
000000170213/*                                                                  */
000000170213/*                                                                  */
000000170213/*------------------------------------------------------------------*/
000000170213
000000170213/*------------------------------------------------------------------*/
000000170213/*                                                                  */
000000170213/* Declare some variables.                                          */
000000170213/*                                                                  */
000000170213/*------------------------------------------------------------------*/
000000170213
000000170213
000000170213/*    cases which work on various usage     gggg                    */
000000170213
000000170213/*    Built-in function: BIN, or BINARY                             */
000000170213             CHGVAR     &N %BINARY(&B2) /* works  */
000000170213             CHGVAR     VAR(%BIN(&B2)) VALUE(&N) /* works  */
000000170213             CHGVAR     &N VALUE(%BIN(&B2) + 4) /* works  */
000000170213             CHGVAR     %BINARY(&B2) VALUE(122.567) /* works  */
000000170213             CHGVAR     %BIN(&B4) VALUE(-45) /* works  */
000000170213             IF         COND(%BIN(&B4) *EQ 0) THEN(GOTO ENDIT) /* works */
000000170213             CHGVAR     &L %BINARY(&P 1 2) /* works  */
000000170213
000000170213/*    Built-in function: SST, or SUBSTRING    */
000000170213             CHGVAR     &C %SST(&P 3 &L) /* works  */
000000170213             CHGVAR     &X %SST(*LDA &B &C) /* works  */
000000170213             CHGVAR     &X %SUBSTRING(*LDA 2 3) /* works  */
000000170213             CHGVAR     &X %SUBSTRING(*LDA &B &C) /* works  */
000000170213             CHGVAR     VAR(&CURSW4) VALUE(%SST(&JOBSWS 4 1)) /* works  */
000000170213
000000170213/*    Built-in function: SWITCH    */
000000170213             IF         COND(%SWITCH(0X111XX0)) THEN(GOTO C) /* works  */
000000170213             CHGVAR     VAR(&A) VALUE(%SWITCH(0X111XX0)) /* works  */
000000170213             CHGVAR     VAR(&A) VALUE(%SWITCH(&B)) /* works  */
000000170213
000000170213
000000170213
000000170213
000000170213/*    cases which do not work  by invalid built-in function name   */
000000170213
000000170213/* "Built-in function %BINAR not valid."           */
000000170213/* It is promptable */
000000170213             CHGVAR     &N %BINAR(&B2)
000000170213
000000170213/* EVFCL0018E: String %"BIN" (&B2' contains a character                  */
000000170213/* that is not valid. (defect:57692)                                     */
000000170213/* It is not promptable */
000000170213             CHGVAR     %"BIN"(&B2) &N
000000170213
000000170213/* "Built-in function %SUBST not valid."          */
000000170213/* It is promptable */
000000170213             CHGVAR     &C %SUBST(&P 3 &L)
000000170213
000000170213/* "Built-in function name beginning '% SSTR(*LDA' not valid."  */
000000170213/* It is not promptable */
000000170213/* (defect:57692)                                                        */
000000170213             CHGVAR     &X % SSTR(*LDA &B &C)
000000170213
000000170213
000000170213/* "Built-function %SWT not valid."                            */
000000170213/* It is promptable */
000000170213             IF         COND(%SWT(0X111XX0)) THEN(GOTO C)
000000170213
000000170213/* EVFCL0020E: Character ',' not valid following string '%SWITCH   '.    */
000000170213/* It is not promptable */
000000170213/* (defect:57692)                                                        */
000000170213             CHGVAR     VAR(&A) VALUE(%SWITCH,(0X111XX0))
000000170213
000000170213
000000170213/*          cases which do not work by invalid built-in number of parameters +
000000170213of   built-in function*/
000000170213
000000170213/* "Built-in function %BINARY requires 3 arguments."           */
000000170213/* It is promptable */
000000170213/* (defect:57692)                                                        */
000000170213             CHGVAR     &N %BINARY(&B2 &C2)
000000170213
000000170213/* "Built-in function %BINARY requires 1 arguments."           */
000000170213/* It is promptable */
000000170213             CHGVAR     %BIN(  ) &N
000000170213
000000170213/* "Built-in function %SST requires 3 arguments."              */
000000170213/* It is promptable */
000000170213             CHGVAR     &C %SST(&P)
000000170213
000000170213/* "Built-in function %SUBTRING requires 3 arguments.         */
000000170213/* It is promptable */
000000170213             CHGVAR     &C %SUBSTRING(&P 3)
000000170213
000000170213/* "Built-in function %SST allow 3 arguments."                 */
000000170213/* It is promptable */
000000170213             CHGVAR     &C %SST(&P 3 &L 8)
000000170213
000000170213/* "Built-in function %SWITCH allows 1 arguments."             */
000000170213/* It is promptable */
000000170213             CHGVAR     VAR(&A) VALUE(%SWITCH(0X111XX0 0X101X10))
000000170213
000000170213/*          cases which do not work  by invalid built-in type of parameters +
000000170213of   built-in function*/
000000170213
000000170213/* "Variable name required for argument 1 of %BINARY."         */
000000170213/* It is promptable */
000000170213             CHGVAR     &N %BINARY(3)
000000170213             CHGVAR     &N %BINARY("TRUE")
000000170213
000000170213/* "Argument 1 of built-in function %SUBSTRING not valid."    */
000000170213/* It is promptable */
000000170213             CHGVAR     &C %SUBSTRING(100 3 &L)
000000170213
000000170213/* "Argument 3 of %SUBSTRING must be type *INT2."              */
000000170213/* It is promptable */
000000170213             CHGVAR     &C %SUBSTRING(&P 3 "CHARACTER")
000000170213
000000170213/* "Argument number 1 of %SWITCH must be length 8."            */
000000170213/* It is promptable */
000000170213             CHGVAR     VAR(&A) VALUE(%SWITCH(@#$))
000000170213
000000170213/* "Argument 1 Built-in function %SWITCH not a valid length."  */
000000170213/* It is promptable */
000000170213             CHGVAR     VAR(&A) VALUE(%SWITCH(0XX11XX11))
000000170213
000000170213/* "Argument number 1 of %SWITCH must be length 8."            */
000000170213/* It is promptable */
000000170213             CHGVAR     VAR(&A) VALUE(%SWITCH(0.8))
000000170213
000000170213
