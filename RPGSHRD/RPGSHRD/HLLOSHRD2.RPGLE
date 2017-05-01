**free

//TEST edt from github 20170501_01
//TEST TEST 2017_04_24_01
//TEST TEST 0817_01
//TEST TEST 2017_01_26
//TEST TEST 2017_01_26-1103
//TEST TEST 2016_03_07-1344


dcl-s ans char(1);
//dsply 'Hello World' '' ans;  // Will wait for a response - just hit ENTER
dcl-s name char(10) inz('Jim');
dcl-s name2 char(10) inz('Jill');


dcl-c MAX_ELEMS 100;
dcl-c default_city_name 'London';

dcl-s num int(10);

dcl-s greeting char(20);


dcl-s age packed(5);

dcl-ds info qualified;
  name char(10) inz('Sam');
  salary packed(9 : 2) inz(44000.14);
end-ds;


dcl-ds otherInfo likeds(info) inz(*likeds);



//TEST COMMENT



//dcl-s dates date(*iso) dim(3);
//dcl-s date1 date;
//date1 = %date('040596': *MDY0);

    dcl-s dates date(*iso) dim(3);

    dates(1) = %date();               // the current date
    dates(2) = dates(1) + %days(1);   // tomorrow
    dates(3) = dates(1) + %years(1); // next year
    dsply (%char(dates(1)) + ' '
         + %char(dates(2)) + ' '
         + %char(dates(3)));


greeting = 'hello';

dsply name;



dsply max_elems;
dsply default_city_name;




for num = 1 to 3;
  dsply ('i = ' + %char(num));
endfor;



dsply ('greeting is: ' + greeting);


dsply (%trim(info.name)
     + ' has a salary of '
     + %char(info.salary));


dsply name2 '' ans;




otherInfo.name = 'Stanley';
otherInfo.salary += 10000;

dsply (
 %trim (
 %char(otherInfo.salary)

     + ' is the salary of '
     + otherInfo.name
     )
      + ' END'
     )
     ;



  return;





