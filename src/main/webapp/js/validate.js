//自定义js

//全局变量
var baseurl = "http://localhost:8080"


function validateText(username,password) {
	if(username == null || username == "" || password == null || password == ""){
		alert("用户名或密码不能为空！");
		return false;
	}else{
		return true;
	}
}

$.fn.serializeObject = function()    
{    
   var o = {};    
   var a = this.serializeArray();    
   $.each(a, function() {    
       if (o[this.name]) {    
           if (!o[this.name].push) {    
               o[this.name] = [o[this.name]];    
           }    
           o[this.name].push(this.value || '');    
       } else {    
           o[this.name] = this.value || '';    
       }    
   });    
   return o;    

};