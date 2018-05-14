<%Response.Charset="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理员界面</title>
<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/admin.css">
<script src="../js/jquery-3.2.1.js"></script>
<script src="../js/getWeeks.js"></script>
</head>
<body>
<!-- #include file="conn.asp"-->
<nav class="navbar  bg-dark navbar-dark ">
	<div class="navbar-brand">
		<%
		Dim am_id,am_name
		am_id=session("userid")
		am_name=session("admin_name")
		if am_name=""then
		Response.Write("<script>alert('请登录后使用，谢谢！');window.location.href='login.asp';</script>")
		else
		%>
		<i class="fa fa-id-badge get_am_id" value=<%=am_id%>></i>
		<%
		response.write("使用者："&am_name&"-ID"&am_id)
		end if
		%>
	</div>
	<div class="msg-time">当前周次：<sapn class="msg-time-weeks"></sapn></div>
</nav>
<div class="am_container">
	<aside class="am_side_left">
		<div class="card">
		    <div class="card-header text-right" data-toggle="collapse" data-parent=".am_side_left" href="#collapseOne">
		        信息查询
		    </div>
		    <div id="collapseOne" class="collapse show">
				<div class="nav flex-column nav-pills text-right" id="">
					<a class="nav-link" id="thInfoBtn">教师信息</a>
					<a class="nav-link" id="labInfoBtn">实验室信息</a>
				</div>
		    </div>
	    </div>
		<div class="card">
		    <div class="card-header text-right" data-toggle="collapse" data-parent=".am_side_left" href="#collapseSec">
		        添加信息
		    </div>
		    <div id="collapseSec" class="collapse show">
				<div class="nav flex-column nav-pills text-right" id="">
					<a class="nav-link" id="thInfoAddBtn">添加教师信息</a>
					<a class="nav-link" id="labInfoAddBtn">添加实验室信息</a>
				</div>
		    </div>
	    </div>
		<div class="card">
		    <div class="card-header text-right" data-toggle="collapse" data-parent=".am_side_left" href="#collapseTir">
		        预约管理
		    </div>
		    <div id="collapseTir" class="collapse show">
				<div class="nav flex-column nav-pills text-right" id="">
					<a class="nav-link" id="bkRecordBtn">预约记录</a>
					<a class="nav-link" id="checkHistoryBtn">审核历史</a>
				</div>
		    </div>
	    </div>
	</aside>
	<aside class="am_side_right">
		<div id="myTabContent" class="tab-content">
		    <div class="tab-pane" id="thInfoBtn_tab">
			<!-- #include file="am-thInfo-search.asp"-->
	        </div>
		    <div class="tab-pane" id="labInfoBtn_tab">
			<!-- #include file="am-labInfo-search.asp"-->
	        </div>
			<div class="tab-pane" id="thInfoAddBtn_tab">
				<div class="form-group">
					<label for="new_th_id">ID:</label>
					<input type="text" class="form-control" id="new_th_id">
				</div>
				<div class="form-group">
					<label for="new_th_name">姓名:</label>
					<input type="text" class="form-control" id="new_th_name">
				</div>
				<div class="form-group">
					性别：
				  <input type="radio" name="new_th_sex" id="new_th_man" checked>
				  <label for="new_th_man" class="new_th_sex" value="0">男</label>
				  <input type="radio" name="new_th_sex" id="new_th_female">
				  <label for="new_th_female" class="new_th_sex" value="1">女</label>
				</div>
				<div class="form-group">
					<label for="new_th_class">教学班级:</label>
					<input type="text" class="form-control" id="new_th_class" placeholder="注意：多个班级之间请用英文逗号隔开">
				</div>
				<div class="form-group">
					<label for="new_th_course">教学课程:</label>
					<input type="text" class="form-control" id="new_th_course" placeholder="注意：多个课程之间请用英文逗号隔开">
				</div>
				<div class="form-group">
					<label for="new_th_phone">号码:</label>
					<input type="text" class="form-control" id="new_th_phone">
				</div>
				<div class="form-group">
					<label for="new_th_mail">邮箱:</label>
					<input type="text" class="form-control" id="new_th_mail">
				</div>
				<button type="button" class="btn btn-primary btn-block" id="th_submit">提交</button>			
			</div>
		    <div class="tab-pane" id="labInfoAddBtn_tab">
				<div class="form-group">
					<label for="new_lab_id">实验室ID:</label>
					<input type="number" class="form-control" id="new_lab_id" min="1" >
				</div>
				<div class="form-group">
					<label for="new_lab_adr">实验室地址:</label>
					<input type="text" class="form-control" id="new_lab_adr">
				</div>
				<div class="form-group">
				    <label for="new_lab_type">实验模块:</label>
				    <select class="form-control" id="new_lab_type">
						<%
						dim sqlLabtype
						sqlLabtype="SELECT lab_type_id,lab_type_name FROM lab_type"
						set rsLabT=conn.execute(sqlLabtype)
						if not(rsLabT.bof and rsLabT.eof) then
						arr=rsLabT.getrows
						recN=UBound(arr,2)
							for i=0 to recN
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
					<label for="new_lab_cap">实验室容量:</label>
					<input type="number" class="form-control" id="new_lab_cap" min="0">
				</div>
				<button type="button" class="btn btn-primary btn-block" id="lab_submit">提交</button>
	        </div>
		    <div class="tab-pane" id="bkRecordBtn_tab">
				<table class="table table-hover">
			    <thead class="thead-dark">
			      <tr>
			        <th>序号</th>
			        <th>周次</th>
			        <th>星期</th>
			        <th>课时</th>
			        <th>实验室</th>
			        <th>预约班级</th>
			        <th>预约原因</th>
			        <th>预约状态</th>
			        <th>预约时间</th>
			        <th>批准</th>
			        <th>拒绝</th>
			      </tr>
			    </thead>
			    <tbody class="am-booking-record">
				<!-- #include file="am-booking-record.asp" -->
			    </tbody>
				</table>
		    </div>
		    <div class="tab-pane" id="checkHistoryBtn_tab">
				<table class="table table-hover">
			    <thead class="thead-dark">
			      <tr>
			        <th>序号</th>
			        <th>周次</th>
			        <th>星期</th>
			        <th>课时</th>
			        <th>实验室</th>
			        <th>预约班级</th>
			        <th>预约原因</th>
			        <th>预约状态</th>
			        <th>审核时间</th>
			      </tr>
			    </thead>
			    <tbody class="am-history-record">
				<!-- #include file="am-history-record.asp" -->
			    </tbody>
				</table>
	        </div>
		</div>
		<div class="dialog"></div>
	</aside>
	
</div>

<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="../js/validate.js" type="text/javascript"></script>
<script src="../js/admin.js" type="text/javascript"></script>
</body>
</html>