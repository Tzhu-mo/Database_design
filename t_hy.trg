create or replace trigger t_hy
  before insert or update
  on customer 
  for each row
declare
 
begin
  if :new.camount>=200 and :new.camount<300 then
    update members
    set members.vdiscount = 0.95,members.vlevel = 1
    where members.cno = :new.cno;
    
  elsif :new.camount>=300 and :new.camount<400 then
    update members
    set members.vdiscount = 0.9,members.vlevel = 2
    where members.cno = :new.cno;
    
  elsif :new.camount>=400 and :new.camount<500 then
    update members
    set members.vdiscount = 0.85,members.vlevel = 3
    where members.cno = :new.cno;
    
  elsif :new.camount>=500 then
    update members
    set members.vdiscount = 0.8,members.vlevel = 4
    where members.cno = :new.cno;
    
    end if;
end t_hy;
/
