<%
	if session.contents.count <>0 then
	session.contents.removeall()
	end if
	Response.redirect("asp/login.asp")
%>