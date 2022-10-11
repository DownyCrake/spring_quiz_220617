<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>  

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<style>

#wrap {max-width: 1200px; margin:auto;}
#title {height: 100px;}
nav {height: 40px;
background-color:peru ;}
footer {height: 100px;}
.radioSection {height: 50px;}
.nav-link {color:white;}
.nav-link:hover {color: rgb(30, 13, 1);}
.logo {color:black;}
.logo:hover {color:black;}

</style>

</head>
<body>
    <div id="wrap">
        <header class="d-flex justify-content-center">
            <div id="title" class="d-flex align-items-center">
                <a href="/lesson06/quiz03/main_view">
               <h1 class="logo">통나무 팬션</h1>
                </a>
            </div>
        </header>
        <nav>
            <ul class="nav  nav-fill  font-weight-bold">
                <li class="nav-item">
                    <a href="#" class="nav-link ">팬션소개</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link ">객실보기</a>
                </li>
                <li class="nav-item">
                    <a href="/lesson06/quiz03/booking_view" class="nav-link ">예약하기</a>
                </li>
                <li class="nav-item">
                    <a href="/lesson06/quiz03/list_view" class="nav-link">예약목록</a>
                </li>
            </ul>
        </nav>
        <main>
  			<section>
  				<div class="text-center font-weight-bold m-4"><h1>예약 목록 보기</h1></div>
  				<table class="table text-center">
					<thead>
						<tr>
							<th>이름</th>
							<th>예약날짜</th>
							<th>숙박일수</th>
							<th>숙박인원</th>
							<th>전화번호</th>
							<th>예약상태</th>
							<th></th>
						</tr>
					</thead>	  				
  					<tbody>
						<c:forEach items="${bookList}" var="list" varStatus="status">
						<tr>
							<td>${list.name}</td>
							<td>
							
							<fmt:formatDate value="${list.date}" type="date" pattern="yyyy년 M월 d일" var="date" />  
							${date }
							</td>
							<td>${list.day}</td>
							<td>${list.headcount}</td>
							<td>${list.phoneNumber}</td>
							<td>
							<c:choose>
								<c:when test="${list.state eq '대기중'}">
								<span class="text-info">${list.state}</span>
								</c:when>
								<c:when test="${list.state eq '확정'}">
								<span class="text-success">${list.state}</span>
								</c:when>
							</c:choose>
							</td>
							<td><button type="button" class="btn btn-danger del-btn" data-booking-id="${list.id}">삭제</button></td>
							
						</tr>
						</c:forEach> 					
  					</tbody>
  				</table>
  			</section>
        </main>
        <footer>
            <div class="text-secondary mt-2">
                <small>
                    제주특별자치도 제주시 애월읍<br>
                    사업자등록번호: 111-22-25522 / 농어촌민박사업자지정 / 대표:<br>
                    Copyright 2025 All right reserved
                </small>
            </div>
        </footer>

    </div>
    
<script>

$(document).ready(function(){
	
	$('.del-btn').on('click', function(){
		
		let bookId = $(this).data('booking-id');
		alert("id:" + bookId);
		
		$.ajax({
			//request
			type:"delete"
			, url:"/lesson06/quiz03/delete_booking"
			, data: {"id":bookId}
			//response
			, success:function(data){
				if (data == "delete") {
					location.reload(true);
					alert("삭제성공");
				}else {
					alert("삭제 실패");
				}
			}
			, error:function(request, status, error){
				alert("에러");
			}
		}); //ajax
		
	});//click
	
}); //ready




</script>    
    
</body>
</html>