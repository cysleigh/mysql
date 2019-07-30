//可將一張資料庫裏面沒有的表放在frm裡面 讓他去做表出來 (巢狀查詢)
//列出總和大於1000的帳單
select * from (
    select tel,sum(fee) as sum_fee 
    from bill 
    group by tel
    ) as a 
where sum_fee >=1000

//列出每支電話哪一個月電話費最高
SELECT a.tel, max_fee, dd 
FROM (
    SELECT tel, max(fee) AS max_fee 
    FROM bill GROUP 
    BY tel) 
    AS a, bill AS b
    WHERE 
    a.tel= b.tel AND
    a.max_fee= b.fee

//列出最高電話費電話 inner join 極端值掀出來 在做join
//1350先出來 在做join
select max(sum_fee)          
from(
    select sum(fee) as sum_fee 
    from bill 
    group by tel
)As a

//總和表
select tel,sum(fee) as sum_fee 
    from bill 
    group by tel

//兩張合起來
select tel, max_sum_fee
from(
    select max(sum_fee) as max_sum_fee          
    from(
    select sum(fee) as sum_fee 
    from bill 
    group by tel
)As a)as aa,(
    select tel,sum(fee) as sum_fee 
    from bill 
    group by tel
)as bb
where aa.max_sum_fee = bb.sum_fee;






