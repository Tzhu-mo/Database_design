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
    dbms_output.put_line('��Ա����ɹ�');
  elsif v_ca>=300 and v_ca<400 then
    a := 2;
    b := 0.9;
    insert into members
    values(v_vno,v_cno,sysdate,b,a);
    dbms_output.put_line('��Ա����ɹ�');
  elsif v_ca>=400 and v_ca<500 then
    a := 3;
    b := 0.85;
    insert into members
    values(v_vno,v_cno,sysdate,b,a);
    dbms_output.put_line('��Ա����ɹ�');
  elsif v_ca>=500 then
    a := 4;
    b := 0.8;
    insert into members
    values(v_vno,v_cno,sysdate,b,a);
    dbms_output.put_line('��Ա����ɹ�');
  else
    dbms_output.put_line('���������ܶ�δ�ﵽ��Ա�����ʸ�');
    end if;
  commit;
end pur_hy;
/
