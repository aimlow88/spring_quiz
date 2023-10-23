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
		<title>날씨 등록</title>
	</head>
		<div class="container">
			<div class=" d-flex justify-content-center">
				<nav class="nav bg-success col-3">
					<ul>
						<li><a href="http://localhost:8080/weather-history/weatherhistory">날씨</a></li>
						<li><a href="#">날씨입력</a></li>
						<li><a href="#">테마날씨</a></li>
						<li><a href="#">관측기후</a></li>
					</ul>
				</nav>
				<section class="content bg-warning col-9">
					<form class="form-group" method="post" action="/weather-history/add-weather">
						<div class="d-flex justify-content-around">
							<div>
								<label for="date">날짜</label>
								<input type="text" id="date" name="date" class="form-control col-10">
								
							</div>
							<div>
								<label for="weather">날씨</label>
								<select id="weather" name="weather" class="form-control col-10">
									<option value="맑음" selected="selected">맑음</option>
									<option value="구름조금">구름조금</option>
									<option value="흐림">흐림</option>
									<option value="비">비</option>
								</select>
							</div>
							<div>
								<label for="microDust">미세먼지</label>
								<select id="microDust" name="microDust" class="form-control col-10">
									<option value="좋음" selected="selected">좋음</option>
									<option value="보통">보통</option>
									<option value="나쁨">나쁨</option>
									<option value="최악">최악</option>
								</select>
							</div>
						</div>
						<div class="d-flex justify-content-around">
							<div>
								<label for="temperatures">기온</label>
								<input type="text" id="temperatures" name="temperatures" class="form-control col-10">
							</div>
							<div>
								<label for="precipitation">강수량</label>
								<input type="text" id="precipitation" name="precipitation" class="form-control col-10">
							</div>
							<div>
								<label for="windSpeed">풍속</label>
								<input type="text" id="windSpeed" name="windSpeed" class="form-control col-10">
							</div>
						</div>
						<div class="d-flex justify-content-end">
							<input type="submit" value="저장" class="btn btn-success">
						</div>
					</form>
				</section>
			</div>
			<footer class="footer width=1250px height=100px">
				<div>footer입니다.</div>
			</footer>
		</div>
	</body>
</html>