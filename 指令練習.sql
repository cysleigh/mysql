select a.uid, vname, address, tel
from userinfo as a, live as b,house as c,phone as d
where a.uid = b.uid and
b.hid = c.hid and
c.hid = d.hid AND

//
select a.uid as'帳號',cname as '姓名',address as'地址',tel as '電話'
from userinfo as a, live as b,house as c,phone as d
where a.uid = b.uid and
b.hid = c.hid and
c.hid = d.hid

//重複資料拿掉 DISTINCT
select DISTINCT a.uid as'帳號',cname as '姓名',address as'地址'
from userinfo as a, live as b,house as c,phone as d
where a.uid = b.uid and
b.hid = c.hid and
c.hid = d.hid

//sum 總和
select sum(fee) from bill

//sum 分組總和
SELECT tel, SUM(fee) FROM bill GROUP by tel

//avg 分組平均
select tel,avg(fee) from bill group by tel