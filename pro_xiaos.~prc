create or replace procedure pro_xiaos(v_salesno in salesslip.salesno%type,v_bno in  book.bno%type,
v_cno in customer.cno%type,v_salesnum in salesslip.salesnum%type) is

v_vdiscount members.vdiscount%type := 1;
v_pdiscount sphere.pdiscount%type := 1;
v_pricetag shelves.pricetag%type;
a book.bno%type;
b sphere.pdiscount%type := 1;
c activity.statime%type;
d activity.tertime%type;
e sphere.minaccount%type;

cursor c1 is
select sphere.bno,pdiscount,statime,tertime,minaccount
from activity,sphere,shelves
where activity.pno = sphere.pno and sphere.bno = v_bno;
begin
  select vdiscount into v_vdiscount
  from members
  where v_cno=members.cno;
  loop--查询活动折扣
    fetch c1 into a,b,c,d,e;
    exit when c1%notfound;
    if sysdate>c and sysdate<d then
      if v_pricetag*v_salesnum >e then
        if b<v_pdiscount then
          v_pdiscount := b;
        end if;
      end if;
    end if;
    end loop;
    close c1;
    update shelves
    set shegoodsnum = shegoodsnum-v_salesnum
    where shelves.bno = v_bno;
    
    select pricetag into v_pricetag
    from shelves
    where bno = v_bno;
    
    update customer
    set camount = camount+v_pricetag*v_salesnum*v_vdiscount*v_pdiscount;
    
    insert into salesslip
    values(v_salesno,v_bno,v_cno,v_pricetag*v_salesnum*v_vdiscount*v_pdiscount,v_salesnum,sysdate);
   
    dbms_output.put_line('您需要支付：'||v_pricetag*v_salesnum*v_vdiscount*v_pdiscount||'元');
end pro_xiaos;
/
