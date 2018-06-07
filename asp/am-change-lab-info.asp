
<div class="form-group">
	<label for="change_lab_adr">实验室地址:</label>
	<select class="form-control" id="change_lab_adr">
		<%
			call getOption()
		%>
	</select>
</div>
<div class="form-group">
	<label for="change_lab_id">实验室ID:</label>
	<input class="form-control" id="change_lab_id" disabled="disabled">
</div>
<div class="form-group">
    <label for="change_lab_type">实验模块:</label>
    <select class="form-control" id="change_lab_type">
   		<!-- #include file="conn.asp"-->
		<%
		dim sqlLabtype
		sqlLabtype="SELECT lab_type_id,lab_type_name FROM lab_type"
		set rsLabT=conn.execute(sqlLabtype)
		if not(rsLabT.bof and rsLabT.eof) then
		arr=rsLabT.getrows
		recNC=UBound(arr,2)
			for i=0 to recNC
		%>
			<option value=<%=arr(0,i)%>><%=arr(1,i)%></option>
		<%
			next
		else
		%>
			<option>无数据</option>
		<%
		end if
		%>
    </select>
</div>
<div class="form-group">
	<label for="change_lab_cap">实验室容量:</label>
	<input type="number" class="form-control" id="change_lab_cap" min="1">
</div>
<button type="button" class="btn btn-primary btn-block" id="change_lab_submit">提交</button>
<!-- #include file="conn.asp"-->
<%
	function getOption()
	dim sqlLabID_c
	sqlLabID_c="SELECT * FROM lab_info"
	set rs=conn.execute(sqlLabID_c)
	if not(rs.bof and rs.eof) then
	do until rs.eof
%>
		<option value=<%=rs("lab_id")%> onclick=setValue(<%=rs("lab_id")%>,<%=rs("lab_type_id")%>,<%=rs("lab_capacity")%>)> <%=rs("lab_address")%></option>
<%
	rs.MoveNext
	loop
	rs.close
	conn.close
	set rs=nothing
	set conn=nothing
	else
%>
		<option>无数据</option>
<%
	end if
	end function
%>	
