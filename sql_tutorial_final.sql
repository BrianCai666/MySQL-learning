CREATE DATABASE `sql_tutorial`; #创建数据库，分号用于表示代码结束

SHOW DATABASES; 		#展示数据库

DROP DATABASE `sql_tutorial`;	#删除数据库

USE `sql_tutorial`;

# 创建表格
CREATE TABLE `student`(
	`student_id` INT PRIMARY KEY,
    `name` VARCHAR(20),
    `major` VARCHAR(20)
);


DESCRIBE `student`;

ALTER TABLE `student` ADD gpa DECIMAL(3,2);
ALTER TABLE `student` DROP gpa;

INSERT INTO `student` VALUES(1,'小白','历史'); 	#在表格中插入数据

SELECT * FROM `student`;	
# 从名为 student 的表中，查询所有的列和所有的数据行。
#SELECT * : SELECT 是查询命令，*（星号）是通配符，表示“所有列”。所以这部分的意思是“选择所有的列”。
INSERT INTO `student` VALUES(2,'小黑','生物');
INSERT INTO `student`(`name`,`major`,`student_id`) VALUES('小蓝','英语',4);	# 不同的插入方式
INSERT INTO `student`(`major`,`student_id`) VALUES('英语','5');

 
 CREATE TABLE `student_2`(
	`student_id` INT,
    `name` VARCHAR(20) NOT NULL,
    `major` VARCHAR(20) UNIQUE,
    PRIMARY KEY(`student_id`)
);
SELECT * FROM `student_2`;

# INSERT INTO `student_2` VALUES(1,NULL,'英语') 由于添加了限制(NOT NULL)，名字不能为null
INSERT INTO `student_2` VALUES(1,'小白','英语');
# INSERT INTO `student_2` VALUES(2,'小黑','英语') 由于添加了限制（UNIQUE），学科不能相同
INSERT INTO `student_2` VALUES(2,'小黑','历史');
INSERT INTO `student_2` (`name`,`student_id`) VALUES('小绿',5);
# INSERT INTO `student_2` (`name`,`major`) VALUES('小白','英语');		没有输入student_id，会报错





SET SQL_SAFE_UPDATES=0;	#关闭预设的更新模式，不再阻止你执行“全表更新”或“全表删除”这类危险操作。但是没有回滚机制，操作无法撤销。
 
 CREATE TABLE `student_3`(
	`student_id` INT PRIMARY KEY,
    `name` VARCHAR(20),
    `major` VARCHAR(20),
    `score` INT
);
INSERT INTO `student_3` VALUES(1,'小白','英语',50);
INSERT INTO `student_3` VALUES(2,'小黄','生物',90);
INSERT INTO `student_3` VALUES(3,'小绿','历史',70);
INSERT INTO `student_3` VALUES(4,'小蓝','英语',80);
INSERT INTO `student_3` VALUES(5,'小黑','化学',20);
SELECT * FROM `student_3`;

# 更新数据，将“英语”替换成“文学”
UPDATE `student_3`
SET `major` = '文学'
WHERE `major` = '英语';
 
 # 更新数据，将学号为3的同学的学科，从“历史”换成“生物”
 UPDATE `student_3`
 SET `major` = '生物'
 WHERE `student_id` = 3;
 
 # 更新数据，将“生物”和“化学”统一为“生化”
 UPDATE `student_3`
 SET `major` = '生化'
 WHERE `major` = '生物' OR `major` = '化学';
 
 # 更新数据，将学号为1的学生的数据，姓名改成“小灰”， 学科改成“物理”
 UPDATE `student_3`
 SET `name` = '小灰',`major` = '物理'
 WHERE `student_id` = 1;
 
 # 更新数据，将所有科目改成“物理”
 UPDATE `student_3`
 SET `major` = '物理';
 
# 删除数据，将第四个学生的数据删除
DELETE FROM `student_3`
WHERE `student_id` = 4;

# 删除数据，将名字是“小灰”且学科是“物理”的数据删除
DELETE FROM `student_3`
WHERE `name` = '小灰' and `major` = '物理';

# 删除数据，将分数低于60分的数据删除
DELETE FROM `student_3`
WHERE `score` < 60;




 CREATE TABLE `student_4`(
	`student_id` INT PRIMARY KEY,
    `name` VARCHAR(20),
    `major` VARCHAR(20),
    `score` INT
);
INSERT INTO `student_4` VALUES(1,'小白','英语',50);
INSERT INTO `student_4` VALUES(2,'小黄','生物',90);
INSERT INTO `student_4` VALUES(3,'小绿','历史',70);
INSERT INTO `student_4` VALUES(4,'小蓝','英语',80);
INSERT INTO `student_4` VALUES(5,'小黑','化学',20);

SELECT * FROM `student_4`; 	# 取出全部数据（*代表全部)
SELECT `name`,`major` FROM `student_4`;

SELECT *
FROM `student_4`
ORDER BY `score` DESC;	# 按照分数逆序（DESCENDING）排列，从大到小，从后到前；升序（ASCENDING，简写ASC）

SELECT *
FROM `student_4`
ORDER BY `student_id` DESC; # 按照学号逆序排列

SELECT *
FROM `student_4`
ORDER BY `student_id` ASC; # 按照学号升序排列

SELECT *
FROM `student_4`
ORDER BY `score`, `student_id`; # 先按照分数升序排列。相同分数时，按照学号升序排列

SELECT *
FROM `student_4`
LIMIT 3;	# 只查看前三行数据

SELECT *
FROM `student_4`
ORDER BY `score` DESC
LIMIT 2;				# 查询得分较高的两名同学

SELECT *
FROM `student_4`
WHERE `major` = '英语' OR `student_id` = 1;

SELECT *
FROM `student_4`
WHERE `major` = '英语' OR `score` > 30
LIMIT 4;

SELECT *
FROM `student_4`
WHERE `major` IN('历史','英语','生物');
# 等效于 WHERE `major` = '历史' OR `major` = '英语' OR `major` = '生物'


# 制作四张表格，employee，branch，client，works_with
CREATE TABLE `employee`(
	`emp_id` INT PRIMARY KEY,
    `name` VARCHAR(20),
    `birth date` DATE,
    `sex` VARCHAR(1),
    `salary` INT,
    `branch_id` INT,
    `sup_id` INT
);

CREATE TABLE `branch`(
	`branch_id` INT PRIMARY KEY,
    `branch_name` VARCHAR(20),
    `manager_id` INT,
    FOREIGN KEY (`manager_id`) REFERENCES `employee` (`emp_id`) on DELETE SET NULL
);

ALTER TABLE `employee` ADD FOREIGN KEY(`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE SET NULL;
ALTER TABLE `employee` ADD FOREIGN KEY(`sup_id`) REFERENCES `employee` (`emp_id`) ON DELETE SET NULL;

CREATE TABLE `client`(
	`client_id` INT PRIMARY KEY,
    `client_name` VARCHAR(20),
    `phone` VARCHAR(20)
);

CREATE TABLE `works_with`(
	`emp_id` INT,
    `client_id` INT,
    `total_sales` INT,
    PRIMARY KEY(`emp_id`, `client_id`),
    FOREIGN KEY (`emp_id`) REFERENCES `employee`(`emp_id`) ON DELETE CASCADE,
    FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE
);



INSERT INTO `branch` VALUES(1,'研发',NULL);
INSERT INTO `branch` VALUES(2,'行政',NULL);
INSERT INTO `branch` VALUES(3,'资讯',NULL);


INSERT INTO `employee` VALUES(206, '小黄', '1998-10-08', 'F', 50000, 1,NULL);
INSERT INTO `employee` VALUES(207, '小绿', '1985-09-16', 'M', 29000, 2,206);
INSERT INTO `employee` VALUES(208, '小黑', '2000-12-19', 'M', 35000, 3,206);
INSERT INTO `employee` VALUES(209, '小白', '1997-01-22', 'F', 39000, 3,207);
INSERT INTO `employee` VALUES(210, '小蓝', '1925-11-10', 'F', 84000, 1,207);

UPDATE `branch`
SET `manager_id` = 206
WHERE `branch_id` = 1;

UPDATE `branch`
SET `manager_id` = 207
WHERE `branch_id` = 2;

UPDATE `branch`
SET `manager_id` = 208
WHERE `branch_id` = 3;

SELECT * FROM `branch`;

INSERT INTO `client` VALUES(400, '阿狗', '254354335');
INSERT INTO `client` VALUES(401, '阿猫', '25633899');
INSERT INTO `client` VALUES(402, '旺来', '45354345');
INSERT INTO `client` VALUES(403, '露西', '54354365');
INSERT INTO `client` VALUES(404, '艾瑞克', '18783783');
SELECT * FROM `client`;

INSERT INTO `works_with` VALUES(206,400,'70000');
INSERT INTO `works_with` VALUES(207,401,'24000');
INSERT INTO `works_with` VALUES(208,402,'9800');
INSERT INTO `works_with` VALUES(209,403,'24000');
INSERT INTO `works_with` VALUES(210,404,'87940');
SELECT * FROM `works_with`;

# 以四张表格为基础，完成以下练习题

# 1.取得所有员工资料
SELECT * FROM `employee`;

# 2.取得所有客户资料
SELECT * FROM `client`;

# 3.按薪水低到高取得员工资料
SELECT *
FROM `employee`
ORDER BY `salary` ASC;

# 4.取得薪水前3高的员工
SELECT *
FROM `employee`
ORDER BY `salary` DESC
LIMIT 3;

# 取得所有员工的名字
SELECT `name` FROM `employee`;

# 拓展：唯一表示（distinct）用法：找出所有性别和部门
SELECT DISTINCT `sex` FROM `employee`;
SELECT DISTINCT `branch_id` FROM `employee`;


# aggregate functions 聚合函数
# ---1.取得员工人数
SELECT COUNT(*) FROM `employee`;

# ---2.取得所有出生于1970-01-01 之后的女性员工人数
SELECT COUNT(*) 
FROM `employee` 
WHERE `birth date` > '1970-01-01' AND 'sex' = 'F';

# ---3.取得所有员工的平均薪水
SELECT AVG(`salary`) 
FROM `employee`;

# ---4.取得所有员工薪水的总和
SELECT SUM(`salary`)
FROM `employee`;

# ---5.取得薪水最高的的员工
SELECT *
FROM `employee`
WHERE `salary` = (SELECT MAX(`salary`) FROM `employee`);

# ---6.取得薪水最低的员工
SELECT * 
FROM `employee`
WHERE `salary` = (SELECT MIN(`salary`) FROM `employee`);



# wildcards 万用字元		%代表多个字元		_代表一个字元alter

# ---1.取得电话号码尾数是335的客户
SELECT *
FROM `client`
WHERE `phone`
LIKE '%335';

# ---2.取得姓“艾”的客户
SELECT *
FROM `client`
WHERE `client_name`
LIKE '艾%';

# ---3.取得生日在12月的员工
SELECT *
FROM `employee`
WHERE `birth date`
LIKE '%12%';		# 也可以写成：LIKE '_____12';(五个下划线代替年份和分割线)



# union 联合

# --1.员工名字 union 客户名字
SELECT `name` FROM `employee`
UNION
SELECT `client_name` FROM `client`; 

# --2.员工id+员工名字 union 客户id+客户名字
SELECT `emp_id` AS 'total_id',`name` AS 'total_name'
FROM `employee`
UNION
SELECT `client_id`,`client_name`
FROM `client`;

#---3.员工薪水 union 销售金额
SELECT `salary`
FROM `employee`
UNION
SELECT `total_sales`
FROM `works_with`;


# ---join连接

# ---取得所有部门经理的名字
INSERT INTO `branch` VALUES(4,'偷懒',NULL);

SELECT * FROM `employee`
JOIN `branch` ON `emp_id` = `manager_id`;

# 只查询和join特定信息，将 * 替换成需要查询的列名
SELECT `emp_id`, `name`,`sex`,`branch_name` FROM `employee`
JOIN `branch` ON `emp_id` = `manager_id`;

SELECT `emp_id`,`name`,`branch_name`
FROM `employee` LEFT JOIN `branch`		# LEFT JOIN:不管左边如何，都查询出来（相当于要全部员工，非经理的人对应职位显示为NULL）
ON `emp_id` = `manager_id`;


# subquery 子查询 （在一条查询语句里，塞入另一个查询语句）

# ---1.研发部门经理的名字
SELECT `name` FROM `employee`
WHERE `emp_id` = (SELECT `manager_id` FROM `branch` WHERE `branch_name` = '研发');

# ---2.找出对单一客户销售金额超过50000的员工名字
SELECT `name` FROM `employee`
WHERE `emp_id` IN (SELECT `emp_id` FROM `works_with` WHERE `total_sales` > 50000);
# 注意：这里返还了多个`emp_id`，所以，不能用等号，需要用IN

 
 
 
# on delete
# ON DELETE CASCADE(级联删除)
# 当主表记录删除的时候，自动删除子表中所有引用该记录的行

# ON DELETE SET NULL（设置为空）
# 主表记录删除的时候，子表的外键自动设置为NULL