function createRequest(url,fn) {
		xmlhttp = false;
		if (window.XMLHttpRequest) { // 非IE浏览器
			xmlhttp = new XMLHttpRequest(); //创建XMLHttpRequest对象
		} else if (window.ActiveXObject) { // IE浏览器
			try {
				xmlhttp = new ActiveXObject("Msxml2.XMLHTTP"); //创建XMLHttpRequest对象
			} catch (e) {
				try {
					xmlhttp = new ActiveXObject("Microsoft.XMLHTTP"); //创建XMLHttpRequest对象
				} catch (e) {
				}
			}
		}
		if (!xmlhttp) {
			alert("不能创建XMLHttpRequest对象实例！");
			return false;
		}

	xmlhttp.onreadystatechange=function(url,fn){
		if (xmlhttp.readyState == 4) { // 判断请求状态
			if (xmlhttp.status == 200) { // 请求成功，开始处理返回结果

				success(xmlhttp.responseText);
				getAddress(xmlhttp.responseText);
				
				console.log("AJAX:"+xmlhttp.responseText);
			} else { // 请求页面有错误
				console.log("您所请求的页面有错误！");
			}
		}
		
	}
	xmlhttp.open('GET',url,true);
	xmlhttp.send(null);
}




