$(".status").each(function(){
	s=$(this);
	var status=s.html();
	if (status=="未通过"){
		s.css("color","red");
	}
	else if(status=="通过") {
		s.css("color","green");
	}
	else{
		/*console.log("审核中..");*/
	}
})/*状态样式*/


$(".keep-pwd").click(function(){
	$(".pwd-change").toggle();
	$(".info-change").hide();
	return false;
})
$(".change-info").click(function(){
	$(".info-change").toggle();
	$(".pwd-change").hide();
	return false;
})
$(".booking-exit").click(function(){
	window.location.href="../index.asp";
})


/*密码修改*/
var pwdCheck=false;
var newPwdCheck=false;
var confirmPwdCheck=false;
validatePwd("#pwd-old");
validateNewPwd("#pwd-new");
validateConfirmPwd("#pwd-confirm","#pwd-new");
$(".confirmChPwd").click(function(){
	var th_id=$("#info-id").html();
	var pwdOld=$("#pwd-old").val();
	var pwdNew=$("#pwd-new").val();
	var isfrom="cp";
	if(pwdCheck&&newPwdCheck&&confirmPwdCheck){
		$.ajax({
			url: "changeThInfo.asp",
			type: "POST",
			data:{
				"th-id": th_id,
				"pwdOld": pwdOld,
				"pwdNew": pwdNew,
				"isfrom": isfrom,
			}
		}).done(function(data){
			if(data!=""){
				amDialog("#pwd-old",data,"red");
			}else{
				dialog("密码修改成功！")
			}
		}).fail(function(xhr,status) {
	        dialog("ChangePwd:"+xhr.status+","+status);
	    })	
	}
})

/*信息修改*/
var phoneCheck=false;
var mailCheck=false;
validatePhone("#phone-new");
validateMail("#mail-new");
$(".confirmChInfo").click(function(){
	var th_id=$("#info-id").html();
	var newPhone=$("#phone-new").val();
	var newMail=$("#mail-new").val();
	var isfrom="ci";
	if(phoneCheck&&mailCheck){
		$.ajax({
			url: "changeThInfo.asp",
			type: "POST",
			data:{
				"th-id": th_id,
				"newPhone": newPhone,
				"newMail": newMail,
				"isfrom": isfrom,
			}
		}).done(function(data){
			dialog(data);
		}).fail(function(xhr,status) {
	        dialog("ChangeInfo:"+xhr.status+","+status);
	    })	
	}
})


