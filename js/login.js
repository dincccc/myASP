$(document).ready(

    $(".login").click(function(){
        if($("#vis")[0].checked)
        {
            window.location.href="../index.asp";
        }
        else
        {
            var remember;
            if($("#remember").is(":checked"))
            {
                remember="1";
                /*选中记住密码*/
            }
            else{
                remember="0";
            }
            if($("#userid").val()=='')
            {
                $('.content').html("ID不能为空！");
            }
            else if($("#password").val()=='')
            {
                $('.content').html("密码不能为空！");
            }
            else
            {
                var checkcode=$("#checkcode input").val();
                if($("#th")[0].checked)
                {
                    login("../index.asp",remember,checkcode,"th");
                }else if($("#am")[0].checked)
                {
                    login("../index.asp",remember,checkcode,"am");
                }
                else{
                    $('.content').html("请选择身份！");
                }  
            }
        }
    })
       
)       
$("#th").click(function(){
    $("#password").attr("placeholder","默认密码：999999");
})
$("#am").click(function(){
    $("#password").attr("placeholder","默认密码：666666");
})
function changeCode(){
    var ran=Math.floor(Math.random()*1000000)
    $("#checkcode img").attr("src","getcode.asp?" + ran);
}
function login(target_href,remember,checkcode,identity){
 $.ajax({
        url: "check.asp",
        type: 'POST',
        data: {
            "id": $("#userid").val(),
            "pass": $("#password").val(),
            "remember": remember,
            "code": checkcode,
            "identity": identity,
        }
    })
    .done(function(data) {
        console.log(data);
        var tips=$('.content');
        switch(data){
            case "1":
            tips.html("ID不存在，请重新输入！");
            changeCode();
            break;
            case "2":
            tips.html("密码错误，请重新输入！");
            changeCode();
            break;
            case "3":
            $(window).attr('location',target_href);
            break;
            default:
            tips.html(data);
            changeCode();
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



