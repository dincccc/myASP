<!-- #include file="conn.asp"-->
<%

Dim lab_id:lab_id=Request.QueryString("lab-id")
Dim lab_type_id:lab_type_id=Request.QueryString("lab-type-id")
Dim lab_capacity:lab_capacity=Request.QueryString("lab-cap")

'if isfrom="cp" then
	Dim sqlC:sqlC="UPDATE lab_info SET lab_type_id='"&lab_type_id&"',lab_capacity='"&lab_capacity&"' WHERE lab_id="&lab_id
	call changeLabInfo(sqlC,"实验室信息修改成功！")
' else
' 	Dim sqlD：sqlD="DELETE lab_info WHERE lab_id='"&lab_id&"'"
' 	call changeLabInfo(sqlD,"实验室信息删除成功！")
' end if

function changeLabInfo(sql,SUCCESS)
 	on error resume next
	conn.execute(sql)
  	if err.number=0 then
    	response.write(SUCCESS)
 	else
   		'response.write err.description
    	response.write("失败！原因："&err.description)
  	end if
  	conn.close
  	set conn=nothing
end function

%>