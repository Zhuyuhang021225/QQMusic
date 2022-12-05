function ajax({type,url,data,dataType}){
    return new Promise(function(open){
        // function createXhr(xhr){
        //     var xhr=null;
        //     if(window.XMLHttpRequest){
        //         xhr=new XMLHttpReuqest();
        //     }else{
        //         xhr=new ActiveXObject("Microsoft.XmlHttp");
        //     }
        //     reuturn xhr;
        // }
        // var xhr=createXhr();
        var xhr=new XMLHttpRequest();
        xhr.onreadystatechange=function(){
            if(xhr.readyState==4&&xhr.status==200){
                var result=xhr.responseText();
                if(dataType!==undefined&&dataType.toUpperCase()=="JSON")
                    result=JSON.parse(result);
                open(result);
            }
        }
        if(typeof data ==="object"){
            var arr=[];
            for(var key in data){
                arr.push(key+"="+data[key]);
            }
            data=arr.join("&");
        }
        if(type=="get"&&data!==undefined){
            url+="?"+data;
        }
        //打开连接
        xhr.open(type,url,true);
        //消息头
        if(type==="post")
            xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        if(type==="post"&&data!==undefined)
            xhr.send(data);
        else
            xhr.send(null);
    })
}