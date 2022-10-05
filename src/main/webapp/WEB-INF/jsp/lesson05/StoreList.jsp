<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배탈의 민족</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.js" integrity="sha512-CX7sDOp7UTAq+i1FYIlf9Uo27x4os+kGeoT7rgwvY+4dmjqV0IuE/Bl5hVsjnQPQiTOhAX1O2r2j5bjsFBvv/A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<style>
.wrap{width:800px; margin:auto;}

</style>
</head>
<body>
<div class="wrap">
<header class="bg-info">
	<div class="p-4"><h2 class="text-white font-weight-bold">배탈의 민족</h2></div>
</header>
<main>
<div class="display-4 mt-2 mb-2">우리동네 가게</div>

	<c:forEach items="${storeList}" var="storeList" varStatus="status">
	
	<form method="get" action="/lesson05/quiz06/review">
	<div class="submit border border-info form-control mt-3 mb-3">
				
		<h2><b>${storeList.name }</b></h2>
		<h4>전화번호 : ${storeList.phoneNumber }<br>
		${storeList.address }</h4>
		
	</div>
	</form>
	</c:forEach>

</main>
<footer>
	<h3>(주)우와한형제</h3>
	<span class="text-secondary font-weight-bold">고객센터:1500-1500</span>
</footer>

</div>
</body>
</html>