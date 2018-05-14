<!--#include file="conn.asp"-->
<%
dim rs,sqlstr,thIdRe
const MaxPerPage=10
dim totalPut
dim CurrentPage
dim TotalPages
dim i,j
thIdRe=session("userid")
conn.CursorLocation=3
set rs=server.CreateObject("adodb.recordset")
sqlstr="SELECT * FROM booking_record WHERE th_id="&thIdRe&" and isdel='0' ORDER BY bk_date DESC"
rs.CursorLocation=3
rs.open sqlstr,conn,1,1
rs.pagesize=MaxPerPage
If trim(Request.QueryString("page"))<>"" and IsNumeric(trim(Request.QueryString("page"))) then
	CurrentPage= CLng(request.QueryString("page"))
	If CurrentPage> rs.PageCount then
		CurrentPage = rs.PageCount
	Elseif CurrentPage<=0 then
		CurrentPage= 1
	End If
Else
	CurrentPage= 1
End If

if rs.eof then
%>
<tr><td colspan="10">当前还没有预约记录，谢谢您的关注</td></tr>
<%
else
	rs.MoveFirst
	totalPut=rs.recordcount
	if CurrentPage<>1 then
		if (currentPage-1)*MaxPerPage<totalPut then
		rs.move(currentPage-1)*MaxPerPage
		dim bookmark:bookmark=rs.bookmark
		end if
	end if

	dim n,k
	if (totalPut Mod MaxPerPage) = 0 then
	n= totalPut \ MaxPerPage
	else
	n= totalPut \ MaxPerPage + 1
	end if
	i=0
do while not rs.eof and i<maxperpage
	if rs("bk_re_status")=0 then
		bk_re_status="审核中.."
		btn_icon="reply"
	else if rs("bk_re_status")=1 then
		bk_re_status="通过"
		btn_icon="ban"
	else
		bk_re_status="未通过"
		btn_icon="ban"
		end if
	end if
	bk_week=rs("bk_week")
	bk_day=rs("bk_day")
	bk_lesson=rs("bk_lesson")
	lab_address=rs("lab_address")
	p_class=rs("class")
	exp_name=rs("exp_name")
	bk_date=rs("bk_date")
	i=i+1
	response.write "<tr><td>"&i&"</td><td>"&bk_week&"</td><td>"&bk_day&"</td><td>"&bk_lesson&"</td><td>"&lab_address&"</td><td>"&p_class&"</td><td>"&exp_name&"</td><td class='status'>"&bk_re_status&"</td><td>"&bk_date&"</td><td><i class='fa fa-"&btn_icon&" "&btn_icon&"'></i></td><td><i class='fa fa-minus-circle delete'></i></td></tr>"
	rs.movenext
	loop
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
%>
<script src="../js/th-getBookingRecord.js"></script>
<tr class="pageRecord"><td colspan="11"><span class="pageRecordTab"> 当前第<%=currentpage%>页 / 共<%=n%>页 | 每页<%=maxperpage%>条记录 | 共<%=totalPut%>条记录 | 转到第<input type="number" min=1 max=<%=n%> name="page" >页 <button type="button" id="submitPage">点击跳转</button> <a onclick=submitPage(<%=currentpage-1%>)>上一页</a> | <a onclick=submitPage(<%=currentpage+1%>) >下一页</a>
<script>
	$("#submitPage").click(function(){
		var page=$("input[name=page]").val();
		submitPage(page);
	})
</script>
<%
k=currentPage
if k<>1 then
%>
<a onclick=submitPage(1)>首页</a>
<%end if %>
| <a onclick=submitPage(<%=n%>)>尾页</a></span></td></tr>
<%end if %>