/*------------------------------------------------------------------*/
/*                                                                  */
/*  FILE ID     : CODEV5R4               DATE       : NOV.01 2005   */
/*                                                                  */
/*  PROGRAMMER  : Robin Gong             ORIGIN     : NEW           */
/*                                       SELF CHECK : YES           */
/*                                                                  */
/*  LIBRARY     : ECLIPSTEST             PRODUCT    : ECLIPSE       */
/*                                                                  */
/*  OBJECTIVE   : VARIOUS CL COMMANDS TO TEST NEW OPCODE FORMAT     */
/*                                                                  */
/*                                                                  */
/*                                                                  */
/*------------------------------------------------------------------*/
/* PROLOG END                                                       */
/*------------------------------------------------------------------*/
/* MODIFICATION LOG                                                 */
/* MOD# PROGRAMMER           DATE     REASON                        */
/* ---- -------------------- -------- ------------------------------*/
/* $00  ROBIN GONG           11/01/05 CREATE                        */
/* $01  FIRST LAST           MM/DD/YY WHATEVER YOU CHANGED IT       */
/*                                    FOR - GIVE AS GOOD AN         */
/*                                    EXPLANATION AS IS REQUIRED    */
/*                                                                  */
/*                                                                  */
/*------------------------------------------------------------------*/


             PGM
             DCL        &RTNVAL TYPE(*INT) LEN(4)
             MAIN       MODULE CODE
             CALLSUBR   SUBR(SUBRNAME2) RTNVAL(&RTNVAL)
             GOTO       LBL0 /* valid, goes to CHGVAR */
             GOTO       CMDLBL(SLBL1) /* Invalid.  Label not found error. */
             GOTO       SLBL3 /* invalid.  Label not found error. */
 LBL0:       CHGVAR     VAR(&RTNVAL) VALUE(-1) /* Jumps to ENDPGM */
             SELECT
             ENDSELECT


             SUBR       SUBRNAME2
                CALLPRC    TEST /* valid label  labels are local to subroutine*/
                CALLSUBR   SUBRNAME1 /* valid */
                GOTO       SLBL6 /* invalid.  Outside of current subroutine */
                IF         ( COND ) RTNSUBR RTNVAL(-1)
                CLRLIB     QTEMP
             ENDSUBR

 LBL5:       SUBR       SUBRNAME2
                CALLPRC    TEST /* valid label  labels are local to subroutine */
                CALLSUBR   SUBRNAME1 /* valid */
                GOTO       SLBL6 /* invalid.  Outside of current subroutine */
                IF         ( COND ) RTNSUBR RTNVAL(-1)
                CLRLIB     QTEMP
             ENDSUBR

 LBL6:       SUBR       SUBRNAME2
                CALLPRC    TEST /* valid label  labels are local to subroutine */
                CALLSUBR   SUBRNAME1 /* valid */
                GOTO       SLBL6 /* invalid.  Outside of current subroutine */
                IF         ( COND ) RTNSUBR RTNVAL(-1)
                CLRLIB     QTEMP
             ENDSUBR

 LBL0:
 SLBL1:      SUBR       SUBRNAME1
 SLBL3:         CALLPRC    CODE
                GOTO       SLBL1 /* valid.  */
                GOTO       SLBL3 /* valid.  Will GOTO this subroutines label Sl */
                IF         (&VAR1>5) THEN(DO)
                   CLRLIB     TEMP
                   OTHERWISE
                ENDDO
                DOWHILE    COND(&A > 6)
                   CHGVAR     &A (&A+1)
                ENDDO
                DOFOR      VAR(&A) FROM(1) TO(100) /* comments */
 ldutl:            DOUNTIL    COND(true) /* DOUTIL */
                      LEAVE
                   enddo
                enddo
                GOTO       LBL0 /* valid.  Goes to top of subroutine */
 SLBL6:         dsplib     QGPL
                RETURN
                DSPLIBL    OUPUT(*PRINT) /*                MORE       SUBROUTINE*/
             ENDSUBR
 LBL5:        /* valid.  Counted as label on SUBR Subrname2*/
/* comments are OK */
 SLBL2:      SUBR       SUBRNAME2
 SLBL3:         CALLPRC    TEST /* valid label  labels are local to subroutine*/
                CALLSUBR   SUBRNAME1 /* valid */
                GOTO       SLBL6 /* invalid.  Outside of current subroutine */
                IF         ( COND ) RTNSUBR RTNVAL(-1)
                ITERATE
                WHEN       COND(&A) THEN(CALLSUBR SUBRNAME1)
                RTNSUBR    RTNVAL(-1)
                CLRLIB     QTEMP
             ENDSUBR
 ENDLBL:     ENDPGM      /* label valid on ENDPGM, can be target of GOTO in main
