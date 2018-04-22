<%
set re=conn.execute(sql_record)
num=0
do until re.eof
  	num=num+1
	bk_re_status=re.Fields(0).value
	lab_address=re.Fields(1).value
	week=re.Fields(2).value
	d_day=re.Fields(3).value
	lesson=re.Fields(4).value
	reason=re.Fields(5).value
	th_class=re.Fields(6).value
	th_id=re.Fields(7).value

	if bk_re_status=0 then
	status="审核中.."
	else if bk_re_status=1 then
	status="通过"
	else
	status="未通过"
	end if
	end if

	b_time=re.Fields(8).value

  	Response.Write("<tr><td>"&num&"</td><td>"&week&"</td><td>"&d_day&"</td><td>"&lesson&"</td><td>"&lab_address&"</td><td>"&th_class&"</td><td>"&reason&"</td><td class='status'>"&status&"</td><td>"&b_time&"</td>"&html&"</tr>")
  re.MoveNext
loop
re.close
conn.close
set re=nothing
set conn=nothing
%>