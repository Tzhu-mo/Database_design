create or replace procedure pur_zd is
v_bno book.bno%type;
v_bname book.bname%type;
sumsales number;
v_price number;
s_a number := 0;

cursor c1 is
  select salesslip.bno,bname,sum(salesnum),price
  from salesslip,book
  where salesslip.bno = book.bno
  group by salesslip.bno,bname,price;
  
begin
  
  open c1;
  loop
    fetch c1 into v_bno,v_bname,sumsales,v_price;
    exit when c1%notfound;
    dbms_output.put_line(v_bno||' '||rpad(v_bname,20)||' 今日售出:'||rpad(sumsales,5)||' 销售额 '||v_price);
    s_a := s_a+v_price;
    end loop;
    close c1;
    dbms_output.put_line('今日收入：'||s_a);
  
end pur_zd;
/
