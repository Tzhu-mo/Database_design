create view v_book as
select bname,author,categories,press,bestsum,bestdate
from book,bestseller
where book.bno = bestseller.bno;

create view v_shelves as
select bname,author,categories,press,sheno,pricetag,shegoodsnum
from book,shelves
where book.bno = shelves.bno;

create view v_sales as
select bname,author,categories,press,salesnum,price,salestime
from book,salesslip
where book.bno = salesslip.bno;
