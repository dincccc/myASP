<!--#include file="conn.asp"-->
<%
dim rsH,sqlH,amId
const MaxPerPageH=10
dim totalPutH
dim CurrentPageH
dim TotalPagesH
dim iH
amId=session("userid")
conn.CursorLocation=3
set rsH=server.CreateObject("adodb.recordset")
sqlH="SELECT * FROM booking_record WHERE check_by="&amId&" ORDER BY check_date"
rsH.CursorLocation=3
rsH.open sqlH,conn,1,1
rsH.pagesize=MaxPerPageH
If trim(Request.QueryString("page"))<>"" and IsNumeric(trim(Request.QueryString("page"))) then
	CurrentPageH= CLng(request.QueryString("page"))
	If CurrentPageH> rsH.PageCount then
		CurrentPageH = rsH.PageCount
	Elseif CurrentPageH<=0 then
		CurrentPageH= 1
	End If
Else
	CurrentPageH= 1
End If

if rsH.eof then
%>
<tr><td colspan="10">当前还没有预约记录，谢谢您的关注</td></tr>
<%
else
	rsH.MoveFirst
	totalPutH=rsH.recordcount
	if CurrentPageH<>1 then
		if (currentPageH-1)*MaxPerPageH<totalPutH then
		rsH.move(currentPageH-1)*MaxPerPageH
		dim bookmarkH:bookmarkH=rsH.bookmark
		end if
	end if

	dim nH,kH
	if (totalPutH Mod MaxPerPageH) = 0 then
	nH= totalPutH \ MaxPerPageH
	else
	nH= totalPutH \ MaxPerPageH + 1
	end if
	iH=0
do while not rsH.eof and iH<maxperpageH
	if rsH("bk_re_status")=0 then
		bk_re_statusH="审核中.."
	else if rsH("bk_re_status")=1 then
		bk_re_statusH="通过"
	else
		bk_re_statusH="未通过"
		end if
	end if
	iH=iH+1
	bk_weekH=rsH("bk_week")
	bk_dayH=rsH("bk_day")
	bk_lessonH=rsH("bk_lesson")
	lab_addressH=rsH("lab_address")
	p_classH=rsH("class")
	exp_nameH=rsH("exp_name")
	check_dateH=rsH("check_date")
	response.write "<tr><td>"&iH&"</td><td>"&bk_weekH&"</td><td>"&bk_dayH&"</td><td>"&bk_lessonH&"</td><td>"&lab_addressH&"</td><td>"&p_classH&"</td><td>"&exp_nameH&"</td><td class='status'>"&bk_re_statusH&"</td><td>"&check_dateH&"</td></tr>"
	rsH.movenext
	loop
	rsH.close
	set rs=nothing
	conn.close
	set conn=nothing
%>
<script src="../js/am-getHistoryRecord.js"></script>
<tr class="pageRecord"><td colspan="11"><span class="pageRecordTab"> 当前第<%=currentpageH%>页 / 共<%=nH%>页 | 每页<%=maxperpageH%>条记录 | 共<%=totalPutH%>条记录 | 转到第<input type="number" min=1 max=<%=nH%> name="pageH" >页 <button type="submit" id="submitPageH">点击跳转</button> <a onclick=submitPageH(<%=currentpageH-1%>)>上一页</a> | <a onclick=submitPageH(<%=currentpageH+1%>) >下一页</a>
<script>
	$("#submitPageH").click(function(){
		var pageH=$("input[name=pageH]").val();
		submitPageH(pageH);
	})
	$(".status").each(function(){
		s=$(this);
		var status=s.html();
		if (status=="未通过"){
			s.css("color","red");
		}
		else if(status=="通过") {
			s.css("color","green");
		}
		else{
		}
	})
</script>
<%
kH=currentPageH
if kH<>1 then
%>
<a onclick=submitPageH(1)>首页</a>
<%end if %>
| <a onclick=submitPageH(<%=nH%>)>尾页</a></span></td></tr>
<%end if %>