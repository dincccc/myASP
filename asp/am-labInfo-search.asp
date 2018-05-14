<!-- Nav tabs -->
<ul class="nav nav-tabs lab-info-tab">
    <%
    dim sql_labtype
    sql_labtype="SELECT lab_type_id,lab_type_name FROM lab_type"
    set rsLabT=conn.execute(sql_labtype)
    if not(rsLabT.bof and rsLabT.eof) then
    arr=rsLabT.getrows
    recN=UBound(arr,2)
        for i=0 to recN
         if i=0 then
    %>
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href=<%="#Lab-"&arr(0,i)%>><%=arr(1,i)%></a>
        </li>
    <%
        else
    %>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href=<%="#Lab-"&arr(0,i)%>><%=arr(1,i)%></a>
        </li>
    <%
        end if
        next
    else
    %>
        <strong>ERROR</strong>
    <%
    end if
    %>
</ul>
 
<!-- Tab panes -->
<div class="tab-content lab-info-tab">
<% 
dim myClassName
for i=1 to 5 
if i=1 then 
myClassName="tab-pane active"
else 
myClassName="tab-pane fade"
end if
%>
  <div class=<%="'"&myClassName&"'"%> id=<%="Lab-"&i%>>
    <table class="table table-bordered">
        <thead class="thead-light">
            <tr>
                <th>ID</th>
                <th>地址</th>
                <th>容量</th>
            </tr>
        </thead>
        <tbody>
        <%
        dim sqlLabInfo
        sqlLabInfo="SELECT lab_id,lab_address,lab_capacity FROM lab_info WHERE lab_type_id="&i
        set rs=conn.execute(sqlLabInfo)
        do until rs.eof
            lab_id=rs.Fields(0).value
            lab_address=rs.Fields(1).value
            lab_capacity=rs.Fields(2).value
        %>

        <tr><td><%=lab_id%></td><td><%=lab_address%></td><td><%=lab_capacity%></td></tr>

        <%
        rs.MoveNext
        loop
        %>
        </tbody>
    </table>
  </div>
<% next %>
</div>

