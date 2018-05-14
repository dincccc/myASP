<aside id="applypanel"><!-- 预约信息面板 -->
	<h1>预约申请</h1>
	<div class="apply-box">
		<div><span>周次：</span> <span class="ap_week"></span></div>
		<div><span>星期：</span> <span class="ap_day"></span></div>
		<div><span>课时：</span> <span class="ap_lesson"></span></div>
		<div><span>实验室：</span><span class="ap_address"></span></div>
		<div><span>实验室容量：</span> <span class="ap_capacity"></span></div>
		<div><span>人数：</span> <input type="number" min="1" max="200" id="ap_students"></div>
		<div><span>申请班级：</span> <select name="ap_class" id="ap_class">
			<option value="0">请选择班级</option>
				<%
					if status="th" then
						dim sqlClass
						if userid<>"" then
						sqlClass="SELECT th_class FROM teacher_class WHERE th_id='"&userid&"'"
						set rsClass=conn.execute(sqlClass)
						dim th_class:th_class=split(rsClass("th_class"),",")
						for j=0 to UBound(th_class)
				%>
						<option value=<%=j+1%>><%=th_class(j)%></option>
				<%
						next
						end if
					end if
				%>
		</select></div>
		<div>
		<span>课程名称：</span> 
		<select id="ap_cur_name">
			<option value="0">请选择课程</option>
				<%
				if status="th" then
					if userid<>"" then
					dim sql_thcour,sql_cour
					sql_thcour="SELECT th_course FROM teacher_class WHERE th_id='"&userid&"'"
					set rs_thcour=conn.execute(sql_thcour)
					dim th_cour:th_cour=split(rs_thcour("th_course"),",")
					for x=0 to UBound(th_cour)
						sql_cour="SELECT c_name FROM course_info WHERE c_code='"&th_cour(x)&"'"
						set rs_cour=conn.execute(sql_cour)
				%>
						<option value=<%=x+1%>><%=rs_cour("c_name")%></option>
				<%
						next
					else
				%>
						<option>无数据</option>
				<%
					end if
				end if
				%>
		</select>
		</div>
		<div><span>实验名称：</span> <input type="text" id="ap_exp_name"></div>
		<div><span>申请备注：</span> <input type="text" id="ap_reason"></div>
		<div><span>申请人:</span> <span class="ap_name"><%=th_name%></span></div>
		<div><span>申请人ID:</span> <span class="ap_id"><%=userid%></span></div>
		<div><span>申请日期：</span> <span class="ap_time"><%=date()%></span></div>
		<button type="button" id="apply"> <span>申</span><span>请</span></button>
		<button type="button" id="ap_exit"> <span>退</span><span>出</span></button>
	</div>

</aside>

