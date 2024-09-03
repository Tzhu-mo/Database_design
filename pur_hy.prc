create or replace procedure pur_hy(v_vno in members.vno%Type, v_cno in customer.cno%type) is
v_ca number;
a number;
b number;

begin
  select camount into v_ca
  from customer
  where customer.cno = v_cno;
  
  if v_ca>=200 and v_ca<300 then
    a := 1;
    b := 0.95;
    insert into members
    values(v_vno,v_cno,sysdate,b,a);
    dbms_output.put_line('会员申请成功');
  elsif v_ca>=300 and v_ca<400 then
    a := 2;
    b := 0.9;
    insert into members
    values(v_vno,v_cno,sysdate,b,a);
    dbms_output.put_line('会员申请成功');
  elsif v_ca>=400 and v_ca<500 then
    a := 3;
    b := 0.85;
    insert into members
    values(v_vno,v_cno,sysdate,b,a);
    dbms_output.put_line('会员申请成功');
  elsif v_ca>=500 then
    a := 4;
    b := 0.8;
    insert into members
    values(v_vno,v_cno,sysdate,b,a);
    dbms_output.put_line('会员申请成功');
  else
    dbms_output.put_line('您的消费总额未达到会员申请资格');
    end if;
  commit;
end pur_hy;
/
