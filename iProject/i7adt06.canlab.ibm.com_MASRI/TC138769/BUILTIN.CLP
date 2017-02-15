/*------------------------------------------------------------------*/
/*                                                                  */
/*  FILE ID     : BLTINFUN               DATE       : March 29. 2005*/
/*                                                                  */
/*  SUPPLEMENTAL: Robin Gong             ORIGIN     : NEW           */
/*                                       SELF CHECK : YES           */
/*                                                                  */
/*  LIBRARY     : ECLIPSTEST             PRODUCT    : ECLIPSE       */
/*                                                                  */
/*  OBJECTIVE   : VARIOUS CL COMMANDS TO TEST BUILT-IN FUNCTIONS    */
/*                PROMPTING.  THIS IS ONLY A SAMPLE OF THE LARGE    */
/*                NUMBER OF COMMANDS.                               */
/*                                                                  */
/*------------------------------------------------------------------*/
/*PROLOG END                                                        */
/*------------------------------------------------------------------*/
/* MODIFICATION LOG                                                 */
/* MOD# PROGRAMMER           DATE     REASON                        */
/* ---- -------------------- -------- ------------------------------*/
/* $00  Robin Gong           03/29/05 CREATE                        */
/* $01  FIRST LAST           MM/DD/YY WHATEVER YOU CHANGED IT       */
/*                                    FOR - GIVE AS GOOD AN         */
/*                                    EXPLANATION AS IS REQUIRED    */
/*                                                                  */
/*                                                                  */
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
/*                                                                  */
/* Declare some variables.                                          */
/*                                                                  */
/*------------------------------------------------------------------*/


/*    cases which work on various usage     gggg                    */

/*    Built-in function: BIN, or BINARY                             */
             CHGVAR     &N %BINARY(&B2) /* works  */
             CHGVAR     VAR(%BIN(&B2)) VALUE(&N) /* works  */
             CHGVAR     &N VALUE(%BIN(&B2) + 4) /* works  */
             CHGVAR     %BINARY(&B2) VALUE(122.567) /* works  */
             CHGVAR     %BIN(&B4) VALUE(-45) /* works  */
             IF         COND(%BIN(&B4) *EQ 0) THEN(GOTO ENDIT) /* works */
             CHGVAR     &L %BINARY(&P 1 2) /* works  */

/*    Built-in function: SST, or SUBSTRING    */
             CHGVAR     &C %SST(&P 3 &L) /* works  */
             CHGVAR     &X %SST(*LDA &B &C) /* works  */
             CHGVAR     &X %SUBSTRING(*LDA 2 3) /* works  */
             CHGVAR     &X %SUBSTRING(*LDA &B &C) /* works  */
             CHGVAR     VAR(&CURSW4) VALUE(%SST(&JOBSWS 4 1)) /* works  */

/*    Built-in function: SWITCH    */
             IF         COND(%SWITCH(0X111XX0)) THEN(GOTO C) /* works  */
             CHGVAR     VAR(&A) VALUE(%SWITCH(0X111XX0)) /* works  */
             CHGVAR     VAR(&A) VALUE(%SWITCH(&B)) /* works  */




/*    cases which do not work  by invalid built-in function name   */

/* "Built-in function %BINAR not valid."           */
/* It is promptable */
             CHGVAR     &N %BINAR(&B2)

/* EVFCL0018E: String %"BIN" (&B2' contains a character                  */
/* that is not valid. (defect:57692)                                     */
/* It is not promptable */
             CHGVAR     %"BIN"(&B2) &N

/* "Built-in function %SUBST not valid."          */
/* It is promptable */
             CHGVAR     &C %SUBST(&P 3 &L)

/* "Built-in function name beginning '% SSTR(*LDA' not valid."  */
/* It is not promptable */
/* (defect:57692)                                                        */
             CHGVAR     &X % SSTR(*LDA &B &C)


/* "Built-function %SWT not valid."                            */
/* It is promptable */
             IF         COND(%SWT(0X111XX0)) THEN(GOTO C)

/* EVFCL0020E: Character ',' not valid following string '%SWITCH   '.    */
/* It is not promptable */
/* (defect:57692)                                                        */
             CHGVAR     VAR(&A) VALUE(%SWITCH,(0X111XX0))


/*          cases which do not work by invalid built-in number of parameters +
of   built-in function*/

/* "Built-in function %BINARY requires 3 arguments."           */
/* It is promptable */
/* (defect:57692)                                                        */
             CHGVAR     &N %BINARY(&B2 &C2)

/* "Built-in function %BINARY requires 1 arguments."           */
/* It is promptable */
             CHGVAR     %BIN(  ) &N

/* "Built-in function %SST requires 3 arguments."              */
/* It is promptable */
             CHGVAR     &C %SST(&P)

/* "Built-in function %SUBTRING requires 3 arguments.         */
/* It is promptable */
             CHGVAR     &C %SUBSTRING(&P 3)

/* "Built-in function %SST allow 3 arguments."                 */
/* It is promptable */
             CHGVAR     &C %SST(&P 3 &L 8)

/* "Built-in function %SWITCH allows 1 arguments."             */
/* It is promptable */
             CHGVAR     VAR(&A) VALUE(%SWITCH(0X111XX0 0X101X10))

/*          cases which do not work  by invalid built-in type of parameters +
of   built-in function*/

/* "Variable name required for argument 1 of %BINARY."         */
/* It is promptable */
             CHGVAR     &N %BINARY(3)
             CHGVAR     &N %BINARY("TRUE")

/* "Argument 1 of built-in function %SUBSTRING not valid."    */
/* It is promptable */
             CHGVAR     &C %SUBSTRING(100 3 &L)

/* "Argument 3 of %SUBSTRING must be type *INT2."              */
/* It is promptable */
             CHGVAR     &C %SUBSTRING(&P 3 "CHARACTER")

/* "Argument number 1 of %SWITCH must be length 8."            */
/* It is promptable */
             CHGVAR     VAR(&A) VALUE(%SWITCH(@#$))

/* "Argument 1 Built-in function %SWITCH not a valid length."  */
/* It is promptable */
             CHGVAR     VAR(&A) VALUE(%SWITCH(0XX11XX11))

/* "Argument number 1 of %SWITCH must be length 8."            */
/* It is promptable */
             CHGVAR     VAR(&A) VALUE(%SWITCH(0.8))


