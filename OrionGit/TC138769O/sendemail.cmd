/*********************************************************************/
/* DIRECTIVES-                                                       */
/* PARM TEXT('SEND AN E-MAIL MESSAGE')                               */
/* PARM PGM(SNDEMAILC)                                               */
/*********************************************************************/
             CMD        PROMPT('SEND AN E-MAIL MESSAGE')
             PARM       KWD(ADDRESSEE) TYPE(ELEM1) MIN(1) MAX(15) +
                          CHOICE(*NONE) PROMPT('RECIPIENT(S)' 2)
             PARM       KWD(SUBJECT) TYPE(*CHAR) LEN(256) DFT(*NONE) +
                          SPCVAL((*NONE '')) EXPR(*YES) +
                          PROMPT('SUBJECT')
             PARM       KWD(FILENAME) TYPE(*PNAME) LEN(256) +
                          DFT(*NONE) SNGVAL((*NONE)) MAX(30) +
                          EXPR(*YES) PROMPT('FILE ATTACHMENT')
             PARM       KWD(MESSAGE) TYPE(*CHAR) LEN(512) +
                          DFT(*NONE) SPCVAL((*NONE '')) EXPR(*YES) +
                          PROMPT('MESSAGE')
             PARM       KWD(EMAILTYPE) TYPE(*CHAR) LEN(10) +
                          DFT(*MIME) EXPR(*YES) PROMPT('E-MAIL TYPE' 1)
             PARM       KWD(SENDER) TYPE(ELEM2) DFT(*NETWORK) +
                          SNGVAL((*NETWORK)) PROMPT('SENDER' 3)

             PARM       KWD(EXTENSION) TYPE(*CHAR) LEN(4) RSTD(*YES) +
                          DFT(*NO) VALUES(*NO *YES) PROMPT('Email +
                          Body File Extension') /* Read Extension +
                          file to add to Body of Message */

             PARM       KWD(PLACEMSG) TYPE(*CHAR) LEN(7) RSTD(*YES) +
                          DFT(*AFTER) VALUES(*BEFORE *AFTER) +
                          PROMPT('Place Message in Body') /* +
                          Place Message before or after Body of +
                          Extension */

 ELEM1:      ELEM       TYPE(*PNAME) LEN(256) MIN(1) EXPR(*YES) +
                          PROMPT('E-MAIL ADDRESS OF RECIPIENT')
             ELEM       TYPE(*CHAR) LEN(256) DFT(*NONE) +
                          SPCVAL((*NONE '')) EXPR(*YES) +
                          PROMPT('NAME OF E-MAIL RECIPIENT')
             ELEM       TYPE(*CHAR) LEN(1) DFT(*PRI) SPCVAL((*PRI +
                          '0') (*CC '1') (*BCC '2')) EXPR(*YES) +
                          PROMPT('RECIPIENT TYPE')
 ELEM2:      ELEM       TYPE(*PNAME) LEN(255) EXPR(*YES) +
                          PROMPT('E-MAIL ADDRESS OF SENDER')
             ELEM       TYPE(*CHAR) LEN(256) EXPR(*YES) PROMPT('NAME +
                          OF E-MAIL SENDER') 
       
            