<%
sub sendMail(Email,mailTitle,mailContent)
Set jmail = Server.CreateObject("JMAIL.Message")   '建立发送邮件的对象
jmail.silent = true    '屏蔽例外错误，返回FALSE跟TRUE两值
jmail.logging = true   '启用邮件日志
jmail.Charset = "utf-8"     '邮件的文字编码为国标
jmail.ContentType="text/html"'邮件的格式为HTML格式
' jmessage.ContentTransferEncoding = "base64";
'jmessage.Encoding = "base64";
jmail.ISOEncodeHeaders = true
jmail.AddRecipient Email  '邮件收件人的地址
jmail.From = "dinchboom@163.com"   '发件人的E-MAIL地址
jmail.FromName = "dinchboom"   '发件人姓名
jmail.MailServerUserName = "dinchboom@163.com"     '登录邮件服务器所需的用户名
jmail.MailServerPassword = "sos12138dinch"  'gxdoidmgtebcejdh   '登录邮件服务器所需的密码
jmail.Subject = mailTitle    '邮件的标题 
jmail.HTMLBody = mailContent     '邮件的内容
jmail.Priority = 1      '邮件的紧急程序，1 为最快，5 为最慢， 3 为默认值
jmail.Send("smtp.163.com:25")
jmail.Close()   '关闭对象
end sub
%>
