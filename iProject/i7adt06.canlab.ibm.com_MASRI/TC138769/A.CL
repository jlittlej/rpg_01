000000170214             PGM
000000170214             DCL        VAR(&num) TYPE(*char) LEN(2) VALUE('10')
000000170214             dcl        &name *char 10
000000170214             dcl        &lib *char 10
000000170214             DCL        VAR(&count) TYPE(*DEC) LEN(5 0) VALUE(0)
000000170214             CHGVAR     VAR(&NAME) VALUE('Claus Weiss')
000000170214 LOOP:       chgvar     var(&count) value(&count+1)
000000170214             if (&count *lt 100) then(goto loop)
000000170214             CHGVAR     VAR(&NAME) VALUE('Claus')
000000170214             chgvar     var(&lib) value('RSELAB' *CAT &num)
000000170214 /*          CALL       PGM(&lib/PAYROLLG)     */
000000170214
000000170214             ENDPGM
000000170214
