function ajax({type,url,data,dataType}){
	return new Promise(function(open){
		//1.创建异步对象xhr
		var xhr=new XMLHttpRequest();
		//2.绑定监听事件
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&&xhr.status==200){
				var result=xhr.responseText;
				if(dataType!==undefined&&dataType.toUpperCase()==="JSON")
					result=JSON.parse(result);
				open(result);
			}
		}
		if(typeof data === "object"){
			var arr=[];
			for(var key in data){
				arr.push(key+"="+data[key]);
			}
			data=arr.join("&");
		}
		if(type==="get"&&data!==undefined){
			url+="?"+data;
		}
		//3.打开连接
		xhr.open(type,url,true);
		//增加消息头
		if(type==="post")
		  xhr.setRequestHeader(
				"Content-Type","application/x-www-form-urlencoded"
			);
		//4.发送请求
		if(type==="post"&&data!==undefined)
			xhr.send(data);
		else
			xhr.send(null);
	})
}