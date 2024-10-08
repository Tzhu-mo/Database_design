create or replace procedure pro_cxs(a in book.author%type) is

v_bno book.bno%type;
v_bname book.bname%type;
c number;
v_author book.author%type;
v_categories book.categories%type;
v_press book.press%type;

cursor c1 is
select book.bno,bname,author,categories,press,sum(salesnum) sumsales
from book,salesslip
where book.bno = salesslip.bno and to_char(salesslip.salestime,'yyyy/mm')=a
group by book.bno,bname,author,categories,press
order by sum(salesnum) desc;

begin
  open c1;
  loop
    fetch c1 into v_bno,v_bname,v_author,v_categories,v_press,c;
    exit when c1%notfound;
    
    dbms_output.put_line('书名：'||rpad(v_bname,20)||' 作者：'||rpad(v_author,20)
    ||' 类别：'||rpad(v_categories,20)||' 出版社：'||rpad(v_press,20)||' 销售数量：'||rpad(c,4)||' 时间：'||a);
    end loop;
    close c1;
end pro_cxs;
/
