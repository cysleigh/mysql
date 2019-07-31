建立各個資料表
------------------------------------------------------------
//創建會員資料表(userinfo)
CREATE TABLE `homework`.`userinfo` ( 
    `u_id` VARCHAR(10) NOT NULL , `u_name` VARCHAR(40) 
    CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , 
    `u_img` BLOB NOT NULL , PRIMARY KEY (`u_id`)
) ENGINE = InnoDB;

//創建交易資料表(transactioninfo)
CREATE TABLE `homework`.`transactioninfo` ( 
    `u_id` VARCHAR(10) NOT NULL , `t_id` INT(10) NOT NULL AUTO_INCREMENT , 
    `t_time` DATETIME NOT NULL , PRIMARY KEY (`t_id`)
) ENGINE = InnoDB;

//創建商品資料表(commodityinfo)
CREATE TABLE `homework`.`commodityinfo` ( 
    `c_id` INT(10) NOT NULL AUTO_INCREMENT , 
    `c_name` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , 
    `c_img` BLOB NOT NULL , PRIMARY KEY (`c_id`)
) ENGINE = InnoDB;

//創建交易明細表(buyinfo)
CREATE TABLE `homework`.`buyinfo` ( 
    `t_id` INT(10) NOT NULL , `c_id` INT(10) NOT NULL , 
    `c_amount` INT(10) NOT NULL 
) ENGINE = InnoDB;

新增八筆商品資料
------------------------------------------------------------
INSERT INTO `commodityinfo` (`c_id`, `c_name`, `c_img`) VALUES 
('1', 'C01', 0x89504e470d0a1a0a0000000d4948445200000200000002000....),
('2','C02',0a0000000d4948445200000200000002000....)