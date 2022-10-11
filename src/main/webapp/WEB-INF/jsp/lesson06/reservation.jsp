<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 하기</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>  

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<style>

#wrap {max-width: 1200px; margin:auto;}
#title {height: 100px;}
nav {height: 40px;
background-color:peru ;}
footer {height: 100px;}
.radioSection {height: 50px;}
.nav-link {color:white;}
.nav-link:hover {color: rgb(30, 13, 1);}
#booking-form {width: 500px;}
.logo {color:black;}
.logo:hover {color:black;}
a:hover { text-decoration:none !important }


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
  				<div class="text-center m-4"><h1><b>예약 하기</b></h1></div>
				<div class="d-flex justify-content-center">
					<form id="booking-form">
						<div class="form group">
						<label for="name"><b>이름</b></label>
						<input type="text" id="name" class="form-control">
						</div>
						<div class="form group">
						<label for="datepicker"><b>예약날짜</b></label>
						<input type="text" id="datepicker" class="form-control">
						</div>
						<div class="form group">
						<label for="day"><b>숙박일수</b></label>
						<input type="text" id="day" class="form-control">
						</div>
						<div class="form group">
						<label for="headcount"><b>숙박인원</b></label>
						<input type="text" id="headcount" class="form-control">
						</div>
						<div class="form group">
						<label for="phoneNumber"><b>전화번호</b></label>
						<input type="text" id="phoneNumber" class="form-control">
						</div>
						<button type="button" id="reserveBtn" class="btn btn-warning w-100 mt-3">예약하기</button> 
					</form>
				</div>
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
	
	$.datepicker.setDefaults({
		dateFormat: "yy-m-d"	
		, minDate : 0
	});
	$('#datepicker').datepicker();
	
	$('#reserveBtn').on('click', function(){
		// alert("크크크클릭");
	
		let name = $('#name').val().trim();
		if (name.length < 1) {
			alert("이름을 입력하세요");
			return;
		}
		
		let	datepicker = $('#datepicker').val().trim();
		if (datepicker.length < 1) {
			alert("숙박날짜를 입력하세요");
			return;
		} 
		let dateArr = datepicker.split('-');
		let date = new Date(dateArr[0],dateArr[1]-1,dateArr[2]);
		
		let	day = $('#day').val().trim();
		if ( isNaN(day) || day < 1) {
			alert("숙박일수를 입력하세요");
			return;
		}
		
		let	headcount = $('#headcount').val().trim();
		if (isNaN(headcount) || headcount < 1) {
			alert("숙박인원을 입력하세요");
			return;
		}
		
		let	phoneNumber = $('#phoneNumber').val().trim();
		if (phoneNumber.length < 1) {
			alert("전화번호를 입력하세요");
			return;
		}
		//alert(date);

		//AJAX
			$.ajax({
			//request
			type:"post"
			, url:"/lesson06/quiz03/add_booking"
			, data:{"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber}
			//responsee
			,success:function(data) {
				if (data == 'success' ) {
					alert("예약성공");
				} else {
					allert("예약실패");
				}
			}
			,error:function(request, status, error){
				alert("에러");
			}
			
		});//ajax
		
	}); // click
	
});//ready

</script>    
    
</body>
</html>