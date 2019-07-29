select a.uid, vname, address, tel
from userinfo as a, live as b,house as c,phone as d
where a.uid = b.uid and
b.hid = c.hid and
c.hid = d.hid AND