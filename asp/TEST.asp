<!-- #include file="conn.asp"-->
<%Response.Charset="utf-8"%>
<%
    dim labAdr:labAdr=Request.QueryString("labAdr")
    if labAdr<>"" then
    dim sqlGetId:sqlGetId="SELECT * FROM lab_info WHERE lab_address='"&labAdr&"'"
    set rs=conn.execute(sqlGetId)
    if not(rs.bof and rs.eof) then
        do until rs.eof
        Response.write("{'labTypeId':"&rs("lab_type_id")&",'labId':"&rs("lab_id")&",'lab-cap':"&rs("lab_capacity")&"}")
        rs.MoveNext
        loop
    else
    end if
    end if
%>
