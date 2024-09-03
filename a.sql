

begin
  pro_xiaos('sa02','1002','c02',1);
end;

begin
  pro_xiaos('sa03','1003','c03',1);
end;

begin
  pro_xiaos('sa04','1002','c05',5);
end;

begin
  pro_xiaos('sa05','1010','c01',2);
end;

begin
  pro_xiaos('sa06','1011','c07',1);
end;

begin
  pro_xiaos('sa07','1006','c04',3);
end;

begin
  pro_xiaos('sa08','1008','c06',1);
end;
begin
  pro_xiaos('sa09','1004','c05',5);
end;

begin
  pro_xiaos('sa10','1011','c03',1);
end;

begin
  pro_xiaos('sa11','1003','c08',3);
end;

begin
  pro_xiaos('sa12','1005','c01',1);
end;

begin
  pro_xiaos('sa13','1002','c01',1);
end;

begin
  pro_xiaos('sa15','1008','c07',1);
end;

begin
  pur_tuihuo('re08','sa06','1011','c07');
end;

begin
  pur_hy('m01','c01');
  pur_hy('m02','c04');
  pur_hy('m03','c05');
  pur_hy('m04','c06');
  pur_hy('m05','c07');
  pur_hy('m06','c11');
  pur_hy('m07','c13');
  pur_hy('m08','c14');
  pur_hy('m09','c08');
end;



begin
  pur_hy('m09','c02');
  pur_hy('m10','c03');

end;

begin
  pur_jinhuo('out2','pur4');
end;

begin
  pur_ruku('en4','1001','s009',50);
end;




begin
  pur_pancha('i02','out3');
end;

select bname,sum(salesnum) sumsales,price
from book,salesslip
where book.bno = salesslip.bno
group by book.bno,bname,price;


begin
  pur_zd();
end;


select book.bno,bname,author,categories,press,sum(salesnum) sumsales
from book,salesslip
where book.bno = salesslip.bno and to_char(salesslip.salestime,'yyyy/mm')='2023/07'
group by book.bno,bname,author,categories,press
order by sum(salesnum) desc;



begin
  pro_cxs('2023/06');
end;

creat view v_fp as
select bname,pricetag,salesnum,price,salestime
from book,shelves,salesslip
where book.bno = shelves.bno and book.bno = salesslip.bno


begin
  pur_chuku('out03','1001',100);
end;
begin
  pur_hd('act7','1001','¬˙100æ≈ŒÂ’€',to_date('2023/07/02','yyyy/mm/dd'),to_date('2024/07/02','yyyy/mm/dd'),0.95,100);
end;
