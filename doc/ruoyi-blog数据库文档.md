# 数据库设计文档

**数据库名：** ry_fast

**文档版本：** 3.0.0

**文档描述：** 数据库设计文档生成

| 表名                  | 说明       |
| :---: | :---: |
| [account_account](#account_account) |  |
| [account_class](#account_class) |  |
| [account_money](#account_money) |  |
| [account_user_account](#account_user_account) | 用户与记账账户关联表 |
| [biz_repeat_log](#biz_repeat_log) |  |
| [board_agile](#board_agile) |  |
| [board_note](#board_note) |  |
| [cloud_file](#cloud_file) | 网盘文件 |
| [gen_table](#gen_table) | 代码生成业务表 |
| [gen_table_column](#gen_table_column) | 代码生成业务表字段 |
| [mto_category](#mto_category) | 前台导航 |
| [mto_category_copy1](#mto_category_copy1) | 前台导航 |
| [mto_channel](#mto_channel) |  |
| [mto_comment](#mto_comment) | 留言 |
| [mto_golden](#mto_golden) | 金句 |
| [mto_link](#mto_link) |  |
| [mto_look_ip](#mto_look_ip) | 每日访问博客IP |
| [mto_look_ip_first](#mto_look_ip_first) | 首次访问博客记录 |
| [mto_post](#mto_post) | 博客基本信息 |
| [mto_post_attribute](#mto_post_attribute) | 博客内容 |
| [mto_post_attribute_copy1](#mto_post_attribute_copy1) | 博客内容 |
| [mto_post_tag](#mto_post_tag) | 博客标签 |
| [mto_tag](#mto_tag) | 标签 |
| [pin_board](#pin_board) |  |
| [qrtz_blob_triggers](#qrtz_blob_triggers) | Blob类型的触发器表 |
| [qrtz_calendars](#qrtz_calendars) | 日历信息表 |
| [qrtz_cron_triggers](#qrtz_cron_triggers) | Cron类型的触发器表 |
| [qrtz_fired_triggers](#qrtz_fired_triggers) | 已触发的触发器表 |
| [qrtz_job_details](#qrtz_job_details) | 任务详细信息表 |
| [qrtz_locks](#qrtz_locks) | 存储的悲观锁信息表 |
| [qrtz_paused_trigger_grps](#qrtz_paused_trigger_grps) | 暂停的触发器表 |
| [qrtz_scheduler_state](#qrtz_scheduler_state) | 调度器状态表 |
| [qrtz_simple_triggers](#qrtz_simple_triggers) | 简单触发器的信息表 |
| [qrtz_simprop_triggers](#qrtz_simprop_triggers) | 同步机制的行锁表 |
| [qrtz_triggers](#qrtz_triggers) | 触发器详细信息表 |
| [sys_auth_user](#sys_auth_user) | 第三方授权表 |
| [sys_config](#sys_config) | 参数配置表 |
| [sys_dept](#sys_dept) | 部门表 |
| [sys_dict_data](#sys_dict_data) | 字典数据表 |
| [sys_dict_type](#sys_dict_type) | 字典类型表 |
| [sys_job](#sys_job) | 定时任务调度表 |
| [sys_job_log](#sys_job_log) | 定时任务调度日志表 |
| [sys_logininfor](#sys_logininfor) | 系统访问记录 |
| [sys_mail](#sys_mail) |  |
| [sys_menu](#sys_menu) | 菜单权限表 |
| [sys_notice](#sys_notice) | 通知公告表 |
| [sys_oper_log](#sys_oper_log) | 操作日志记录 |
| [sys_post](#sys_post) | 岗位信息表 |
| [sys_role](#sys_role) | 角色信息表 |
| [sys_role_dept](#sys_role_dept) | 角色和部门关联表 |
| [sys_role_menu](#sys_role_menu) | 角色和菜单关联表 |
| [sys_user](#sys_user) | 用户信息表 |
| [sys_user_online](#sys_user_online) | 在线用户记录 |
| [sys_user_post](#sys_user_post) | 用户与岗位关联表 |
| [sys_user_role](#sys_user_role) | 用户和角色关联表 |

**表名：** <a id="account_account">account_account</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   bigint   | 20 |   0    |    N     |  Y   |       | 主键id  |
|  2   | cover |   varbinary   | 300 |   0    |    Y     |  N   |       | 账户封面/图片  |
|  3   | account_name |   varchar   | 20 |   0    |    N     |  N   |       | 账户分类  |
|  4   | account_introduce |   varchar   | 60 |   0    |    Y     |  N   |       | 账本介绍  |
|  5   | visible |   char   | 1 |   0    |    N     |  N   |   0    | 账本状态（0显示1隐藏）  |
|  6   | order_num |   int   | 10 |   0    |    Y     |  N   |   0    | 显示顺序  |
|  7   | create_by |   varchar   | 64 |   0    |    Y     |  N   |       | 创建者  |
|  8   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |
|  9   | update_by |   varchar   | 64 |   0    |    Y     |  N   |       | 更新者  |
|  10   | update_time |   datetime   | 19 |   0    |    Y     |  N   |       | 更新时间  |
|  11   | create_user_id |   bigint   | 20 |   0    |    Y     |  N   |       | 创建用户ID  |

**表名：** <a id="account_class">account_class</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   bigint   | 20 |   0    |    N     |  Y   |       | id  |
|  2   | class_name |   varchar   | 20 |   0    |    N     |  N   |       | 分类名称  |
|  3   | class_type |   varchar   | 100 |   0    |    Y     |  N   |       | 分类类型  |
|  4   | class_introduce |   varchar   | 60 |   0    |    Y     |  N   |       | 分类介绍  |
|  5   | class_status |   char   | 4 |   0    |    Y     |  N   |       | 分类状态（停用/启用）  |
|  6   | order_num |   int   | 10 |   0    |    Y     |  N   |   0    | 显示顺序  |
|  7   | create_by |   varchar   | 64 |   0    |    Y     |  N   |       | 创建者  |
|  8   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |
|  9   | update_by |   varchar   | 64 |   0    |    Y     |  N   |       | 更新者  |
|  10   | update_time |   datetime   | 19 |   0    |    Y     |  N   |       | 更新时间  |

**表名：** <a id="account_money">account_money</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   bigint   | 20 |   0    |    N     |  Y   |       | 主键id  |
|  2   | account_id |   bigint   | 20 |   0    |    N     |  N   |       | 账本id  |
|  3   | class_id |   bigint   | 20 |   0    |    N     |  N   |       | 类型id  |
|  4   | money_pay |   decimal   | 21 |   2    |    Y     |  N   |       | 金额(支出金额)  |
|  5   | money_income |   decimal   | 21 |   0    |    Y     |  N   |       | 金额(收出金额)  |
|  6   | money_date |   date   | 10 |   0    |    Y     |  N   |       | 花钱日期  |
|  7   | money_introduce |   varchar   | 60 |   0    |    Y     |  N   |       | 备注/金额说明  |
|  8   | is_total |   int   | 10 |   0    |    N     |  N   |   0    | 是否记入总账（0记入，默认，1不记录）  |
|  9   | create_by |   varchar   | 64 |   0    |    Y     |  N   |       | 创建者  |
|  10   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |
|  11   | update_by |   varchar   | 64 |   0    |    Y     |  N   |       | 更新者  |
|  12   | update_time |   datetime   | 19 |   0    |    Y     |  N   |       | 更新时间  |
|  13   | deleted |   char   | 1 |   0    |    N     |  N   |   0    | 0是正常，1是删除  |

**表名：** <a id="account_user_account">account_user_account</a>

**说明：** 用户与记账账户关联表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | user_id |   bigint   | 20 |   0    |    N     |  Y   |       | 用户ID  |
|  2   | post_id |   bigint   | 20 |   0    |    N     |  Y   |       | 账户ID  |
|  3   | del_flag |   char   | 1 |   0    |    Y     |  N   |   0    | 删除标志（0代表存在2代表删除）  |

**表名：** <a id="biz_repeat_log">biz_repeat_log</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | biz_id |   int   | 10 |   0    |    Y     |  N   |       | 业务ID  |
|  3   | biz_type |   bit   | 1 |   0    |    N     |  N   |       | 业务类型：1.文章，2.评论,3.获取天气  |
|  4   | user_id |   varchar   | 20 |   0    |    Y     |  N   |       | 已登录用户ID  |
|  5   | user_ip |   varchar   | 50 |   0    |    Y     |  N   |       | 用户IP  |
|  6   | user_agent |   varchar   | 500 |   0    |    Y     |  N   |       | 客户端标识  |
|  7   | url |   varchar   | 100 |   0    |    Y     |  N   |       | 请求地址  |
|  8   | status |   char   | 1 |   0    |    N     |  N   |       | 状态（0正常1失败）  |
|  9   | create_time |   datetime   | 19 |   0    |    Y     |  N   |   CURRENT_TIMESTAMP    | 添加时间  |
|  10   | remark |   varchar   | 500 |   0    |    Y     |  N   |       | 备注  |

**表名：** <a id="board_agile">board_agile</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   bigint   | 20 |   0    |    N     |  Y   |       | 任务id  |
|  2   | agile_name |   varchar   | 500 |   0    |    Y     |  N   |       | 任务名称  |
|  3   | agile_status |   int   | 10 |   0    |    N     |  N   |       | 状态  |
|  4   | agile_date |   datetime   | 19 |   0    |    N     |  N   |       | 任务日期  |
|  5   | user_id |   bigint   | 20 |   0    |    N     |  N   |       | 用户id  |
|  6   | create_by |   varchar   | 64 |   0    |    Y     |  N   |       | 创建者  |
|  7   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |
|  8   | update_by |   varchar   | 64 |   0    |    Y     |  N   |       | 更新者  |
|  9   | update_time |   datetime   | 19 |   0    |    Y     |  N   |       | 更新时间  |
|  10   | remark |   varchar   | 500 |   0    |    Y     |  N   |       | 备注  |

**表名：** <a id="board_note">board_note</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   bigint   | 20 |   0    |    N     |  Y   |       | 唯一id  |
|  2   | note_title |   varchar   | 60 |   0    |    N     |  N   |       | 标题  |
|  3   | author_id |   bigint   | 20 |   0    |    Y     |  N   |       | 作者id  |
|  4   | note_image |   varchar   | 255 |   0    |    Y     |  N   |       | 图片（预留字段，暂时不考虑）  |
|  5   | note_content |   longtext   | 2147483647 |   0    |    Y     |  N   |       | 内容  |
|  6   | note_summary |   varchar   | 100 |   0    |    Y     |  N   |       | 摘要  |
|  7   | note_type |   varchar   | 10 |   0    |    Y     |  N   |       | 类型（数据字典，不写死）  |
|  8   | note_status |   char   | 1 |   0    |    Y     |  N   |   0    | 状态  |
|  9   | is_Public |   char   | 1 |   0    |    Y     |  N   |       | 是否公共，0公共，1私有  |
|  10   | create_by |   varchar   | 64 |   0    |    Y     |  N   |       | 创建者  |
|  11   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |
|  12   | update_by |   varchar   | 64 |   0    |    Y     |  N   |       | 更新者  |
|  13   | update_time |   datetime   | 19 |   0    |    Y     |  N   |       | 更新时间  |
|  14   | remark |   varchar   | 255 |   0    |    Y     |  N   |       | 备注  |

**表名：** <a id="cloud_file">cloud_file</a>

**说明：** 网盘文件

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   bigint   | 20 |   0    |    N     |  Y   |       |   |
|  2   | user_id |   bigint   | 20 |   0    |    Y     |  N   |       | 文件所属用户  |
|  3   | oldfilename |   varchar   | 255 |   0    |    Y     |  N   |       | 原文件名  |
|  4   | newfilename |   varchar   | 255 |   0    |    Y     |  N   |       | 新文件名  |
|  5   | ext |   varchar   | 255 |   0    |    Y     |  N   |       | 文件后缀  |
|  6   | url_path |   varchar   | 255 |   0    |    Y     |  N   |       | 访问文件url地址  |
|  7   | file_path |   varchar   | 255 |   0    |    Y     |  N   |       | 文件存放路径  |
|  8   | size |   float   | 12 |   1    |    Y     |  N   |       | 文件大小  |
|  9   | type |   varchar   | 255 |   0    |    Y     |  N   |       | 文件类型  |
|  10   | is_img |   int   | 10 |   0    |    Y     |  N   |       | 是否是图片（0是，1否）  |
|  11   | downcounts |   int   | 10 |   0    |    Y     |  N   |   0    | 下载次数  |
|  12   | upload_time |   datetime   | 19 |   0    |    Y     |  N   |       | 上传时间  |
|  13   | update_time |   datetime   | 19 |   0    |    Y     |  N   |       | 修改时间  |
|  14   | is_public |   int   | 10 |   0    |    Y     |  N   |   0    | 是否共享（0正常，1共享）  |
|  15   | is_collect |   int   | 10 |   0    |    Y     |  N   |   0    | 是否收藏（0正常，1收藏）  |
|  16   | is_share |   int   | 10 |   0    |    Y     |  N   |   0    | 是否分享（0正常，1分享）  |
|  17   | is_recycle |   int   | 10 |   0    |    Y     |  N   |   0    | 是否在回收箱（0正常，1删除）  |
|  18   | icon |   varchar   | 255 |   0    |    Y     |  N   |       | 文件显示图片  |

**表名：** <a id="gen_table">gen_table</a>

**说明：** 代码生成业务表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | table_id |   bigint   | 20 |   0    |    N     |  Y   |       | 编号  |
|  2   | table_name |   varchar   | 200 |   0    |    Y     |  N   |       | 表名称  |
|  3   | table_comment |   varchar   | 500 |   0    |    Y     |  N   |       | 表描述  |
|  4   | sub_table_name |   varchar   | 64 |   0    |    Y     |  N   |       | 关联子表的表名  |
|  5   | sub_table_fk_name |   varchar   | 64 |   0    |    Y     |  N   |       | 子表关联的外键名  |
|  6   | class_name |   varchar   | 100 |   0    |    Y     |  N   |       | 实体类名称  |
|  7   | tpl_category |   varchar   | 200 |   0    |    Y     |  N   |   crud    | 使用的模板（crud单表操作tree树表操作sub主子表操作）  |
|  8   | package_name |   varchar   | 100 |   0    |    Y     |  N   |       | 生成包路径  |
|  9   | module_name |   varchar   | 30 |   0    |    Y     |  N   |       | 生成模块名  |
|  10   | business_name |   varchar   | 30 |   0    |    Y     |  N   |       | 生成业务名  |
|  11   | function_name |   varchar   | 50 |   0    |    Y     |  N   |       | 生成功能名  |
|  12   | function_author |   varchar   | 50 |   0    |    Y     |  N   |       | 生成功能作者  |
|  13   | gen_type |   char   | 1 |   0    |    Y     |  N   |   0    | 生成代码方式（0zip压缩包1自定义路径）  |
|  14   | gen_path |   varchar   | 200 |   0    |    Y     |  N   |   /    | 生成路径（不填默认项目路径）  |
|  15   | options |   varchar   | 1000 |   0    |    Y     |  N   |       | 其它生成选项  |
|  16   | create_by |   varchar   | 64 |   0    |    Y     |  N   |       | 创建者  |
|  17   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |
|  18   | update_by |   varchar   | 64 |   0    |    Y     |  N   |       | 更新者  |
|  19   | update_time |   datetime   | 19 |   0    |    Y     |  N   |       | 更新时间  |
|  20   | remark |   varchar   | 500 |   0    |    Y     |  N   |       | 备注  |

**表名：** <a id="gen_table_column">gen_table_column</a>

**说明：** 代码生成业务表字段

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | column_id |   bigint   | 20 |   0    |    N     |  Y   |       | 编号  |
|  2   | table_id |   varchar   | 64 |   0    |    Y     |  N   |       | 归属表编号  |
|  3   | column_name |   varchar   | 200 |   0    |    Y     |  N   |       | 列名称  |
|  4   | column_comment |   varchar   | 500 |   0    |    Y     |  N   |       | 列描述  |
|  5   | column_type |   varchar   | 100 |   0    |    Y     |  N   |       | 列类型  |
|  6   | java_type |   varchar   | 500 |   0    |    Y     |  N   |       | JAVA类型  |
|  7   | java_field |   varchar   | 200 |   0    |    Y     |  N   |       | JAVA字段名  |
|  8   | is_pk |   char   | 1 |   0    |    Y     |  N   |       | 是否主键（1是）  |
|  9   | is_increment |   char   | 1 |   0    |    Y     |  N   |       | 是否自增（1是）  |
|  10   | is_required |   char   | 1 |   0    |    Y     |  N   |       | 是否必填（1是）  |
|  11   | is_insert |   char   | 1 |   0    |    Y     |  N   |       | 是否为插入字段（1是）  |
|  12   | is_edit |   char   | 1 |   0    |    Y     |  N   |       | 是否编辑字段（1是）  |
|  13   | is_list |   char   | 1 |   0    |    Y     |  N   |       | 是否列表字段（1是）  |
|  14   | is_query |   char   | 1 |   0    |    Y     |  N   |       | 是否查询字段（1是）  |
|  15   | query_type |   varchar   | 200 |   0    |    Y     |  N   |   EQ    | 查询方式（等于、不等于、大于、小于、范围）  |
|  16   | html_type |   varchar   | 200 |   0    |    Y     |  N   |       | 显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）  |
|  17   | dict_type |   varchar   | 200 |   0    |    Y     |  N   |       | 字典类型  |
|  18   | sort |   int   | 10 |   0    |    Y     |  N   |       | 排序  |
|  19   | create_by |   varchar   | 64 |   0    |    Y     |  N   |       | 创建者  |
|  20   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |
|  21   | update_by |   varchar   | 64 |   0    |    Y     |  N   |       | 更新者  |
|  22   | update_time |   datetime   | 19 |   0    |    Y     |  N   |       | 更新时间  |

**表名：** <a id="mto_category">mto_category</a>

**说明：** 前台导航

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | pid |   int   | 10 |   0    |    Y     |  N   |   0    |   |
|  3   | name |   varchar   | 50 |   0    |    Y     |  N   |       | 文章类型名  |
|  4   | description |   varchar   | 200 |   0    |    Y     |  N   |       | 类型介绍  |
|  5   | sort |   int   | 10 |   0    |    Y     |  N   |       | 排序  |
|  6   | icon |   varchar   | 100 |   0    |    Y     |  N   |       | 图标  |
|  7   | status |   tinyint   | 3 |   0    |    Y     |  N   |   1    | 是否可用  |
|  8   | create_time |   datetime   | 19 |   0    |    Y     |  N   |   CURRENT_TIMESTAMP    | 添加时间  |
|  9   | update_time |   datetime   | 19 |   0    |    Y     |  N   |   CURRENT_TIMESTAMP    | 更新时间  |
|  10   | type |   int   | 10 |   0    |    Y     |  N   |   0    | 类型（0分类/1页面）  |
|  11   | page_url |   varchar   | 255 |   0    |    Y     |  N   |       | 页面请求地址  |

**表名：** <a id="mto_category_copy1">mto_category_copy1</a>

**说明：** 前台导航

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | pid |   int   | 10 |   0    |    Y     |  N   |   0    |   |
|  3   | name |   varchar   | 50 |   0    |    Y     |  N   |       | 文章类型名  |
|  4   | description |   varchar   | 200 |   0    |    Y     |  N   |       | 类型介绍  |
|  5   | sort |   int   | 10 |   0    |    Y     |  N   |       | 排序  |
|  6   | icon |   varchar   | 100 |   0    |    Y     |  N   |       | 图标  |
|  7   | status |   tinyint   | 3 |   0    |    Y     |  N   |   1    | 是否可用  |
|  8   | create_time |   datetime   | 19 |   0    |    Y     |  N   |   CURRENT_TIMESTAMP    | 添加时间  |
|  9   | update_time |   datetime   | 19 |   0    |    Y     |  N   |   CURRENT_TIMESTAMP    | 更新时间  |
|  10   | type |   int   | 10 |   0    |    Y     |  N   |   0    | 类型（0分类/1页面）  |
|  11   | page_url |   varchar   | 255 |   0    |    Y     |  N   |       | 页面请求地址  |

**表名：** <a id="mto_channel">mto_channel</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | key_ |   varchar   | 32 |   0    |    Y     |  N   |       | key  |
|  3   | name |   varchar   | 32 |   0    |    Y     |  N   |       | 名称  |
|  4   | status |   int   | 10 |   0    |    N     |  N   |       | 状态：0正常，1隐藏  |
|  5   | thumbnail |   varchar   | 128 |   0    |    Y     |  N   |       | 图片链接  |
|  6   | type |   int   | 10 |   0    |    Y     |  N   |       | 类型：1分类，2专题  |
|  7   | weight |   int   | 10 |   0    |    N     |  N   |   0    |   |

**表名：** <a id="mto_comment">mto_comment</a>

**说明：** 留言

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   bigint   | 20 |   0    |    N     |  Y   |       |   |
|  2   | p_id |   bigint   | 20 |   0    |    Y     |  N   |       | 父id  |
|  3   | ancestors |   varchar   | 255 |   0    |    Y     |  N   |       | 祖级列表  |
|  4   | post_id |   bigint   | 20 |   0    |    Y     |  N   |       | 博客id  |
|  5   | email |   varchar   | 64 |   0    |    Y     |  N   |       | 邮箱  |
|  6   | nick_name |   varchar   | 64 |   0    |    Y     |  N   |       | 昵称  |
|  7   | content |   varchar   | 255 |   0    |    Y     |  N   |       | 评论内容  |
|  8   | avatar |   varchar   | 255 |   0    |    Y     |  N   |       | 头像  |
|  9   | love |   char   | 4 |   0    |    Y     |  N   |       | 点赞  |
|  10   | status |   varchar   | 255 |   0    |    Y     |  N   |       | 状态  |
|  11   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |
|  12   | ip |   varchar   | 64 |   0    |    Y     |  N   |       |   |
|  13   | parent_nick_name |   varchar   | 255 |   0    |    Y     |  N   |       | 父级名称  |

**表名：** <a id="mto_golden">mto_golden</a>

**说明：** 金句

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | golden |   varchar   | 255 |   0    |    Y     |  N   |       | 金句  |
|  3   | author |   varchar   | 255 |   0    |    Y     |  N   |       | 名言  |

**表名：** <a id="mto_link">mto_link</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   bigint   | 20 |   0    |    N     |  Y   |       |   |
|  2   | link_name |   varchar   | 255 |   0    |    Y     |  N   |       | 名称  |
|  3   | link_logo |   varchar   | 255 |   0    |    Y     |  N   |       | logo  |
|  4   | link_url |   varchar   | 255 |   0    |    Y     |  N   |       | url地址  |
|  5   | link_description |   varchar   | 255 |   0    |    Y     |  N   |       | 链接描述  |
|  6   | status |   int   | 10 |   0    |    Y     |  N   |       | 状态：0正常，1隐藏  |
|  7   | create_by |   varchar   | 64 |   0    |    Y     |  N   |       | 创建者  |
|  8   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |
|  9   | update_by |   varchar   | 64 |   0    |    Y     |  N   |       | 更新者  |
|  10   | update_time |   datetime   | 19 |   0    |    Y     |  N   |       | 更新时间  |
|  11   | remark |   varchar   | 500 |   0    |    Y     |  N   |       | 备注  |

**表名：** <a id="mto_look_ip">mto_look_ip</a>

**说明：** 每日访问博客IP

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | date |   date   | 10 |   0    |    N     |  Y   |       | 日期  |
|  2   | ip_list |   varchar   | 1000 |   0    |    Y     |  N   |       | 当前访问IP  |
|  3   | type |   char   | 1 |   0    |    Y     |  N   |       | 类型  |
|  4   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |
|  5   | update_time |   datetime   | 19 |   0    |    Y     |  N   |       | 更新时间  |
|  6   | remark |   varchar   | 500 |   0    |    Y     |  N   |       | 备注  |

**表名：** <a id="mto_look_ip_first">mto_look_ip_first</a>

**说明：** 首次访问博客记录

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   bigint   | 20 |   0    |    N     |  Y   |       | id  |
|  2   | ip_addr |   varchar   | 128 |   0    |    Y     |  N   |       | 当前访问IP  |
|  3   | ip_location |   varchar   | 255 |   0    |    Y     |  N   |       | ip地址  |
|  4   | first_visit_url |   varchar   | 255 |   0    |    Y     |  N   |       | 首次访问URL  |
|  5   | first_visit_date |   datetime   | 19 |   0    |    Y     |  N   |       | 首次访问时间  |
|  6   | remark |   varchar   | 500 |   0    |    Y     |  N   |       | 备注  |

**表名：** <a id="mto_post">mto_post</a>

**说明：** 博客基本信息

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   bigint   | 20 |   0    |    N     |  Y   |       | id  |
|  2   | author_id |   bigint   | 20 |   0    |    Y     |  N   |       | 作者id  |
|  3   | channel_id |   bigint   | 20 |   0    |    Y     |  N   |       | 栏目id  |
|  4   | category_Id |   bigint   | 20 |   0    |    Y     |  N   |       | 导航id  |
|  5   | comments |   int   | 10 |   0    |    N     |  N   |   0    | 评论数  |
|  6   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |
|  7   | slider |   int   | 10 |   0    |    Y     |  N   |   0    | 轮播图状态(1是轮播图)  |
|  8   | favors |   int   | 10 |   0    |    N     |  N   |   0    | 收藏数(默认为0为推荐，1是推荐)  |
|  9   | featured |   int   | 10 |   0    |    N     |  N   |   0    | 推荐状态  |
|  10   | status |   int   | 10 |   0    |    N     |  N   |   0    | 文章状态  |
|  11   | summary |   varchar   | 500 |   0    |    Y     |  N   |       | 摘要  |
|  12   | tags |   varchar   | 100 |   0    |    Y     |  N   |       | 标签  |
|  13   | thumbnail |   varchar   | 500 |   0    |    Y     |  N   |       | 图片  |
|  14   | title |   varchar   | 64 |   0    |    Y     |  N   |       | title  |
|  15   | views |   int   | 10 |   0    |    N     |  N   |   0    | 查看次数  |
|  16   | weight |   int   | 10 |   0    |    N     |  N   |   0    |   |
|  17   | update_time |   datetime   | 19 |   0    |    Y     |  N   |       | 更新时间  |

**表名：** <a id="mto_post_attribute">mto_post_attribute</a>

**说明：** 博客内容

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   bigint   | 20 |   0    |    N     |  Y   |       |   |
|  2   | content |   longtext   | 2147483647 |   0    |    Y     |  N   |       |   |
|  3   | editor |   varchar   | 16 |   0    |    Y     |  N   |   tinymce    |   |

**表名：** <a id="mto_post_attribute_copy1">mto_post_attribute_copy1</a>

**说明：** 博客内容

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   bigint   | 20 |   0    |    N     |  Y   |       |   |
|  2   | content |   longtext   | 2147483647 |   0    |    Y     |  N   |       |   |
|  3   | editor |   varchar   | 16 |   0    |    Y     |  N   |   tinymce    |   |

**表名：** <a id="mto_post_tag">mto_post_tag</a>

**说明：** 博客标签

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   bigint   | 20 |   0    |    N     |  Y   |       |   |
|  2   | post_id |   bigint   | 20 |   0    |    Y     |  N   |       |   |
|  3   | tag_id |   varchar   | 64 |   0    |    Y     |  N   |       |   |
|  4   | weight |   bigint   | 20 |   0    |    Y     |  N   |       |   |

**表名：** <a id="mto_tag">mto_tag</a>

**说明：** 标签

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   bigint   | 20 |   0    |    N     |  Y   |       | 唯一id  |
|  2   | description |   varchar   | 255 |   0    |    Y     |  N   |       | 描述  |
|  3   | name |   varchar   | 32 |   0    |    N     |  N   |       | 标签名  |
|  4   | thumbnail |   varchar   | 128 |   0    |    Y     |  N   |       | 图片  |
|  5   | update_time |   datetime   | 19 |   0    |    Y     |  N   |       | 修改时间  |
|  6   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |
|  7   | status |   int   | 10 |   0    |    N     |  N   |   0    | 状态(0为正常)  |
|  8   | order_num |   int   | 10 |   0    |    Y     |  N   |   0    | 显示顺序  |

**表名：** <a id="pin_board">pin_board</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   bigint   | 20 |   0    |    N     |  Y   |       | id  |
|  2   | board_title |   varchar   | 255 |   0    |    Y     |  N   |       | 便签头  |
|  3   | board_content |   varchar   | 1200 |   0    |    Y     |  N   |       | 便签内容  |
|  4   | order_num |   int   | 10 |   0    |    Y     |  N   |   0    | 显示顺序  |
|  5   | create_by |   varchar   | 64 |   0    |    Y     |  N   |       | 创建者  |
|  6   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |
|  7   | update_by |   varchar   | 64 |   0    |    Y     |  N   |       | 更新者  |
|  8   | update_time |   datetime   | 19 |   0    |    Y     |  N   |       | 更新时间  |

**表名：** <a id="qrtz_blob_triggers">qrtz_blob_triggers</a>

**说明：** Blob类型的触发器表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | sched_name |   varchar   | 120 |   0    |    N     |  Y   |       | 调度名称  |
|  2   | trigger_name |   varchar   | 200 |   0    |    N     |  Y   |       | qrtz_triggers表trigger_name的外键  |
|  3   | trigger_group |   varchar   | 200 |   0    |    N     |  Y   |       | qrtz_triggers表trigger_group的外键  |
|  4   | blob_data |   blob   | 65535 |   0    |    Y     |  N   |       | 存放持久化Trigger对象  |

**表名：** <a id="qrtz_calendars">qrtz_calendars</a>

**说明：** 日历信息表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | sched_name |   varchar   | 120 |   0    |    N     |  Y   |       | 调度名称  |
|  2   | calendar_name |   varchar   | 200 |   0    |    N     |  Y   |       | 日历名称  |
|  3   | calendar |   blob   | 65535 |   0    |    N     |  N   |       | 存放持久化calendar对象  |

**表名：** <a id="qrtz_cron_triggers">qrtz_cron_triggers</a>

**说明：** Cron类型的触发器表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | sched_name |   varchar   | 120 |   0    |    N     |  Y   |       | 调度名称  |
|  2   | trigger_name |   varchar   | 200 |   0    |    N     |  Y   |       | qrtz_triggers表trigger_name的外键  |
|  3   | trigger_group |   varchar   | 200 |   0    |    N     |  Y   |       | qrtz_triggers表trigger_group的外键  |
|  4   | cron_expression |   varchar   | 200 |   0    |    N     |  N   |       | cron表达式  |
|  5   | time_zone_id |   varchar   | 80 |   0    |    Y     |  N   |       | 时区  |

**表名：** <a id="qrtz_fired_triggers">qrtz_fired_triggers</a>

**说明：** 已触发的触发器表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | sched_name |   varchar   | 120 |   0    |    N     |  Y   |       | 调度名称  |
|  2   | entry_id |   varchar   | 95 |   0    |    N     |  Y   |       | 调度器实例id  |
|  3   | trigger_name |   varchar   | 200 |   0    |    N     |  N   |       | qrtz_triggers表trigger_name的外键  |
|  4   | trigger_group |   varchar   | 200 |   0    |    N     |  N   |       | qrtz_triggers表trigger_group的外键  |
|  5   | instance_name |   varchar   | 200 |   0    |    N     |  N   |       | 调度器实例名  |
|  6   | fired_time |   bigint   | 20 |   0    |    N     |  N   |       | 触发的时间  |
|  7   | sched_time |   bigint   | 20 |   0    |    N     |  N   |       | 定时器制定的时间  |
|  8   | priority |   int   | 10 |   0    |    N     |  N   |       | 优先级  |
|  9   | state |   varchar   | 16 |   0    |    N     |  N   |       | 状态  |
|  10   | job_name |   varchar   | 200 |   0    |    Y     |  N   |       | 任务名称  |
|  11   | job_group |   varchar   | 200 |   0    |    Y     |  N   |       | 任务组名  |
|  12   | is_nonconcurrent |   varchar   | 1 |   0    |    Y     |  N   |       | 是否并发  |
|  13   | requests_recovery |   varchar   | 1 |   0    |    Y     |  N   |       | 是否接受恢复执行  |

**表名：** <a id="qrtz_job_details">qrtz_job_details</a>

**说明：** 任务详细信息表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | sched_name |   varchar   | 120 |   0    |    N     |  Y   |       | 调度名称  |
|  2   | job_name |   varchar   | 200 |   0    |    N     |  Y   |       | 任务名称  |
|  3   | job_group |   varchar   | 200 |   0    |    N     |  Y   |       | 任务组名  |
|  4   | description |   varchar   | 250 |   0    |    Y     |  N   |       | 相关介绍  |
|  5   | job_class_name |   varchar   | 250 |   0    |    N     |  N   |       | 执行任务类名称  |
|  6   | is_durable |   varchar   | 1 |   0    |    N     |  N   |       | 是否持久化  |
|  7   | is_nonconcurrent |   varchar   | 1 |   0    |    N     |  N   |       | 是否并发  |
|  8   | is_update_data |   varchar   | 1 |   0    |    N     |  N   |       | 是否更新数据  |
|  9   | requests_recovery |   varchar   | 1 |   0    |    N     |  N   |       | 是否接受恢复执行  |
|  10   | job_data |   blob   | 65535 |   0    |    Y     |  N   |       | 存放持久化job对象  |

**表名：** <a id="qrtz_locks">qrtz_locks</a>

**说明：** 存储的悲观锁信息表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | sched_name |   varchar   | 120 |   0    |    N     |  Y   |       | 调度名称  |
|  2   | lock_name |   varchar   | 40 |   0    |    N     |  Y   |       | 悲观锁名称  |

**表名：** <a id="qrtz_paused_trigger_grps">qrtz_paused_trigger_grps</a>

**说明：** 暂停的触发器表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | sched_name |   varchar   | 120 |   0    |    N     |  Y   |       | 调度名称  |
|  2   | trigger_group |   varchar   | 200 |   0    |    N     |  Y   |       | qrtz_triggers表trigger_group的外键  |

**表名：** <a id="qrtz_scheduler_state">qrtz_scheduler_state</a>

**说明：** 调度器状态表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | sched_name |   varchar   | 120 |   0    |    N     |  Y   |       | 调度名称  |
|  2   | instance_name |   varchar   | 200 |   0    |    N     |  Y   |       | 实例名称  |
|  3   | last_checkin_time |   bigint   | 20 |   0    |    N     |  N   |       | 上次检查时间  |
|  4   | checkin_interval |   bigint   | 20 |   0    |    N     |  N   |       | 检查间隔时间  |

**表名：** <a id="qrtz_simple_triggers">qrtz_simple_triggers</a>

**说明：** 简单触发器的信息表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | sched_name |   varchar   | 120 |   0    |    N     |  Y   |       | 调度名称  |
|  2   | trigger_name |   varchar   | 200 |   0    |    N     |  Y   |       | qrtz_triggers表trigger_name的外键  |
|  3   | trigger_group |   varchar   | 200 |   0    |    N     |  Y   |       | qrtz_triggers表trigger_group的外键  |
|  4   | repeat_count |   bigint   | 20 |   0    |    N     |  N   |       | 重复的次数统计  |
|  5   | repeat_interval |   bigint   | 20 |   0    |    N     |  N   |       | 重复的间隔时间  |
|  6   | times_triggered |   bigint   | 20 |   0    |    N     |  N   |       | 已经触发的次数  |

**表名：** <a id="qrtz_simprop_triggers">qrtz_simprop_triggers</a>

**说明：** 同步机制的行锁表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | sched_name |   varchar   | 120 |   0    |    N     |  Y   |       | 调度名称  |
|  2   | trigger_name |   varchar   | 200 |   0    |    N     |  Y   |       | qrtz_triggers表trigger_name的外键  |
|  3   | trigger_group |   varchar   | 200 |   0    |    N     |  Y   |       | qrtz_triggers表trigger_group的外键  |
|  4   | str_prop_1 |   varchar   | 512 |   0    |    Y     |  N   |       | String类型的trigger的第一个参数  |
|  5   | str_prop_2 |   varchar   | 512 |   0    |    Y     |  N   |       | String类型的trigger的第二个参数  |
|  6   | str_prop_3 |   varchar   | 512 |   0    |    Y     |  N   |       | String类型的trigger的第三个参数  |
|  7   | int_prop_1 |   int   | 10 |   0    |    Y     |  N   |       | int类型的trigger的第一个参数  |
|  8   | int_prop_2 |   int   | 10 |   0    |    Y     |  N   |       | int类型的trigger的第二个参数  |
|  9   | long_prop_1 |   bigint   | 20 |   0    |    Y     |  N   |       | long类型的trigger的第一个参数  |
|  10   | long_prop_2 |   bigint   | 20 |   0    |    Y     |  N   |       | long类型的trigger的第二个参数  |
|  11   | dec_prop_1 |   decimal   | 14 |   4    |    Y     |  N   |       | decimal类型的trigger的第一个参数  |
|  12   | dec_prop_2 |   decimal   | 14 |   4    |    Y     |  N   |       | decimal类型的trigger的第二个参数  |
|  13   | bool_prop_1 |   varchar   | 1 |   0    |    Y     |  N   |       | Boolean类型的trigger的第一个参数  |
|  14   | bool_prop_2 |   varchar   | 1 |   0    |    Y     |  N   |       | Boolean类型的trigger的第二个参数  |

**表名：** <a id="qrtz_triggers">qrtz_triggers</a>

**说明：** 触发器详细信息表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | sched_name |   varchar   | 120 |   0    |    N     |  Y   |       | 调度名称  |
|  2   | trigger_name |   varchar   | 200 |   0    |    N     |  Y   |       | 触发器的名字  |
|  3   | trigger_group |   varchar   | 200 |   0    |    N     |  Y   |       | 触发器所属组的名字  |
|  4   | job_name |   varchar   | 200 |   0    |    N     |  N   |       | qrtz_job_details表job_name的外键  |
|  5   | job_group |   varchar   | 200 |   0    |    N     |  N   |       | qrtz_job_details表job_group的外键  |
|  6   | description |   varchar   | 250 |   0    |    Y     |  N   |       | 相关介绍  |
|  7   | next_fire_time |   bigint   | 20 |   0    |    Y     |  N   |       | 上一次触发时间（毫秒）  |
|  8   | prev_fire_time |   bigint   | 20 |   0    |    Y     |  N   |       | 下一次触发时间（默认为-1表示不触发）  |
|  9   | priority |   int   | 10 |   0    |    Y     |  N   |       | 优先级  |
|  10   | trigger_state |   varchar   | 16 |   0    |    N     |  N   |       | 触发器状态  |
|  11   | trigger_type |   varchar   | 8 |   0    |    N     |  N   |       | 触发器的类型  |
|  12   | start_time |   bigint   | 20 |   0    |    N     |  N   |       | 开始时间  |
|  13   | end_time |   bigint   | 20 |   0    |    Y     |  N   |       | 结束时间  |
|  14   | calendar_name |   varchar   | 200 |   0    |    Y     |  N   |       | 日程表名称  |
|  15   | misfire_instr |   smallint   | 6 |   0    |    Y     |  N   |       | 补偿执行的策略  |
|  16   | job_data |   blob   | 65535 |   0    |    Y     |  N   |       | 存放持久化job对象  |

**表名：** <a id="sys_auth_user">sys_auth_user</a>

**说明：** 第三方授权表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | auth_id |   bigint   | 20 |   0    |    N     |  Y   |       | 授权ID  |
|  2   | uuid |   varchar   | 500 |   0    |    N     |  N   |       | 第三方平台用户唯一ID  |
|  3   | user_id |   bigint   | 20 |   0    |    Y     |  N   |       | 系统用户ID  |
|  4   | login_name |   varchar   | 30 |   0    |    N     |  N   |       | 登录账号  |
|  5   | user_name |   varchar   | 30 |   0    |    Y     |  N   |       | 用户昵称  |
|  6   | avatar |   varchar   | 500 |   0    |    Y     |  N   |       | 头像地址  |
|  7   | email |   varchar   | 255 |   0    |    Y     |  N   |       | 用户邮箱  |
|  8   | source |   varchar   | 255 |   0    |    Y     |  N   |       | 用户来源  |
|  9   | info |   varchar   | 2000 |   0    |    Y     |  N   |       | 第三方返回的所有信息  |
|  10   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |

**表名：** <a id="sys_config">sys_config</a>

**说明：** 参数配置表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | config_id |   int   | 10 |   0    |    N     |  Y   |       | 参数主键  |
|  2   | config_name |   varchar   | 100 |   0    |    Y     |  N   |       | 参数名称  |
|  3   | config_key |   varchar   | 100 |   0    |    Y     |  N   |       | 参数键名  |
|  4   | config_value |   varchar   | 500 |   0    |    Y     |  N   |       | 参数键值  |
|  5   | config_type |   char   | 1 |   0    |    Y     |  N   |   N    | 系统内置（Y是N否）  |
|  6   | create_by |   varchar   | 64 |   0    |    Y     |  N   |       | 创建者  |
|  7   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |
|  8   | update_by |   varchar   | 64 |   0    |    Y     |  N   |       | 更新者  |
|  9   | update_time |   datetime   | 19 |   0    |    Y     |  N   |       | 更新时间  |
|  10   | remark |   varchar   | 500 |   0    |    Y     |  N   |       | 备注  |

**表名：** <a id="sys_dept">sys_dept</a>

**说明：** 部门表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | dept_id |   bigint   | 20 |   0    |    N     |  Y   |       | 部门id  |
|  2   | parent_id |   bigint   | 20 |   0    |    Y     |  N   |   0    | 父部门id  |
|  3   | ancestors |   varchar   | 50 |   0    |    Y     |  N   |       | 祖级列表  |
|  4   | dept_name |   varchar   | 30 |   0    |    Y     |  N   |       | 部门名称  |
|  5   | order_num |   int   | 10 |   0    |    Y     |  N   |   0    | 显示顺序  |
|  6   | leader |   varchar   | 20 |   0    |    Y     |  N   |       | 负责人  |
|  7   | phone |   varchar   | 11 |   0    |    Y     |  N   |       | 联系电话  |
|  8   | email |   varchar   | 50 |   0    |    Y     |  N   |       | 邮箱  |
|  9   | status |   char   | 1 |   0    |    Y     |  N   |   0    | 部门状态（0正常1停用）  |
|  10   | del_flag |   char   | 1 |   0    |    Y     |  N   |   0    | 删除标志（0代表存在2代表删除）  |
|  11   | create_by |   varchar   | 64 |   0    |    Y     |  N   |       | 创建者  |
|  12   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |
|  13   | update_by |   varchar   | 64 |   0    |    Y     |  N   |       | 更新者  |
|  14   | update_time |   datetime   | 19 |   0    |    Y     |  N   |       | 更新时间  |

**表名：** <a id="sys_dict_data">sys_dict_data</a>

**说明：** 字典数据表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | dict_code |   bigint   | 20 |   0    |    N     |  Y   |       | 字典编码  |
|  2   | dict_sort |   int   | 10 |   0    |    Y     |  N   |   0    | 字典排序  |
|  3   | dict_label |   varchar   | 100 |   0    |    Y     |  N   |       | 字典标签  |
|  4   | dict_value |   varchar   | 100 |   0    |    Y     |  N   |       | 字典键值  |
|  5   | dict_type |   varchar   | 100 |   0    |    Y     |  N   |       | 字典类型  |
|  6   | css_class |   varchar   | 100 |   0    |    Y     |  N   |       | 样式属性（其他样式扩展）  |
|  7   | list_class |   varchar   | 100 |   0    |    Y     |  N   |       | 表格回显样式  |
|  8   | is_default |   char   | 1 |   0    |    Y     |  N   |   N    | 是否默认（Y是N否）  |
|  9   | status |   char   | 1 |   0    |    Y     |  N   |   0    | 状态（0正常1停用）  |
|  10   | create_by |   varchar   | 64 |   0    |    Y     |  N   |       | 创建者  |
|  11   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |
|  12   | update_by |   varchar   | 64 |   0    |    Y     |  N   |       | 更新者  |
|  13   | update_time |   datetime   | 19 |   0    |    Y     |  N   |       | 更新时间  |
|  14   | remark |   varchar   | 500 |   0    |    Y     |  N   |       | 备注  |

**表名：** <a id="sys_dict_type">sys_dict_type</a>

**说明：** 字典类型表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | dict_id |   bigint   | 20 |   0    |    N     |  Y   |       | 字典主键  |
|  2   | dict_name |   varchar   | 100 |   0    |    Y     |  N   |       | 字典名称  |
|  3   | dict_type |   varchar   | 100 |   0    |    Y     |  N   |       | 字典类型  |
|  4   | status |   char   | 1 |   0    |    Y     |  N   |   0    | 状态（0正常1停用）  |
|  5   | create_by |   varchar   | 64 |   0    |    Y     |  N   |       | 创建者  |
|  6   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |
|  7   | update_by |   varchar   | 64 |   0    |    Y     |  N   |       | 更新者  |
|  8   | update_time |   datetime   | 19 |   0    |    Y     |  N   |       | 更新时间  |
|  9   | remark |   varchar   | 500 |   0    |    Y     |  N   |       | 备注  |

**表名：** <a id="sys_job">sys_job</a>

**说明：** 定时任务调度表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | job_id |   bigint   | 20 |   0    |    N     |  Y   |       | 任务ID  |
|  2   | job_name |   varchar   | 64 |   0    |    N     |  Y   |       | 任务名称  |
|  3   | job_group |   varchar   | 64 |   0    |    N     |  Y   |   DEFAULT    | 任务组名  |
|  4   | invoke_target |   varchar   | 500 |   0    |    N     |  N   |       | 调用目标字符串  |
|  5   | cron_expression |   varchar   | 255 |   0    |    Y     |  N   |       | cron执行表达式  |
|  6   | misfire_policy |   varchar   | 20 |   0    |    Y     |  N   |   3    | 计划执行错误策略（1立即执行2执行一次3放弃执行）  |
|  7   | concurrent |   char   | 1 |   0    |    Y     |  N   |   1    | 是否并发执行（0允许1禁止）  |
|  8   | status |   char   | 1 |   0    |    Y     |  N   |   0    | 状态（0正常1暂停）  |
|  9   | create_by |   varchar   | 64 |   0    |    Y     |  N   |       | 创建者  |
|  10   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |
|  11   | update_by |   varchar   | 64 |   0    |    Y     |  N   |       | 更新者  |
|  12   | update_time |   datetime   | 19 |   0    |    Y     |  N   |       | 更新时间  |
|  13   | remark |   varchar   | 500 |   0    |    Y     |  N   |       | 备注信息  |

**表名：** <a id="sys_job_log">sys_job_log</a>

**说明：** 定时任务调度日志表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | job_log_id |   bigint   | 20 |   0    |    N     |  Y   |       | 任务日志ID  |
|  2   | job_name |   varchar   | 64 |   0    |    N     |  N   |       | 任务名称  |
|  3   | job_group |   varchar   | 64 |   0    |    N     |  N   |       | 任务组名  |
|  4   | invoke_target |   varchar   | 500 |   0    |    N     |  N   |       | 调用目标字符串  |
|  5   | job_message |   varchar   | 500 |   0    |    Y     |  N   |       | 日志信息  |
|  6   | status |   char   | 1 |   0    |    Y     |  N   |   0    | 执行状态（0正常1失败）  |
|  7   | exception_info |   varchar   | 2000 |   0    |    Y     |  N   |       | 异常信息  |
|  8   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |

**表名：** <a id="sys_logininfor">sys_logininfor</a>

**说明：** 系统访问记录

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | info_id |   bigint   | 20 |   0    |    N     |  Y   |       | 访问ID  |
|  2   | login_name |   varchar   | 50 |   0    |    Y     |  N   |       | 登录账号  |
|  3   | ipaddr |   varchar   | 128 |   0    |    Y     |  N   |       | 登录IP地址  |
|  4   | login_location |   varchar   | 255 |   0    |    Y     |  N   |       | 登录地点  |
|  5   | browser |   varchar   | 50 |   0    |    Y     |  N   |       | 浏览器类型  |
|  6   | os |   varchar   | 50 |   0    |    Y     |  N   |       | 操作系统  |
|  7   | status |   char   | 1 |   0    |    Y     |  N   |   0    | 登录状态（0成功1失败）  |
|  8   | msg |   varchar   | 255 |   0    |    Y     |  N   |       | 提示消息  |
|  9   | login_time |   datetime   | 19 |   0    |    Y     |  N   |       | 访问时间  |

**表名：** <a id="sys_mail">sys_mail</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | mail_title |   varchar   | 255 |   0    |    N     |  N   |       | 邮件标题  |
|  3   | mail_content |   varchar   | 15000 |   0    |    Y     |  N   |       | 邮件内容  |
|  4   | mail_message |   varchar   | 800 |   0    |    Y     |  N   |       | 邮件info  |
|  5   | mail_type |   int   | 10 |   0    |    Y     |  N   |       | 邮件类型：0简单邮件，1复杂邮件  |
|  6   | mail_status |   int   | 10 |   0    |    Y     |  N   |       | 邮件状态(0草稿，1成功，-1失败)  |
|  7   | mail_from |   varchar   | 50 |   0    |    Y     |  N   |       | 谁发送  |
|  8   | mail_to |   varchar   | 50 |   0    |    Y     |  N   |       | 谁接受  |
|  9   | mail_source |   varchar   | 30 |   0    |    Y     |  N   |       | 邮件发送来源  |
|  10   | del_flag |   int   | 10 |   0    |    Y     |  N   |       | 删除标志（0代表存在,1代表删除）  |
|  11   | create_by |   varchar   | 64 |   0    |    Y     |  N   |       | 创建者  |
|  12   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |
|  13   | update_by |   varchar   | 64 |   0    |    Y     |  N   |       | 更新者  |
|  14   | update_time |   datetime   | 19 |   0    |    Y     |  N   |       | 更新时间  |

**表名：** <a id="sys_menu">sys_menu</a>

**说明：** 菜单权限表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | menu_id |   bigint   | 20 |   0    |    N     |  Y   |       | 菜单ID  |
|  2   | menu_name |   varchar   | 50 |   0    |    N     |  N   |       | 菜单名称  |
|  3   | parent_id |   bigint   | 20 |   0    |    Y     |  N   |   0    | 父菜单ID  |
|  4   | order_num |   int   | 10 |   0    |    Y     |  N   |   0    | 显示顺序  |
|  5   | url |   varchar   | 200 |   0    |    Y     |  N   |   #    | 请求地址  |
|  6   | target |   varchar   | 20 |   0    |    Y     |  N   |       | 打开方式（menuItem页签menuBlank新窗口）  |
|  7   | menu_type |   char   | 1 |   0    |    Y     |  N   |       | 菜单类型（M目录C菜单F按钮）  |
|  8   | visible |   char   | 1 |   0    |    Y     |  N   |   0    | 菜单状态（0显示1隐藏）  |
|  9   | is_refresh |   char   | 1 |   0    |    Y     |  N   |   1    | 是否刷新（0刷新1不刷新）  |
|  10   | perms |   varchar   | 100 |   0    |    Y     |  N   |       | 权限标识  |
|  11   | icon |   varchar   | 100 |   0    |    Y     |  N   |   #    | 菜单图标  |
|  12   | create_by |   varchar   | 64 |   0    |    Y     |  N   |       | 创建者  |
|  13   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |
|  14   | update_by |   varchar   | 64 |   0    |    Y     |  N   |       | 更新者  |
|  15   | update_time |   datetime   | 19 |   0    |    Y     |  N   |       | 更新时间  |
|  16   | remark |   varchar   | 500 |   0    |    Y     |  N   |       | 备注  |

**表名：** <a id="sys_notice">sys_notice</a>

**说明：** 通知公告表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | notice_id |   int   | 10 |   0    |    N     |  Y   |       | 公告ID  |
|  2   | notice_title |   varchar   | 50 |   0    |    N     |  N   |       | 公告标题  |
|  3   | notice_type |   char   | 1 |   0    |    N     |  N   |       | 公告类型（1通知2公告）  |
|  4   | notice_content |   longtext   | 2147483647 |   0    |    Y     |  N   |       | 公告内容  |
|  5   | status |   char   | 1 |   0    |    Y     |  N   |   0    | 公告状态（0正常1关闭）  |
|  6   | create_by |   varchar   | 64 |   0    |    Y     |  N   |       | 创建者  |
|  7   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |
|  8   | update_by |   varchar   | 64 |   0    |    Y     |  N   |       | 更新者  |
|  9   | update_time |   datetime   | 19 |   0    |    Y     |  N   |       | 更新时间  |
|  10   | remark |   varchar   | 255 |   0    |    Y     |  N   |       | 备注  |

**表名：** <a id="sys_oper_log">sys_oper_log</a>

**说明：** 操作日志记录

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | oper_id |   bigint   | 20 |   0    |    N     |  Y   |       | 日志主键  |
|  2   | title |   varchar   | 50 |   0    |    Y     |  N   |       | 模块标题  |
|  3   | business_type |   int   | 10 |   0    |    Y     |  N   |   0    | 业务类型（0其它1新增2修改3删除）  |
|  4   | method |   varchar   | 100 |   0    |    Y     |  N   |       | 方法名称  |
|  5   | request_method |   varchar   | 10 |   0    |    Y     |  N   |       | 请求方式  |
|  6   | operator_type |   int   | 10 |   0    |    Y     |  N   |   0    | 操作类别（0其它1后台用户2手机端用户）  |
|  7   | oper_name |   varchar   | 50 |   0    |    Y     |  N   |       | 操作人员  |
|  8   | dept_name |   varchar   | 50 |   0    |    Y     |  N   |       | 部门名称  |
|  9   | oper_url |   varchar   | 255 |   0    |    Y     |  N   |       | 请求URL  |
|  10   | oper_ip |   varchar   | 128 |   0    |    Y     |  N   |       | 主机地址  |
|  11   | oper_location |   varchar   | 255 |   0    |    Y     |  N   |       | 操作地点  |
|  12   | oper_param |   varchar   | 2000 |   0    |    Y     |  N   |       | 请求参数  |
|  13   | json_result |   varchar   | 2000 |   0    |    Y     |  N   |       | 返回参数  |
|  14   | status |   int   | 10 |   0    |    Y     |  N   |   0    | 操作状态（0正常1异常）  |
|  15   | error_msg |   varchar   | 2000 |   0    |    Y     |  N   |       | 错误消息  |
|  16   | oper_time |   datetime   | 19 |   0    |    Y     |  N   |       | 操作时间  |

**表名：** <a id="sys_post">sys_post</a>

**说明：** 岗位信息表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | post_id |   bigint   | 20 |   0    |    N     |  Y   |       | 岗位ID  |
|  2   | post_code |   varchar   | 64 |   0    |    N     |  N   |       | 岗位编码  |
|  3   | post_name |   varchar   | 50 |   0    |    N     |  N   |       | 岗位名称  |
|  4   | post_sort |   int   | 10 |   0    |    N     |  N   |       | 显示顺序  |
|  5   | status |   char   | 1 |   0    |    N     |  N   |       | 状态（0正常1停用）  |
|  6   | create_by |   varchar   | 64 |   0    |    Y     |  N   |       | 创建者  |
|  7   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |
|  8   | update_by |   varchar   | 64 |   0    |    Y     |  N   |       | 更新者  |
|  9   | update_time |   datetime   | 19 |   0    |    Y     |  N   |       | 更新时间  |
|  10   | remark |   varchar   | 500 |   0    |    Y     |  N   |       | 备注  |

**表名：** <a id="sys_role">sys_role</a>

**说明：** 角色信息表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | role_id |   bigint   | 20 |   0    |    N     |  Y   |       | 角色ID  |
|  2   | role_name |   varchar   | 30 |   0    |    N     |  N   |       | 角色名称  |
|  3   | role_key |   varchar   | 100 |   0    |    N     |  N   |       | 角色权限字符串  |
|  4   | role_sort |   int   | 10 |   0    |    N     |  N   |       | 显示顺序  |
|  5   | data_scope |   char   | 1 |   0    |    Y     |  N   |   1    | 数据范围（1：全部数据权限2：自定数据权限3：本部门数据权限4：本部门及以下数据权限）  |
|  6   | status |   char   | 1 |   0    |    N     |  N   |       | 角色状态（0正常1停用）  |
|  7   | del_flag |   char   | 1 |   0    |    Y     |  N   |   0    | 删除标志（0代表存在2代表删除）  |
|  8   | create_by |   varchar   | 64 |   0    |    Y     |  N   |       | 创建者  |
|  9   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |
|  10   | update_by |   varchar   | 64 |   0    |    Y     |  N   |       | 更新者  |
|  11   | update_time |   datetime   | 19 |   0    |    Y     |  N   |       | 更新时间  |
|  12   | remark |   varchar   | 500 |   0    |    Y     |  N   |       | 备注  |

**表名：** <a id="sys_role_dept">sys_role_dept</a>

**说明：** 角色和部门关联表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | role_id |   bigint   | 20 |   0    |    N     |  Y   |       | 角色ID  |
|  2   | dept_id |   bigint   | 20 |   0    |    N     |  Y   |       | 部门ID  |

**表名：** <a id="sys_role_menu">sys_role_menu</a>

**说明：** 角色和菜单关联表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | role_id |   bigint   | 20 |   0    |    N     |  Y   |       | 角色ID  |
|  2   | menu_id |   bigint   | 20 |   0    |    N     |  Y   |       | 菜单ID  |

**表名：** <a id="sys_user">sys_user</a>

**说明：** 用户信息表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | user_id |   bigint   | 20 |   0    |    N     |  Y   |       | 用户ID  |
|  2   | dept_id |   bigint   | 20 |   0    |    Y     |  N   |       | 部门ID  |
|  3   | login_name |   varchar   | 30 |   0    |    N     |  N   |       | 登录账号  |
|  4   | user_name |   varchar   | 30 |   0    |    Y     |  N   |       | 用户昵称  |
|  5   | user_type |   varchar   | 2 |   0    |    Y     |  N   |   00    | 用户类型（00系统用户01注册用户）  |
|  6   | email |   varchar   | 50 |   0    |    Y     |  N   |       | 用户邮箱  |
|  7   | phonenumber |   varchar   | 11 |   0    |    Y     |  N   |       | 手机号码  |
|  8   | sex |   char   | 1 |   0    |    Y     |  N   |   0    | 用户性别（0男1女2未知）  |
|  9   | avatar |   varchar   | 100 |   0    |    Y     |  N   |       | 头像路径  |
|  10   | password |   varchar   | 50 |   0    |    Y     |  N   |       | 密码  |
|  11   | salt |   varchar   | 20 |   0    |    Y     |  N   |       | 盐加密  |
|  12   | status |   char   | 1 |   0    |    Y     |  N   |   0    | 帐号状态（0正常1停用）  |
|  13   | del_flag |   char   | 1 |   0    |    Y     |  N   |   0    | 删除标志（0代表存在2代表删除）  |
|  14   | login_ip |   varchar   | 128 |   0    |    Y     |  N   |       | 最后登录IP  |
|  15   | login_date |   datetime   | 19 |   0    |    Y     |  N   |       | 最后登录时间  |
|  16   | pwd_update_date |   datetime   | 19 |   0    |    Y     |  N   |       | 密码最后更新时间  |
|  17   | create_by |   varchar   | 64 |   0    |    Y     |  N   |       | 创建者  |
|  18   | create_time |   datetime   | 19 |   0    |    Y     |  N   |       | 创建时间  |
|  19   | update_by |   varchar   | 64 |   0    |    Y     |  N   |       | 更新者  |
|  20   | update_time |   datetime   | 19 |   0    |    Y     |  N   |       | 更新时间  |
|  21   | remark |   varchar   | 500 |   0    |    Y     |  N   |       | 备注  |
|  22   | totalSpace |   float   | 12 |   1    |    Y     |  N   |   0.0    | 网盘总空间  |

**表名：** <a id="sys_user_online">sys_user_online</a>

**说明：** 在线用户记录

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | sessionId |   varchar   | 50 |   0    |    N     |  Y   |       | 用户会话id  |
|  2   | login_name |   varchar   | 50 |   0    |    Y     |  N   |       | 登录账号  |
|  3   | dept_name |   varchar   | 50 |   0    |    Y     |  N   |       | 部门名称  |
|  4   | ipaddr |   varchar   | 128 |   0    |    Y     |  N   |       | 登录IP地址  |
|  5   | login_location |   varchar   | 255 |   0    |    Y     |  N   |       | 登录地点  |
|  6   | browser |   varchar   | 50 |   0    |    Y     |  N   |       | 浏览器类型  |
|  7   | os |   varchar   | 50 |   0    |    Y     |  N   |       | 操作系统  |
|  8   | status |   varchar   | 10 |   0    |    Y     |  N   |       | 在线状态on_line在线off_line离线  |
|  9   | start_timestamp |   datetime   | 19 |   0    |    Y     |  N   |       | session创建时间  |
|  10   | last_access_time |   datetime   | 19 |   0    |    Y     |  N   |       | session最后访问时间  |
|  11   | expire_time |   int   | 10 |   0    |    Y     |  N   |   0    | 超时时间，单位为分钟  |

**表名：** <a id="sys_user_post">sys_user_post</a>

**说明：** 用户与岗位关联表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | user_id |   bigint   | 20 |   0    |    N     |  Y   |       | 用户ID  |
|  2   | post_id |   bigint   | 20 |   0    |    N     |  Y   |       | 岗位ID  |

**表名：** <a id="sys_user_role">sys_user_role</a>

**说明：** 用户和角色关联表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | user_id |   bigint   | 20 |   0    |    N     |  Y   |       | 用户ID  |
|  2   | role_id |   bigint   | 20 |   0    |    N     |  Y   |       | 角色ID  |
