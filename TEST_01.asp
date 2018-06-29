<%Response.Charset="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>弹出框测试界面</title>
<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/admin.css">
<style>
body{
    background:#666;
}
/* 提示框 */
.dialog{
    z-index: 1003;
    padding: 8px;
    color: #fff;
    border-radius: 4px;
    background: rgba(0, 0, 0, 0.6);
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translateX(-50%);
    display:block;
}
</style>
<script src="../js/jquery-3.2.1.js"></script>
</head>
<body>
<div class="dialog">本时间段不能预约!</div>
</body>
</html>
<!-- 当前周次不能预约！ -->
<!-- 请保证信息填写完整！ -->
<!-- 容量超出，请选择合适的实验室！ -->
<!-- 申请重复，请勿重复预约！ -->
<!-- 申请发出，请等待审核 -->