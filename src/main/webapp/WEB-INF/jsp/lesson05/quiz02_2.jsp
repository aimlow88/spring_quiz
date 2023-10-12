<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- -- JSTL을 사용하려면 아래의 태그를 붙여 넣는다. -->--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div class="container">
			<h3>(2) JSTL 응용하기</h3><br>
			<h1>멤버쉽</h1>
			<table class="table text-center" border="1">
				<thead>
					<tr>
						<th>이름</th>
						<th>전화번호</th>
						<th>등급</th>
						<th>포인트</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${membership}" var="member">
					<tr>
						<td>${member.name}</td>
						<td>${member.phoneNumber}</td>
						<td>
							<c:choose>
								<c:when test="${member.grade eq 'VIP'}">
									<div class="text-danger font-weight-bold display-5"> ${member.grade}</div>
								</c:when>
								<c:when test="${member.grade eq \"GOLD\"}">
									<div class="text-warning font-weight-bold display-5"> ${member.grade}</div>
								</c:when>
								<c:otherwise>
									${member.grade}
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${member.point ge 5000}">
									<div class="text-primary font-weight-bold text-weight-bold"> ${member.point}P</div>
								</c:when>
								<c:otherwise>
									${member.point}P
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</body>
</html>