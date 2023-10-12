<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- -- JSTL을 사용하려면 아래의 태그를 붙여 넣는다. -->--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

		<meta charset="UTF-8">
		<title>날씨 이력 보기</title>
	</head>
	<body>
		<div class="container">
			<div class=" d-flex justify-content-center">
				<nav class="nav bg-success col-3">
					<ul>
						<li><a href="#">날씨</a></li>
						<li><a href="http://localhost:8080/weather-history/add-weather-view">날씨입력</a></li>
						<li><a href="#">테마날씨</a></li>
						<li><a href="#">관측기후</a></li>
					</ul>
				</nav>
				<section class="content bg-warning col-9">
					<h3>과거 날씨</h3>
					<table class="table text-center">
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
							<c:forEach items="${wHistoryList}" var="w">
								<tr>
									<td>
										<fmt:parseDate value="${w.date}" pattern="yyyy-MM-dd" var="day"/>
										<fmt:formatDate value="${day}" pattern="yyyy년 M월 d일"/>
									</td>
									<td>
										<c:set value="${w.weather}" var="weather" />
										<c:choose>
											<c:when test="${weather eq '비'}">
												<img src="/img/rainy.jpg" alt="비" width="30">
											</c:when>
											<c:when test="${weather eq '흐림'}">
												<img src="/img/cloudy.jpg" alt="흐림" width="30">
											</c:when>
											<c:when test="${weather eq '맑음'}">
												<img src="/img/sunny.jpg" alt="맑음" width="30">
											</c:when>
											<c:when test="${weather eq '구름조금'}">
												<img src="/img/partlyCloudy.jpg" alt="구름조금" width="30">
											</c:when>
										</c:choose>
									</td>
									<td>${w.temperatures}℃</td>
									<td>${w.precipitation}mm</td>
									<td>${w.microDust}</td>
									<td>${w.windSpeed}km/h</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</section>
			</div>
			<footer class="footer width=1250px height=100px">
				<div>footer입니다.</div>
			</footer>
		</div>
	</body>
</html>