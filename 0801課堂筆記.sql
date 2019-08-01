-- 建trigger前要有文件

--php寫入資料庫分號使用$$代替
DELIMITER$$

--送出兩筆以上修改 中斷trigger--
signal sqlstate '' set message_text = 'stop!'

CREATE TRIGGER tr_userinfo_update_1 BEFORE UPDATE
on userinfo for EACH ROW
BEGIN
	SET @count = if(@count is null,1,(@count+1));
    IF @count >1 then
    SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT ='STOP!';
    end if;
END;

--建立暫存表--
temporary table


//建立程序
DELIMITER $$

CREATE PROCEDURE live_where(location varchar(20))
BEGIN
	SELECT * FROM vw_user where address LIKE concat(location,'%');
end $$

//建立函式
CREATE function f_add(v1 float,v2 float) returns float
return v1+v2:

//呼叫函式
1. SELECT f_add(1.2,3.4)

2.  set @r = f_add(1.2,3.3)
    SELECT @r;

//  兩個條件都成功才做
drop PROCEDURE pro_name;

DELIMITER $$
CREATE PROCEDURE pro_name()
BEGIN
    declare _rollback bool default false;
    declare continue handler for sqlexception set _rollback = true;
    
    start transaction;
        insert into userinfo(uid) value ('A01');
        UPDATE userinfo set cname = '豬小弟' where uid = 'A04';
        if _rollback then
            SELECT 'rollback'
            rollback;
        else
            SELECT 'commit'
            commit;
        end if;
end $$

DELIMITER;

//cursor用法
DELIMITER $$
CREATE PROCEDURE pro_test()
BEGIN
declare done int default false;
declare tmp_fee int;
declare total int default 0 ;
declare curs cursor for SELECT fee FROM bill;
declare continue handler for not found set done = true;

open curs;
fetch curs into tmp_fee;

while not done do 
    set total = total+tmp_fee;
    fetch curs into tmp_fee;
end while;

close curs;
SELECT total;

end $$

//cursor用法
DELIMITER $$

DELIMITER $$

CREATE PROCEDURE pro_convert2()

BEGIN
declare done int default false;
declare tmp_fee int;
DECLARE tmp_tel int;
DECLARE tmp_dd 	int;

DECLARE word varchar(30) DEFAULT '零一二三四五六七八九'
DECLARE str varchar(255);
declare n int ;
declare curs cursor for SELECT fee,tel,dd FROM bill;
declare continue handler for not found set done = true;

OPEN curs;
FETCH curs INTO tmp_fee,tmp_tel,tmp_dd;
WHILE not done do 
	set str = convert(tmp_fee,varchar(20));
    SELECT str;
    
    set tmp_word='';
    set n =1;
    while n <= length(str) DO
    	set tmp_word = concat(tmp_word,CONVERT(substring(str,n,1),INT)-1,1);
        SELECT substring(str,n,1);
        set n = n+1;
        end while;
	FETCH curs into tmp_tel,tmp_dd,tmp_fee;
    END WHILE;
    
CLOSE curs;

///
BEGIN
DECLARE str1 VARCHAR(4);
DECLARE return_str VARCHAR(255) character set gbk DEFAULT '' ; 
	DECLARE done int DEFAULT false;
    DECLARE tmp_fee varchar(40);
    DECLARE total varchar(40);
    DECLARE nnn int default 1;
    
    DECLARE curs CURSOR for SELECT fee FROM bill;
    DECLARE CONTINUE HANDLER for not found set done = true;
    
    open curs;
    FETCH curs into tmp_fee;

    WHILE not done DO
    set nnn=1;
    SET return_str='';
        WHILE nnn < LENGTH(tmp_fee) + 1  DO 
    	set str1 =  SUBSTRING(tmp_fee,  nnn, 1  );
        CASE str1
    WHEN '1' THEN SET str1 ="一"; 
    WHEN '2' THEN SET str1 ="二"; 
    WHEN '3' THEN SET str1 ="三"; 
    WHEN '4' THEN SET str1 ="四"; 
    WHEN '5' THEN SET str1 ="五"; 
    WHEN '6' THEN SET str1 ="六"; 
    WHEN '7' THEN SET str1 ="七"; 
    WHEN '8' THEN SET str1 ="八"; 
    WHEN '9' THEN SET str1 ="九"; 
	WHEN '0' THEN SET str1 ="零";
    END CASE;
        SET nnn = nnn + 1 ;
        SET return_str = CONCAT(return_str,str1); 
        UPDATE bill set `中文` = return_str where `fee`=tmp_fee;
        
        end while;
        
     /*   SELECT return_str;*/
        FETCH curs into tmp_fee;
     /*   UPDATE bill set `中文` = return_str where 1; */
        
        end while;
        
        close curs;
        
    end;