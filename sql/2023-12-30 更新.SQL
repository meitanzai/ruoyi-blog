# 添加新字段
alter table account_class add column status char(1) comment '1收入 2支出 3忽略';
alter table account_money add column money decimal(20,2) comment '金额';

# 更新数据
update account_money set money = money_income where money_income is not null;
update account_money set money = money_pay where money_pay is not null;
update account_class c inner join sys_dict_data d on c.class_type = d.dict_value  set c.class_type = d.dict_label where dict_type = 'account_income_pay'  ;
update account_class c inner join sys_dict_data d on c.class_type = d.dict_label  set c.status = '1' where dict_type = 'account_income_pay' and dict_label = '收入' ;
update account_class c inner join sys_dict_data d on c.class_type = d.dict_label  set c.status = '2' where dict_type = 'account_income_pay' and dict_label = '支出';
update account_class c inner join sys_dict_data d on c.class_type = d.dict_label  set c.status = '3' where dict_type = 'account_income_pay' and dict_label != '收入' and dict_label != '支出' ;

# 删除 account_money 中的 money_income 和 money_pay 字段
alter table account_money drop column money_income;
alter table account_money drop column money_pay;

commit;