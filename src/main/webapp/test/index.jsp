<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="JavaScript" src="../js/jquery-1.11.3.min.js"></script>
<script language="JavaScript" src="../js/validate.js"></script>
</head>


<style type="text/css">
p {
	text-indent: 2em; /*em是相对单位，2em即现在一个字大小的两倍*/
}
</style>

<body>
	<input type="text" id="userName" value="meng" />
	<input type="button" value="校验" onclick="load()" />
	<div id="result"></div>
	<form id="formAdd">
		<input type="text" value="" name="name"/>
		<input type="password" value="" name="password"/>
		<input type="button" value="add" id="add" onclick="addUser()" />
	</form>
	
	<form id="formDelete">
		<input type="text" value="" name="userId" id="userId"/>
		<input type="button" value="delete" onclick="deleteUser()" /><br>
	</form>
	
	
	<form id="formUpdate">
		<input type="text" value="" name="id"/>
		<input type="text" value="" name="name"/>
		<input type="password" value="" name="password"/>
		<input type="button" value="update" id="update" onclick="updateUser()" />
	</form>
	
	<input type="button" value="login" onclick="login()" />

	<script type="text/javascript">
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

		function load() {
			$
					.ajax({
						type : "GET",
						url : baseurl + "/training/user/category/001/books",
						contentType : "application/json",
						success : function(data) {
							showCategory(data);
						},
						error : function(data) {
							window.location.reload();
						}
					});

		}

		function login() {
			$.ajax({
				type : "POST",
				url : baseurl + "/training-server/user/login",
				data : jsonUser(),
				contentType : "application/json",
				success : function(data) {
					alert("d");
					var json = eval(data);
					alert(json.results.msg);
				},
				error : function(data) {
					alert("error ! data = " + data);
					var json = eval("(" + data + ")");
					alert(json.results.msg);
				}
			});

		}
		function addUser(url) {
			var data = $('#formAdd').serializeObject();   
			$
					.ajax({
						type : "POST",
						url : baseurl + "/training/user/add",
						data:JSON.stringify(data),
						contentType : "application/json",
						success : function(data) {
							var json = eval(data);
							alert(json.results.msg);
						},
						error : function(data) {
							alert("error ! data = " + data);
						}
					});
		}

		
		function updateUser(url) {
			alert("afads");
			var date = $('#formUpdate').serializeObject();
			alert("afads");
			$
					.ajax({
						type : "PUT",
						url : baseurl + "/training/user/update/",
						data : JSON.stringify(date),
						contentType : "application/json",
						success : function(data) {
							alert(data);
							var json = eval(data);
							alert(json.results.msg);
						},
						error : function(data) {
							alert("error ! data = " + data);
						}
					});
		}

		function deleteUser(url) {
			
			var userId = $("#userId").val();
			$
					.ajax({
						type : "DELETE",
						url : baseurl + "/training/user/delete/" + userId + "/",
						contentType : "application/json",
						success : function(data) {
							var json = eval(data);
							alert(json.results.msg);
							window.location.reload();
						},
						error : function(data) {
							var json = eval(data);
							alert("error ! data = " + json);
						}
					});
		}


		/* function jsonUser() {
			var jsonStr = "{\"User\":{\"userId\":\"002\",\"name\":\"meng\",\"password\":\"1230546\" }}";
			var json = eval("(" + jsonStr + ")");
			return jsonStr;//关键在于转换。 
		} */

		function showCategory(data) {
			var json = eval("(" + data + ")");
			if (json.results.msg == null) {
				var result = $("#result");
				var content = "categoryId : " + json.results.categoryId
						+ "<br>" + "categoryName : "
						+ json.results.categoryName + "<br>";
				for (var i = 0; i < json.results.books.length; i++) {
					content += "book" + i + ":" + "<p>" + "author : "
							+ json.results.books[i].author + "</p>" + "<p>"
							+ "bookISBNnumber : "
							+ json.results.books[i].bookISBNnumber + "</p>"
							+ "<p>" + "bookId : "
							+ json.results.books[i].bookId + "</p>" + "<p>"
							+ "ookName" + json.results.books[i].ookName
							+ "</p>"
				}

				result.html(content);
			} else {
				alert(json.results.msg);
			}
		}
	</script>

</body>
</html>