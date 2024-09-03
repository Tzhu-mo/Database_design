create or replace procedure pur_jinhuo(v_outstno in outorder.outstno%type,v_purno in purorder.purno%type) is
v_bno book.bno%type;
v_outstnum outorder.outstnum%type;
v_sno purorder.sno%type;
v_purtime purorder.purtime%type;
v_purprice purorder.purprice%type;
cursor c1 is
select outorder.bno,outstnum,sno,purtime,purprice
from outorder,purorder
where outorder.outstno=v_outstno and outorder.bno = purorder.bno;
begin
  open c1;
  loop
    fetch c1 into v_bno,v_outstnum,v_sno,v_purtime,v_purprice;
    exit when c1%notfound;
    insert 
    into purorder
    values(v_purno,v_bno,v_sno,v_outstnum,v_purtime,v_purprice);
    end loop;
    close c1;
end pur_jinhuo;
/
