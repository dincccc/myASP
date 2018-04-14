$(document).ready(
    $(".login").click(function(){
        var remember;
        if($("#remember").is(":checked"))
        {
            remember="1";
            console.log("选中记住密码");
        }
        else{
            remember="0";
        }
        if($("#userid").val()=='')
        {
            $('.content').html("ID不能为空，请重新输入！");
        }
        else
        {
            if($("#th")[0].checked)
            {
                login("th_check.asp","../index.asp",remember);
            }else if($("#am")[0].checked)
            {
                login("am_check.asp","../index.asp",remember);
            }
            else{
                $('.content').html("请选择身份！");
            }  
        }
    })
       
)

function login(url,target_href,remember){
 $.ajax({
        url: url+'?id='+$("#userid").val()+'&pass='+$("#password").val()+"&remember="+remember,
        type: 'GET',
    })
    .done(function(data) {
        console.log(data);
        var tips=$('.content');
        switch(data){
            case "1":
            tips.html("ID不存在，请重新输入！");
            break;
            case "2":
            tips.html("密码错误，请重新输入！");
            break;
            case "3":
            $(window).attr('location',target_href);
            break;
            default:
            break;
        }
    })
    .fail(function(xhr,status) {
        console.log(xhr.status+","+status);
    })
    .always(function() {
        console.log("complete");
    });
}


/*function rememberpwd(){
    var th_id=$.cookie("th_id");
    var th_pwd=$.cookie("th_pwd");
    if($("#userid").val()==""&&$("#password").val()==""&& th_id!="" && th_pwd!="")
    {
        $("#userid").val(th_id);
        $("#password").val(th_pwd); 
    }
    else{
        console.log("no remember");
    }
}*/


/*var loginname=document.getElementById('username');
var loginpass=document.getElementById('password');
sub.onclick=function(){
	var name=loginname.value;
	var pass=loginpass.value;
	console.log("INDEX:"+name+pass);
	if(name==''){
		var tips=document.getElementById("tips");
		tips.style.display="block"; 
		tips.innerHTML="ID不能为空，请重新输入！";
	}else{
		createRequest('check.asp?user='+name+'&pwd='+pass);
	}
	return false;
}
*/