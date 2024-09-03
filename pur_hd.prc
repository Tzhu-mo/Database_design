create or replace procedure pur_hd(v_pno in activity.pno%type,
v_bno in book.bno%type,v_pname in activity.pname%type,
v_sta in activity.statime%type,
v_ter in activity.tertime%type,
v_pdiscount in sphere.pdiscount%type,
v_minaccount in sphere.minaccount%type) is

begin
  
insert into activity
values(v_pno,v_pname,v_sta,v_ter);
insert into sphere
values(v_pno,v_bno,v_pdiscount,v_minaccount);
  
end pur_hd;
/
