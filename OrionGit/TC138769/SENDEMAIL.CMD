000000170213/*********************************************************************/
000000170213/* DIRECTIVES-                                                       */
000000170213/* PARM TEXT('SEND AN E-MAIL MESSAGE')                               */
000000170213/* PARM PGM(SNDEMAILC)                                               */
000000170213/*********************************************************************/
000000170213             CMD        PROMPT('SEND AN E-MAIL MESSAGE')
000000170213             PARM       KWD(ADDRESSEE) TYPE(ELEM1) MIN(1) MAX(15) +
000000170213                          CHOICE(*NONE) PROMPT('RECIPIENT(S)' 2)
000000170213             PARM       KWD(SUBJECT) TYPE(*CHAR) LEN(256) DFT(*NONE) +
000000170213                          SPCVAL((*NONE '')) EXPR(*YES) +
000000170213                          PROMPT('SUBJECT')
000000170213             PARM       KWD(FILENAME) TYPE(*PNAME) LEN(256) +
000000170213                          DFT(*NONE) SNGVAL((*NONE)) MAX(30) +
000000170213                          EXPR(*YES) PROMPT('FILE ATTACHMENT')
000000170213             PARM       KWD(MESSAGE) TYPE(*CHAR) LEN(512) +
000000170213                          DFT(*NONE) SPCVAL((*NONE '')) EXPR(*YES) +
000000170213                          PROMPT('MESSAGE')
000000170213             PARM       KWD(EMAILTYPE) TYPE(*CHAR) LEN(10) +
000000170213                          DFT(*MIME) EXPR(*YES) PROMPT('E-MAIL TYPE' 1)
000000170213             PARM       KWD(SENDER) TYPE(ELEM2) DFT(*NETWORK) +
000000170213                          SNGVAL((*NETWORK)) PROMPT('SENDER' 3)
000000170213
000000170213             PARM       KWD(EXTENSION) TYPE(*CHAR) LEN(4) RSTD(*YES) +
000000170213                          DFT(*NO) VALUES(*NO *YES) PROMPT('Email +
000000170213                          Body File Extension') /* Read Extension +
000000170213                          file to add to Body of Message */
000000170213
000000170213             PARM       KWD(PLACEMSG) TYPE(*CHAR) LEN(7) RSTD(*YES) +
000000170213                          DFT(*AFTER) VALUES(*BEFORE *AFTER) +
000000170213                          PROMPT('Place Message in Body') /* +
000000170213                          Place Message before or after Body of +
000000170213                          Extension */
000000170213
000000170213 ELEM1:      ELEM       TYPE(*PNAME) LEN(256) MIN(1) EXPR(*YES) +
000000170213                          PROMPT('E-MAIL ADDRESS OF RECIPIENT')
000000170213             ELEM       TYPE(*CHAR) LEN(256) DFT(*NONE) +
000000170213                          SPCVAL((*NONE '')) EXPR(*YES) +
000000170213                          PROMPT('NAME OF E-MAIL RECIPIENT')
000000170213             ELEM       TYPE(*CHAR) LEN(1) DFT(*PRI) SPCVAL((*PRI +
000000170213                          '0') (*CC '1') (*BCC '2')) EXPR(*YES) +
000000170213                          PROMPT('RECIPIENT TYPE')
000000170213 ELEM2:      ELEM       TYPE(*PNAME) LEN(255) EXPR(*YES) +
000000170213                          PROMPT('E-MAIL ADDRESS OF SENDER')
000000170213             ELEM       TYPE(*CHAR) LEN(256) EXPR(*YES) PROMPT('NAME +
000000170213                          OF E-MAIL SENDER')
000000170213
000000170213
