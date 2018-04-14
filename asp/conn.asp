<%
strConnection = "dsn=mysql;driver={mysql odbc 5.1 driver};server=localhost;uid=root;pwd=012138;database=mydatabase"  
Set conn = Server.CreateObject("adodb.Connection")  
conn.open strConnection 
%>