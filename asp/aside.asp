<aside id="applypanel"><!-- 预约信息面板 -->
	<h1>预约申请</h1>
	<div class="apply-box">
		<div><span>周次：</span><span class="ap_week"></span></div>
		<div><span>星期：</span><span class="ap_day"></span></div>
		<div><span>课时：</span><span class="ap_lesson"></span></div>
		<div><span>实验室：</span><span class="ap_address"></span></div>
		<div><span>实验室容量：</span><span class="ap_capacity"></span></div>
		<div><span>人数：</span><input type="number" min="1" max="200" id="ap_students"></div>
		<div><span>申请班级：</span><select name="ap_class" id="ap_class">
			<option value="0">请选择班级</option>
		</select></div>
		<div><span>申请原因：</span><input type="text" id="ap_reason"></div>
		<div><span>申请人:</span><span class="ap_name"><%=th_name%></span></div>
		<div><span>申请人ID:</span><span class="ap_id"><%=th_id%></span></div>
		<div><span>申请日期：</span><span class="ap_time"><%=date()%></span></div>
		<button type="button" id="apply">申请</button>
		<button type="button" id="ap_exit">退出</button>
	</div>
<%
if th_id<>"" then
sql="SELECT th_class FROM teacher_info WHERE th_id='"&th_id&"'"
set rs=conn.execute(sql)
th_class=rs("th_class")
response.write("<script>var SECID=document.getElementById('ap_class');var text='"&th_class&"';var arr=text.split(',');if(arr==''){}else{SECID.options.length=1;for(var i=0;i<arr.length;i++){var op=document.createElement('option');op.innerHTML=arr[i];op.value=i+1;SECID.append(op);}}</script>")
rs.close
conn.close
set rs=nothing
set conn=nothing
end if

%>
</aside>

