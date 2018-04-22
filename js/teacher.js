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
		console.log("审核中..");
	}
})


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
$("#confirm-ch").click(function(){
	
})

/*	$(".phone").attr("contenteditable","true");
	$(".mail").attr("contenteditable","true");*/
/*var editable=false;
$(".change-info").click(function(){
	editable==true;
})
if(editable==true){

}else{
	console.log("false");
}*/
