<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가</title>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
<div class="container">
	<h1>즐겨찾기 추가</h1>
	<form method="post" action="/lesson06/quiz01/add_favorite">
	<div class="form-group">
		<label for="name">제목</label>
		<input type="text" id="name" name="name" class="form-control">
	</div>
	<div class="form-group">
		<label for="url">주소</label>
		<input type="text" id="url" name="url" class="form-control">
	</div>
	<button type="button" id="addBtn" class="btn btn-info btn-block">추가</button>
	
	</form>

</div>

<script>

$(document).ready(function(){
	
	$('#addBtn').on('click', function(){

		let name = $('#name').val().trim();
		if (name.length < 1) {
			alert("제목을 입력하세요");
			return;
		}
		let url = $('#url').val().trim();
		if (url.length < 1) {
			alert("url을 입력하세요");
			return;
		}
		
		if (url.startsWith("http")==false && url.startsWith("https")==false){
			alert("주소 형식이 잘못되었습니다.")
			return;
		}
		
		// 서버에 인서트 요청 AJAX
		$.ajax({
			//request
			type:"POST"
			, url:"/lesson06/quiz01/add_favorite"
			, data:{"name":name,"url":url}
		
			//response
			,success:function(data){
				if (data == "success") {
					location.href = "/lesson06/quiz01/favorite_list_view"
				} else {
					alert("입력 실패");
				}
			}
			
			,error:function(request, status, error){
				alert("error");
			}
			
		});
		
	});
	
});
</script>
</body>
</html>