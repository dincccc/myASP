	function amDialog(ID,text,color){
		$(ID).css("border-color",color);
		$(ID).next().remove();
		$(ID).after("<div class='am-dialog'>"+text+"</div>");
	}
	/*弹出式提示框*/
	function dialog(massage){
		$(".dialog")
		.html(massage)
		.fadeIn("fast",function(){
			setTimeout(function(){
				$(".dialog")
				.stop(true,false)
				.fadeOut(100);
			}, 1000);	
		});
	}
	function validateID(ID){
		$(ID).blur(function(event) {
			if($(ID).val()==""){
				amDialog(ID,"id不能为空","red");
			}else if($(ID).val().length!=10){
				amDialog(ID,"请输入10位数的id","red");
			}
			else{
				amDialog(ID,"","green");
				idCheck=true;
			}
			event.stopPropagation();
		});
	}
	function validatePhone(ID){
		$(ID).blur(function(event) {
			if($(ID).val()==""){
				amDialog(ID,"号码不能为空","red");
			}else if($(ID).val().length!=11){
				amDialog(ID,"请输入11位数的号码","red");
			}
			else{
				amDialog(ID,"","green");
				phoneCheck=true;
			}
			event.stopPropagation();
		});
	}
	function validateOther(ID){
		$(ID).blur(function(event) {
			if($(ID).val()==""){
				amDialog(ID,"不能为空","red");
			}else{
				amDialog(ID,"","green");
				otherCheck=true;
			}
			event.stopPropagation();
		});
	}
	function validateMail(ID){
		$(ID).blur(function(event) {
			var reg=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
			if($(ID).val()==""){
				amDialog(ID,"邮箱地址不能为空","red");
			}else if(!reg.test($(ID).val())){
				amDialog(ID,"邮箱格式错误！","red");
			}else{
				amDialog(ID,"","green");
				mailCheck=true;
			}
			event.stopPropagation();
		});
	}
	function validatePwd(ID){
		$(ID).blur(function(event) {
			var reg=/^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]{6,22}$/;
			if($(ID).val()==""){
				amDialog(ID,"密码不能为空","red");
			}else if(!reg.test($(ID).val())){
				amDialog(ID,"密码为6~12位的数字、字母或特殊字符！","red");
			}else{
				amDialog(ID,"","green");
				pwdCheck=true;
			}
			event.stopPropagation();
		});
	}
	function validateNewPwd(ID){
		$(ID).blur(function(event) {
			var reg=/^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]{6,22}$/;
			if($(ID).val()==""){
				amDialog(ID,"密码不能为空","red");
			}else if(!reg.test($(ID).val())){
				amDialog(ID,"密码为6~12位的数字、字母或特殊字符！","red");
			}else{
				amDialog(ID,"","green");
				newPwdCheck=true;
			}
			event.stopPropagation();
		});
	}
	function validateConfirmPwd(ID,newD){
		$(ID).blur(function(event) {
			var reg=/^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]{6,22}$/;
			if($(ID).val()==""){
				amDialog(ID,"密码不能为空","red");
			}else if(!reg.test($(ID).val())){
				amDialog(ID,"密码为6~12位的数字、字母或特殊字符！","red");
			}else if($(ID).val()!=$(newD).val()){
				amDialog(ID,"新旧密码不一致！","red");
			}else{
				amDialog(ID,"","green");
				confirmPwdCheck=true;
			}
			event.stopPropagation();
		});
	}
	function validateClass(ID){
		$(ID).blur(function(event) {
			var reg=/^(\S+){1}$|^((\S+\,)+\S+)$/;
			if($(ID).val()==""){
				amDialog(ID,"班级不能为空","red");
			}else if(!reg.test($(ID).val())){
				amDialog(ID,"班级格式不对！","red");
			}else{
				amDialog(ID,"","green");
				classCheck=true;
			}
			event.stopPropagation();
		});
	}
	function validateCourse(ID){
		$(ID).blur(function(event) {
			var reg=/^((HW|SW|IOT|CC|IS){1}[0-9]{5}){1}$|^((HW|SW|IOT|CC|IS){1}[0-9]{5}\,)+(HW|SW|IOT|CC|IS){1}[0-9]{5}$/;
			if($(ID).val()==""){
				amDialog(ID,"课程代码不能为空","red");
			}else if(!reg.test($(ID).val())){
				amDialog(ID,"课程代码格式不对！","red");
			}else{
				amDialog(ID,"","green");
				courseCheck=true;
			}
			event.stopPropagation();
		});
	}