create or replace procedure pur_tuihuo(v_retno in returnorder.retno%type, 
v_salesno in salesslip.salesno%type, v_bno in book.bno%type,v_cno in customer.cno%type) is

a date;
b date:=to_date(to_char(sysdate(),'YYYY/MM/DD'),'YYYY/MM/DD');
c number;
d number;

begin
  select salestime into a
  from salesslip
  where salesslip.bno = v_bno and salesslip.cno = v_cno and salesslip.salesno = v_salesno;
  
  c := b-a;
  dbms_output.put_line(c);
  insert into returnorder
  values(v_retno,v_salesno,v_bno,v_cno,sysdate);
  
  select salesnum into d
  from salesslip
  where salesslip.salesno = v_salesno and v_bno = salesslip.bno and v_cno = salesslip.cno;
  
  update shelves
  set shegoodsnum = shegoodsnum+d
  where shelves.bno = v_bno;
  
  
end pur_tuihuo;
/
