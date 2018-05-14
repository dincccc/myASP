<%Response.Charset="utf-8"%>
<!-- #include file="QL.Des.asp"-->
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录界面</title>
<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/login_common.css">
</head>
<body>
<div class="container">
  <div class="title"><span>实验室预约系统</span></div>
  <div class="box"> 
    <%
      userid=request.cookies("userid")
      password=des.Decode(request.cookies("password"))
    %>
    <div class="cell">
      <label for="userid"><i class="fa fa-user"></i></label>
      <input type="text" id="userid" name="userid" placeholder="请输入ID" value=<%=userid%>>    
    </div>
    <div class="cell">
      <label for="password"><i class="fa fa-lock"></i></label>
      <input type="password" id="password" name="password" placeholder="请输入密码" value=<%=password%>>    
    </div>
    <div class="check">
      <div class="remember">
        <input type="checkbox" id="remember" value="remember">
        <label for="remember">记住密码</label>
      </div>
      <div class="identify">
        <input type="radio" id="th" name="identify" value="1">
        <label for="th">教师</label>
        <input type="radio" id="am" name="identify" value="2">
        <label for="am">管理员</label> 
      </div>
      <div id="checkcode" class="cell">
        <input type="text" class="getcode" placeholder="请输入验证码">
        <img src="getcode.asp" class="getcode" alt="验证码" title="看不清？点击刷新" onclick="changeCode()">
      </div>
      <div class="content"></div>
      <button class="login" type="button" value="login">登&nbsp;录</button>
    </div>
  </div>
</div>
<script src="../js/jquery-3.2.1.js"></script>
<script src='../js/login.js' type='text/javascript'></script>
</body>
</html>