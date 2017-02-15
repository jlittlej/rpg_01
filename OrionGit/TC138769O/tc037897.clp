/* INSTRUCTIONS:                                                     +
 * PROMPT ON EACH LINE AND CHECK:                                    +
 *   - THE LABEL IS CORRECTLY PARSED INTO THE LABEL FIELD            +
 *   - THE COMMENT IS CORRECTLY PARSE INTO THE COMMENT FIELD.        +
 */
LABEL1:      CRTLIB     LIB(BATTHISH) /* COMMENT ALLOWED */
 lsadfsas:   CRTLIB     LIB(BATTHISH) /*comment allowed */
L2:          CRTLIB     LIB(TEST)/* COMMENT ALLOWED */
L:           CRTLIB     LIB(TEST/* COMMENT ALLOWED */)
A234567890:  CRTLIB     LIB(BATTHISH  /* COMMENT ALLOWED */)
N@#$:        CRTLIB     LIB(TEST /*COMMENT ALLOWED */) ASP(2)
MORE:        CRTLIB     LIB(TEST/* COMMENT  ALLOWED */) ASP(2)
ANOTHER:     CRTLIB     LIB(TEST) /* COMMENT  ALLOWED */  ASP(2)
VALID:       CRTLIB     LIB(BATTHISH)/**COMMENT ALLOWED */
A:           CRTLIB     LIB(TEST /**COMMENT ALLOWED */)
B:           CRTLIB     LIB(TEST/**COMMENT ALLOWED */)
ASFDASDF:    CRTLIB     LIB(BATTHISH) /**COMMENT ALLOWED */
    ASDFSF:  CRTLIB     LIB(TEST/**COMMENT ALLOWED */) ASP(2)
           S:CRTLIB     LIB(TEST) /**COMMENT  ALLOWED */ ASP(2)
 A:          dspobjd    qsys/*all *lib output(*outfile) outfile(qtemp/qadspobj)
 LABEL:      CRTLIB     LIB(TEST) /* THIS IS A VERY LONG COMMENT, +
                          THE PURPOSE OF WHICH IS TO ENSURE THAT +
                          THE COMMENT FIELD DOESN'T HAVE A MAXIMUM +
                          LENGTH.  DO NOT READ THE REST OF THIS TOO +
                          CLOSELY!                                  +
     THE CREATE LIBRARY (CRTLIB) COMMAND ADDS A NEW LIBRARY TO THE  +
     SYSTEM.  BEFORE ANY OBJECTS ARE PLACED INTO A LIBRARY, THE LIBRARY +
     MUST HAVE BEEN CREATED.  WHEN THE LIBRARY IS CREATED, IT APPEARS   +
AS                                                                      +
     THOUGH IT EXISTS IN THE QSYS (SYSTEM) LIBRARY.                     +
                                                                        +
     RESTRICTIONS:                                                      +
                                                                        +
       1.  A LIBRARY WITH THE NAME QRCL OR QRPLOBJ CAN ONLY BE CREATED  +
IN                                                                      +
           THE SYSTEM ASP (ASP 1).                                      +
                                                                        +
       2.  A LIBRARY WITH THE NAME QRCLXXXXX OR QRPLXXXXX CAN ONLY BE   +
           CREATED IN THE ASP FOR WHICH THE ASP NUMBER CORRESPONDS TO   +
           'XXXXX' (WHERE 'XXXXX' IS THE NUMBER OF A PRIMARY ASP RIGHT  +
           ADJUSTED AND PADDED ON THE LEFT WITH ZEROS); FOR EXAMPLE,    */

/* FOLLOWING IS A COMMAND WITH A LABEL AND NO COMMENT */
 LABEL4:     CRTLIB     LIB(TEST)

             CRTLIB     LIB(TEST) /* AND THIS LINE HAS A COMMENT BUT +
                                     NO LABEL */

/* THE FOLLOWING IS A COMMAND WITH NO LABEL AND NO COMMENT */
             CRTLIB     LIB(TEST) 