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
	
	<div class="form-group">
		<label for="name">제목</label>
		<input type="text" id="name" name="name" class="form-control">
	</div>
	
	<div class="form-group">
		<label for="url">주소</label>
		<div class="d-flex">
			<input type="text" id="url" name="url" class="form-control">
			<button type="button" class="btn btn-info" id="urlCheckBtn">중복확인</button>
		</div>
		
		<small class="text-danger d-none" id="isDuplicationText">중복된 url입니다.</small>
		<small class="text-success d-none" id="availableText">저장가능한 url입니다.</small>
		
	</div>
	<button type="button" id="addBtn" class="btn btn-success btn-block">추가</button>
	

</div>

<script>

$(document).ready(function(){
	
	$('#urlCheckBtn').on('click',function(){
		$('#urlCheckArea').empty();
		
		let url = $('#url').val().trim();
		if (url.length < 1 ){
			alert("url이 비어있습니다");
		}
		
		$.ajax({
			//request
			type:"post"
			, url: "/lesson06/quiz01/url_duplication"
			, data: {"url":url}
			//response
			, success:function(data){  // json string => object화 (jqery ajax 함수가 파싱해줌)
				if (data.dupl){
					//count1 이상 > 중복
					$('#isDuplicationText').removeClass('d-none');
					$('#availableText').addClass('d-none');
				} else {
					//사용가능
					$('#availableText').removeClass('d-none');
					$('#isDuplicationText').addClass('d-none');
				}
			}
			,error:function(e){
				alert("중복 확인 실패");
			}
			
		});//ajax
	}); //click 
	
	
	
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
		
		
		if ($('#availableText').hasClass('d-none')){
			alert("중복된 url입니다");
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