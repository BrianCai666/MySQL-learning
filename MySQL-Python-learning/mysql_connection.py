import mysql.connector
connection = mysql.connector.connect(
    host="localhost",
    port=3306,
    user="root",
    password="xxxx"
)
cursor = connection.cursor()

# 创建资料库
cursor.execute("CREATE DATABASE IF NOT EXISTS `qq`;")   #加 IF NOT EXISTS防止重复创建报错

# 取得所有资料库名称
cursor.execute("SHOW DATABASES;")
print(cursor.fetchall())

# 选择数据库
cursor.execute("USE `sql_tutorial`;")

# 创建表格
cursor.execute("CREATE TABLE `qq`(qq INT);")

cursor.close()
connection.close()