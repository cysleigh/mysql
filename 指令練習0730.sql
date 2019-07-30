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

//每個人電話表
select cname,max_n
from(
    select max(n) as max_n
    from(
        select cname ,COUNT(c.tel) as n
        from userinfo as a, live as b,phone as c
        where 
        a.uid = b.uid and
        b.hid = c.hid
        GROUP by cname
    )as aa
)as aaa,(
    select cname ,COUNT(c.tel) as n
    from userinfo as a, live as b,phone as c
    where 
    a.uid = b.uid and
    b.hid = c.hid
    GROUP by cname
)as bb
where aaa.max_n = bb.n

//列出電話的人
select cname ,c.tel
from userinfo as a, live as b,phone as c
where 
a.uid = b.uid and
b.hid = c.hid
//計算電話的人
select userinfo.uid, count(tel) as n
from userinfo left join live on
    userinfo.uid = live.uid
    left join phone on
    live.hid = phone.hid
    group by userinfo.uid


//最多電話的人 (count join)
select uid,max_n
from(
    select max(n) as max_n
    from(
        select userinfo.uid, count(tel) as n
        from userinfo left join live on
        userinfo.uid = live.uid
        left join phone on
        live.hid = phone.hid
        group by userinfo.uid
    )as a
)as aa,(
    select userinfo.uid, count(tel) as n
    from userinfo left join live on
    userinfo.uid = live.uid
    left join phone on
    live.hid = phone.hid
    group by userinfo.uid
)as bb
where aa.max_n = bb.n

//第二種方式
select cname,max_n
from(
    select max(n) as max_n
    from(
        select cname ,COUNT(c.tel) as n
        from userinfo as a, live as b,phone as c
        where 
        a.uid = b.uid and
        b.hid = c.hid
        GROUP by cname
    )as aa
)as aaa,(
    select cname ,COUNT(c.tel) as n
    from userinfo as a, live as b,phone as c
    where 
    a.uid = b.uid and
    b.hid = c.hid
    GROUP by cname
)as bb
where aaa.max_n = bb.n

select cname ,c.tel
from userinfo as a, live as b,phone as c
where 
a.uid = b.uid and
b.hid = c.hid

//limit 練習(列出最大的)    排序最高的電話費總和
------------------------------------
    select sum(fee) as sum_fee 
    from bill 
    group by tel
    order by sum_fee desc
    limit 1
--------------------------------------  
select tel, aa.sum_fee
from(
    select sum(fee) as sum_fee 
    from bill 
    group by tel
    order by sum_fee desc
    limit 1
)as aa,(
    select tel,sum(fee) as sum_fee 
    from bill 
    group by tel
)as bb
where aa.sum_fee = bb.sum_fee;
------------------------------------------
//HAVING 列出平均
SELECT tel, avg(fee)
FROM bill 
GROUP BY telHAVING avg(fee) > 300

----------------------------------------
//創立檢視表
create view vw_惠我良多 as
select tel, aa.sum_fee
from(
    select sum(fee) as sum_fee 
    from bill 
    group by tel
    order by sum_fee desc
    limit 1
)as aa,(
    select tel,sum(fee) as sum_fee 
    from bill 
    group by tel
)as bb
where aa.sum_fee = bb.sum_fee;

select * from vw_惠我良多

------------------------------------
DELETE TRUNCATE 救不回來
刪除所有電話帳單資料
DELETE FROM bill TRUNCATE TABLE bill

刪除孫小毛資料
DELETE FROM userinfoWHERE uid= 'B01'

------------------------------------
時間
select concat(date_format(now(),'西元第%Y年'),'第',quarter(now()),'季');

