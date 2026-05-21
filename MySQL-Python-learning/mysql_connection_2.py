import mysql.connector
connection = mysql.connector.connect(
    host="localhost",
    port=3306,
    user="root",
    password="xxxx",
    database='sql_tutorial'
)
cursor = connection.cursor()

# 取得所有部门的资料
cursor.execute('SELECT * FROM `branch`;')
records = cursor.fetchall()     #以列表的形式记录数据
for r in records:
    print(r)

cursor.close()
connection.close()
