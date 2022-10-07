<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.js" integrity="sha512-CX7sDOp7UTAq+i1FYIlf9Uo27x4os+kGeoT7rgwvY+4dmjqV0IuE/Bl5hVsjnQPQiTOhAX1O2r2j5bjsFBvv/A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
<div class="container">
	<h1><b>즐겨 찾기 목록</b></h1>
	<table class="table text-center font-weight-bold">
		<thead>
			<tr>
				<th>No.</th>
				<th>이름</th>
				<th>주소</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${favorites}" var="favorite" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${favorite.name }</td>
					<td>${favorite.url }</td>
					<td>
						<!-- (1) value 속성을 이용해서 동적으로 id 보내기 -->	
						<!-- 
						 <button type="button" class="btn btn-danger del-btn" value="${favorite.id}">삭제</button>
						 -->
						<!-- (2) data를 이용해서 태그에 data를 임시 저장해놓기 -->
						<button type="button" class="btn del-btn btn-danger" data-favorite-id="${favorite.id}"> 삭제</button>	
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script>
$(document).ready(function(){     
 	//다른 방식 $('td').on('click','button[name=delete]', function(){ }) 모든 td에서 클릭-> name= 체크 -> function 
	$('.del-btn').on('click',function(){
	
		// (1) value 속성을 이용해서 동적으로 id 보내기 	
		//let id = $(this).val();
		//let id = e.target.value //e는 function(e) 
	
		// (2) data를 이용해서 태그에 data를 임시 저장해놓기
		// 태그: data-favorite-id  data- 뒤로는 이름을 지어준다. 꼭 - 형식. 대문자 절대X
		// 스크립트: $(this).data('favorite-id');
				
		let favoriteId = $(this).data('favorite-id');
		
		alert(favoriteId);
		
		$.ajax({
			//request
			type:"DELETE"
			, url:"/lesson06/quiz01/delete_favorite"
			, data:{"id":favoriteId}
			//response
			,success:function(data){	// json sting => object
				if (data.code == 100){
				alert(data.result);
				// location.href = "/lesson06/quiz01/favorite_list_view" 
				location.reload(true);  //화면이 위로 올라가지 않고 유지된상태로 새로고침됨
				} else{
					alert(data.errorMessage);
				}
			}
			,error:function(e){
				alert("에러");
			}
			
		});//ajax
	
	}); //click
}); //document

</script>

</body>
</html>