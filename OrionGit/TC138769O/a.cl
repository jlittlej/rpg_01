             PGM
             DCL        VAR(&num) TYPE(*char) LEN(2) VALUE('10')
             dcl        &name *char 10
             dcl        &lib *char 10
             DCL        VAR(&count) TYPE(*DEC) LEN(5 0) VALUE(0)
             CHGVAR     VAR(&NAME) VALUE('Claus Weiss')
 LOOP:       chgvar     var(&count) value(&count+1)
             if (&count *lt 100) then(goto loop)
             CHGVAR     VAR(&NAME) VALUE('Claus')
             chgvar     var(&lib) value('RSELAB' *CAT &num)
 /*          CALL       PGM(&lib/PAYROLLG)     */

             ENDPGM  
             