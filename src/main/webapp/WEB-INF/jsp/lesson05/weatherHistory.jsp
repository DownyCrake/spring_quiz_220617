<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기상청 날씨</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<style>
nav {background-color: #78A9ED	}
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
					<li class="nav-item font-weight-bold"> <a href="#" class="nav-link text-white">날씨</a></li>
					<li class="nav-item font-weight-bold"> <a href="#" class="nav-link text-white">날씨입력</a></li>
					<li class="nav-item font-weight-bold"> <a href="#" class="nav-link text-white">테마날씨</a></li>
					<li class="nav-item font-weight-bold"> <a href="#" class="nav-link text-white">관측기후</a></li>
					</h5>
				</ul>
			
			</div>
		</nav>
		<section class="col-10 ">
			<div class="m-4">
				<h3><b>과거 날씨</b></h3>
				<table class="table text-center font-weight-bold">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${weatherHistory}" var="weather" varStatus="status">
						<tr>
							<td>
							<fmt:formatDate value="${weather.date }" var="date" pattern="yyyy년 M월 d일" />
								${date }
							</td>
							<td>
							<c:choose>
								<c:when test="${weather.weather eq '비'}">
									<img src="/img/rainy.jpg" width="25px">								
								</c:when>
								<c:when test="${weather.weather eq '흐림'}">
									<img src="/img/cloudy.jpg" width="25px">								
								</c:when>
								<c:when test="${weather.weather eq '맑음'}">
									<img src="/img/sunny.jpg" width="25px">								
								</c:when>
								<c:when test="${weather.weather eq '구름조금'}">
									<img src="/img/partlyCloudy.jpg" width="25px">								
								</c:when>
							
							</c:choose>
							</td>
							<td>
							${weather.temperatures }°C
							</td>
							<td>
							${weather.precipitation }mm
							</td>
							<td>
							${weather.microDust }
							</td>
							<td>
							${weather.windSpeed }km/h
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>	
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

</body>
</html>