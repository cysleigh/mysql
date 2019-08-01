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