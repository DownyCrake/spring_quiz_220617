<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 입력</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.js" integrity="sha512-CX7sDOp7UTAq+i1FYIlf9Uo27x4os+kGeoT7rgwvY+4dmjqV0IuE/Bl5hVsjnQPQiTOhAX1O2r2j5bjsFBvv/A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- datepicker 라이브러리 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<style>
nav {background-color: #78A9ED	}
.input {height:40px }

</style>

</head>
<body>

<div class="container">
	<main class="d-flex">
		<nav class="col-2  ">
			<div class="d-flex justify-content-center align-items-center mt-5 mb-4">
				<img src="/img/weatherLogo.png" height="30px">
				<h5 class="text-white font-weight-bold mt-2 ml-2">기상청</h5>		
			</div>			
			<div>
				<ul class="nav flex-column ">
					<h5>
					<li class="nav-item font-weight-bold"> <a href="/lesson05/quiz05/1" class="nav-link text-white">날씨</a></li>
					<li class="nav-item font-weight-bold"> <a href="/lesson05/quiz05/2" class="nav-link text-white">날씨입력</a></li>
					<li class="nav-item font-weight-bold"> <a href="#" class="nav-link text-white">테마날씨</a></li>
					<li class="nav-item font-weight-bold"> <a href="#" class="nav-link text-white">관측기후</a></li>
					</h5>
				</ul>
			
			</div>
		</nav>
		<section>
		<div class="m-5 ">
			<h2><b>날씨 입력</b></h2>
			<form method="post" action="/lesson05/quiz05/add" class="m-5">
				<div class="d-flex">
					<div class="form-group d-flex p-0">
					<label for="datepicker"><b>날짜</b></label>
					<input type="text" id="datepicker" name="date" class="form-control col-8 ml-2 input" required>
					</div>
					
					<div class="form-group d-flex col-4">
					<label for="weather"><b>날씨</b></label>
					<select class="form-control col-7 ml-2 input" id="weather" name="weather">
						<option selected>맑음</option>
						<option>흐림</option>
						<option>구름조금</option>
						<option>비</option>
					</select>
					</div>
					<div class="form-group d-flex col-4">
					<label for="microDust"><b>미세먼지</b></label>
					<select class="form-control col-7 ml-2 input" id="microDust" name="microDust">
						<option selected>좋음</option>
						<option>보통</option>
						<option>나쁨</option>
						<option>최악</option>
					</select>
					</div>
					
				</div>
				<div class="d-flex justify-content-between mt-5 " >
					<div class="form-group  d-flex ">
						<label for="temperatures"><b>기온</b></label>
						<div class="input-group">
							<input type="text" id="temperatures" name="temperatures" class="form-control col-5 ml-2 input" required>
							<div class="input-group-append">
								<span class="input-group-text input">°C</span>
							</div>
						</div>	
					</div>
					<div class="form-group  d-flex">
						<label for="precipitation"><b>강수량</b></label>
						<div class="input-group">
							<input type="text" id="precipitation" name="precipitation" class="form-control col-5 ml-2 input" required>
							<div class="input-group-append">
								<span class="input-group-text input">mm</span>
							</div>
						</div>	
					</div>
					<div class="form-group  d-flex">
						<label for="windSpeed"><b>풍속</b></label>
						<div class="input-group">
							<input type="text" id="windSpeed" name="windSpeed" class="form-control col-5 ml-2 input"  required>
							<div class="input-group-append">
								<span class="input-group-text input">km/h</span>
							</div>
						</div>
					</div>
					
				</div>
				<div class="d-flex w-100  justify-content-end">
				<input type="submit" class="btn btn-success " value="저장">
				</div>
			</form>		
		</div>	
		</section>
	</main>
	<footer>
		<hr class="m-0">
		<div class="d-flex m-3">
			<div class="d-flex col-2 justify-content-center align-items-center">
				<img src="/img/weatherLogo.png" height="30px">
				<h5 class=" font-weight-bold mt-2 ml-2 text-secondary">기상청</h5>		
			</div>
			<div class="small text-secondary font-weight-bold ml-5">
				(07062) 서울시 동작구 여의대방로 16길 61<br>
				Copyright@2020 KMA. All Rights RESERVED.
			</div>
		</div>
	</footer>
</div>

<script>
	$(document).ready(function () {
		$('#datepicker').datepicker({
			dateFormat:'yyyy-MM-dd'
		});
	});
	

</script>

</body>
</html>