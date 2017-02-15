000000170213/*------------------------------------------------------------------*/
000000170213/*                                                                  */
000000170213/*  FILE ID     : CODEV5R4               DATE       : NOV.01 2005   */
000000170213/*                                                                  */
000000170213/*  PROGRAMMER  : Robin Gong             ORIGIN     : NEW           */
000000170213/*                                       SELF CHECK : YES           */
000000170213/*                                                                  */
000000170213/*  LIBRARY     : ECLIPSTEST             PRODUCT    : ECLIPSE       */
000000170213/*                                                                  */
000000170213/*  OBJECTIVE   : VARIOUS CL COMMANDS TO TEST NEW OPCODE FORMAT     */
000000170213/*                                                                  */
000000170213/*                                                                  */
000000170213/*                                                                  */
000000170213/*------------------------------------------------------------------*/
000000170213/* PROLOG END                                                       */
000000170213/*------------------------------------------------------------------*/
000000170213/* MODIFICATION LOG                                                 */
000000170213/* MOD# PROGRAMMER           DATE     REASON                        */
000000170213/* ---- -------------------- -------- ------------------------------*/
000000170213/* $00  ROBIN GONG           11/01/05 CREATE                        */
000000170213/* $01  FIRST LAST           MM/DD/YY WHATEVER YOU CHANGED IT       */
000000170213/*                                    FOR - GIVE AS GOOD AN         */
000000170213/*                                    EXPLANATION AS IS REQUIRED    */
000000170213/*                                                                  */
000000170213/*                                                                  */
000000170213/*------------------------------------------------------------------*/
000000170213
000000170213
000000170213             PGM
000000170213             DCL        &RTNVAL TYPE(*INT) LEN(4)
000000170213             MAIN       MODULE CODE
000000170213             CALLSUBR   SUBR(SUBRNAME2) RTNVAL(&RTNVAL)
000000170213             GOTO       LBL0 /* valid, goes to CHGVAR */
000000170213             GOTO       CMDLBL(SLBL1) /* Invalid.  Label not found error. */
000000170213             GOTO       SLBL3 /* invalid.  Label not found error. */
000000170213 LBL0:       CHGVAR     VAR(&RTNVAL) VALUE(-1) /* Jumps to ENDPGM */
000000170213             SELECT
000000170213             ENDSELECT
000000170213
000000170213
000000170213             SUBR       SUBRNAME2
000000170213                CALLPRC    TEST /* valid label  labels are local to subroutine*/
000000170213                CALLSUBR   SUBRNAME1 /* valid */
000000170213                GOTO       SLBL6 /* invalid.  Outside of current subroutine */
000000170213                IF         ( COND ) RTNSUBR RTNVAL(-1)
000000170213                CLRLIB     QTEMP
000000170213             ENDSUBR
000000170213
000000170213 LBL5:       SUBR       SUBRNAME2
000000170213                CALLPRC    TEST /* valid label  labels are local to subroutine */
000000170213                CALLSUBR   SUBRNAME1 /* valid */
000000170213                GOTO       SLBL6 /* invalid.  Outside of current subroutine */
000000170213                IF         ( COND ) RTNSUBR RTNVAL(-1)
000000170213                CLRLIB     QTEMP
000000170213             ENDSUBR
000000170213
000000170213 LBL6:       SUBR       SUBRNAME2
000000170213                CALLPRC    TEST /* valid label  labels are local to subroutine */
000000170213                CALLSUBR   SUBRNAME1 /* valid */
000000170213                GOTO       SLBL6 /* invalid.  Outside of current subroutine */
000000170213                IF         ( COND ) RTNSUBR RTNVAL(-1)
000000170213                CLRLIB     QTEMP
000000170213             ENDSUBR
000000170213
000000170213 LBL0:
000000170213 SLBL1:      SUBR       SUBRNAME1
000000170213 SLBL3:         CALLPRC    CODE
000000170213                GOTO       SLBL1 /* valid.  */
000000170213                GOTO       SLBL3 /* valid.  Will GOTO this subroutines label Sl */
000000170213                IF         (&VAR1>5) THEN(DO)
000000170213                   CLRLIB     TEMP
000000170213                   OTHERWISE
000000170213                ENDDO
000000170213                DOWHILE    COND(&A > 6)
000000170213                   CHGVAR     &A (&A+1)
000000170213                ENDDO
000000170213                DOFOR      VAR(&A) FROM(1) TO(100) /* comments */
000000170213 ldutl:            DOUNTIL    COND(true) /* DOUTIL */
000000170213                      LEAVE
000000170213                   enddo
000000170213                enddo
000000170213                GOTO       LBL0 /* valid.  Goes to top of subroutine */
000000170213 SLBL6:         dsplib     QGPL
000000170213                RETURN
000000170213                DSPLIBL    OUPUT(*PRINT) /*                MORE       SUBROUTINE*/
000000170213             ENDSUBR
000000170213 LBL5:        /* valid.  Counted as label on SUBR Subrname2*/
000000170213/* comments are OK */
000000170213 SLBL2:      SUBR       SUBRNAME2
000000170213 SLBL3:         CALLPRC    TEST /* valid label  labels are local to subroutine*/
000000170213                CALLSUBR   SUBRNAME1 /* valid */
000000170213                GOTO       SLBL6 /* invalid.  Outside of current subroutine */
000000170213                IF         ( COND ) RTNSUBR RTNVAL(-1)
000000170213                ITERATE
000000170213                WHEN       COND(&A) THEN(CALLSUBR SUBRNAME1)
000000170213                RTNSUBR    RTNVAL(-1)
000000170213                CLRLIB     QTEMP
000000170213             ENDSUBR
000000170213 ENDLBL:     ENDPGM      /* label valid on ENDPGM, can be target of GOTO in main
