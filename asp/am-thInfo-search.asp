<!-- #include file="conn.asp"-->
<table class="table table-hover">
	<thead class="thead-dark">
		<tr>
			<th>序号</th>
			<th>ID</th>
			<th>姓名</th>
			<th>性别</th>
			<th>班级</th>
			<th>课程代码</th>
			<th>电话号码</th>
			<th>邮箱地址</th>
		</tr>
	</thead>
	<tbody>
	<%
	dim sqlThInfo,th_num
	sqlThInfo="SELECT a.th_id,a.th_name,a.th_sex,a.th_phone,a.th_mail,b.th_class,b.th_course FROM teacher_info AS a LEFT JOIN teacher_class AS b ON a.th_id=b.th_id"
	set rs=conn.execute(sqlThInfo)
	th_num=0
	do until rs.eof
	  	th_num=th_num+1
		th_id=rs.Fields(0).value
		th_name=rs.Fields(1).value
		th_sex=rs.Fields(2).value
		th_phone=rs.Fields(3).value
		th_mail=rs.Fields(4).value
		th_class=rs.Fields(5).value
		th_course=rs.Fields(6).value

		if th_sex=0 then
			th_sex="男"
		else 
			th_sex="女"
		end if
  	Response.Write("<tr><td>"&th_num&"</td><td>"&th_id&"</td><td>"&th_name&"</td><td>"&th_sex&"</td><td>"&th_class&"</td><td>"&th_course&"</td><td>"&th_phone&"</td><td>"&th_mail&"</td></tr>")
  	rs.MoveNext
	loop
	%>
	</tbody>
	<thead class="thead-dark">
		<tr>
			<th>序号</th>
			<th>ID</th>
			<th>姓名</th>
			<th>性别</th>
			<th>班级</th>
			<th>课程代码</th>
			<th>电话号码</th>
			<th>邮箱地址</th>
		</tr>
	</thead>
</table>