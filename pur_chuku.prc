create or replace procedure pur_chuku(v_delno in outbound.delno%type, v_bno in book.bno%type,onum in outbound.outboundnum%type) is

begin
  insert into outbound
  values(v_delno,v_bno,onum);
  
  update inventory
  set invnum = invnum-onum
  where inventory.bno = v_bno;
  
  update shelves
  set shegoodsnum = shegoodsnum+onum
  where shelves.bno = v_bno;
end pur_chuku;
/
