<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- -- JSTL을 사용하려면 아래의 태그를 붙여 넣는다. -->--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
	  	<link rel="stylesheet" href="/script/maxcdn.bootstrapcdn.com_bootstrap_4.0.0_css_bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<!-- AJAX사용하려면 jquey 원본 사용 slim사용 안됨 -->
		<script src="/script/code.jquery.com_jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
 		<script src="/script/cdnjs.cloudflare.com_ajax_libs_popper.js_1.12.9_umd_popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
 		<script src="/script/maxcdn.bootstrapcdn.com_bootstrap_4.0.0_js_bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

		<meta charset="UTF-8">
		<title>예약하기</title>
	</head>
	<body>
		<div class="container">
			<header class="bg-light">
				<div class="d-flex justify-content-center">
					<h1>통나무 팬션</h1>
				</div>
			</header>
			<nav></nav>
			<section>
				<div class="d-flex justify-content-center">
					<div>
						<div class="d-flex justify-content-center">
							<h3>예약하기</h3>
						</div>
						<div class="form-group">
							<label for="name">이름</label>
							<input type="text" name="name" id="name" class="form-control w-100">
						</div>
						<div class="form-group">
							<label for="date">예약날짜</label>
							<input type="text" name="date" id="date" class="form-control w-100">
						</div>
						<div class="form-group">
							<label for="day">숙박일수</label>
							<input type="text" name="day" id="day" class="form-control w-100">
						</div>
						<div class="form-group">
							<label for="headcount">숙박인원</label>
							<input type="text" name="headcount" id="headcount" class="form-control w-100">
						</div>
						<div class="form-group">
							<label for="phoneNumber">전화번호</label>
							<input type="text" name="phoneNumber" id="phoneNumber" class="form-control w-100">
						</div>
						<div class="form-group">
							<input type="button" name="bookingBtn" id="bookingBtn" class=" btn btn-warning w-100" value="예약하기">
						</div>
					</div>
				</div>
			</section>
			<footer>
			</footer>
		</div>
		
		<script>
			$(document).ready(function(){
				$('#bookingBtn').on('click', function(){
					// alert("클릭");
					
					let name = $('#name').val().trim();
					let date = $('#date').val().trim();
					let day = $('#day').val().trim();
					let headcount = $('#haedcount').val().trim();
					let phoneNumber = $('#phoneNumber').val().trim();
					if (name == "") {
						alert("이름을 입력하세요.")
					}
				});
			});
		</script>
	</body>
</html>