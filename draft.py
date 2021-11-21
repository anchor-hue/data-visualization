path = r'C:\\Users\\86173\\Desktop'


filename = 'data2010(2)_copy.csv'
csv_file_path = path + '\\\\' + filename
table_name='201002'

'''
用这个连接数据库
mysql --local-infile=1 -u root -p

先敲一遍这个
set global local_infile = 1;
'''
file = open(csv_file_path, 'r',encoding='utf-8')
    
csv_filename = csv_file_path
#读取csv文件第一行字段名，创建表
reader = file.readline()
b = reader.split(',')
colum = ''

for a in b:
    
    if (a[-1]=='\n'):
            a=a[:-1]
    
    c='`' + a + '`'
    colum = colum + c + ' text,'
    
    #print(f"第{i}个是 ",a)
#print(b)
colum = colum[:-1]
#编写sql，create_sql负责创建表，data_sql负责导入数据
    
    
    
create_sql = 'create table if not exists `' + table_name + '` ' + '(' + colum + ')' + ' DEFAULT CHARSET=utf8,Engine=MyISAM'
data_sql = "LOAD DATA LOCAL INFILE '%s' INTO TABLE `%s` FIELDS TERMINATED BY ',' LINES TERMINATED BY '\\r\\n' IGNORE 1 LINES" % (csv_filename,table_name)
print(create_sql)
print(data_sql)


