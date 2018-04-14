<%Response.Charset="utf-8"%>
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
  <div class="title"><span>登</span><span>录</span><span>界</span><span>面</span></div>
  <div class="box"> 
    <div class="cell">
      <label for="userid"><i class="fa fa-user"></i></label>
      <input type="text" id="userid" name="userid" placeholder="请输入ID">    
    </div>
    <div class="cell">
      <label for="password"><i class="fa fa-lock"></i></label>
      <input type="password" id="password" name="password" placeholder="请输入密码">    
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
      <div class="content"></div>
      <button class="login" type="button" value="login">登&nbsp;录</button>
    </div>
  </div>
</div>
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script src='../js/login.js' type='text/javascript'></script>
</body>
</html>