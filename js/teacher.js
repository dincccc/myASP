
$(".status").each(function(){
	s=$(this);
	var status=s.html();
	if (status=="未通过"){
		s.css("color","red");
		s.next().children().removeClass().addClass("fa fa-ban").css("color","#ccc");
	}
	else if(status=="通过") {
		s.css("color","green");
		s.next().children().removeClass().addClass("fa fa-ban").css("color","#ccc");
	}
	else{
		console.log("审核中..");
	}
})


$(".keep-pwd").click(function(ev){
	$(".pwd-change").css("display","block");
})
$(".booking-exit").click(function(){
	window.location.href="../index.asp";
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
