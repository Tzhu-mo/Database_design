create or replace procedure pur_pancha(v_ino in inventorylist.ino%type,v_outstno in outorder.outstno%type) is
a number;
b number;
v_bno book.bno%type;
v_sno supplier.sno%type;
cursor c1 is
select bno,sno,invnum
from inventory;

begin
  open c1;
  loop
    fetch c1 into v_bno,v_sno,a;
    exit when c1%notfound;
    if a<200 then
      b := 1000-a;
      insert into outorder
      values(v_outstno,v_bno,b);
    end if;
    insert into inventorylist
    values(v_ino,v_bno,a);
    end loop;
    close c1;
  
end pur_pancha;
/
