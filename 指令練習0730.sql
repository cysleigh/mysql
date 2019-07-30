//可將一張資料庫裏面沒有的表放在frm裡面 讓他去做表出來
select * from (
    select tel,sum(fee) as sum_fee 
    from bill 
    group by tel
    ) as a 
where sum_fee >=1000

//
