<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL</title>

	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<h1>멤버십</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>이름</th>
					<th>전화번호</th>
					<th>등급</th>
					<th>포인트</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${membership}" var="member" varStatus="status">
				<tr>
					<td><b>${member.name}</b></td>
					<td><b>${member.phoneNumber}</b></td>
					<c:choose>
						<c:when test="${member.grade eq 'VIP'}">
					<td class="text-danger">
						</c:when>
						<c:when test="${member.grade eq 'GOLD'}">
					<td class="text-warning">
						</c:when>						
						<c:otherwise>
					<td>	
						</c:otherwise>
					</c:choose>
					<b> ${member.grade}</b></td>
					<c:if test="${member.point >= 5000}">
						<td class="text-primary">
					</c:if>
					<c:if test="${member.point < 5000}">
						<td>
					</c:if>
					<b>${member.point}</b></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>	
	
	</div>
</body>
</html>