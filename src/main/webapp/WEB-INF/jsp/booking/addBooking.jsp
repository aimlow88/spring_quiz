<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>통나무 펜션</title>
	  	<link rel="stylesheet" href="/script/maxcdn.bootstrapcdn.com_bootstrap_4.0.0_css_bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<!-- AJAX사용하려면 jquey 원본 사용 slim사용 안됨 -->
		<script src="/script/code.jquery.com_jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
 		<script src="/script/cdnjs.cloudflare.com_ajax_libs_popper.js_1.12.9_umd_popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
 		<script src="/script/maxcdn.bootstrapcdn.com_bootstrap_4.0.0_js_bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 		<!-- date picker 사용을 위한 스크립트 -->
 		<link rel="stylesheet" href="/script/code.jquery.com_ui_1.13.2_themes_base_jquery-ui.css">
		<script src="/script/code.jquery.com_ui_1.13.2_jquery-ui.js"></script>

		<!-- 내가 만든 stylesheet -->
		<link rel="stylesheet" type="text/css" href="/css/booking/style.css">
	</head>
	<body>
		<div id="wrap" class="container">
			<header class="d-flex justify-content-center align-items-center">
				<div class="display-4">통나무 펜션</div>
			</header>
			<nav>
				<ul class="nav nav-fill">
					<li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">팬션소개</a></li>
					<li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">객실보기</a></li>
					<li class="nav-item"><a href="/booking/add-booking-view" class="nav-link text-white font-weight-bold">예약하기</a></li>
					<li class="nav-item"><a href="/booking/booking-list-view" class="nav-link text-white font-weight-bold">예약목록</a></li>
				</ul>
			</nav>
			<section class="contents">
				<h2 class="text-center font-weight-bold m-4">예약 하기</h2>
				<div class="d-flex justify-content-center">
					<div class="reservation-box">
						<div class="subject-text my-2 font-weight-bold">이름</div>
						<input type="text" id="name" class="form-control" name="name">
	
						<div class="subject-text my-2 font-weight-bold">예약날짜</div>
						<input type="text" id="date" class="form-control" name="date">
	
						<div class="subject-text my-2 font-weight-bold">숙박일수</div>
						<input type="text" id="day" class="form-control" name="day">
	
						<div class="subject-text my-2 font-weight-bold">숙박인원</div>
						<input type="text" id="headcount" class="form-control" name="headcount">
						
						<div class="subject-text my-2 font-weight-bold">전화번호</div>
						<input type="text" id="phoneNumber" class="form-control" name="phoneNumber">
						
						<button type="button" id="reservationBtn" class="btn btn-warning w-100 mt-3">예약하기</button>
					</div>
				</div>
			</section>
			<footer>
			    <small class="text-secondary">
			        제주특별자치도 제주시 애월읍<br>
			        사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표:김통목<br>
			        Copyright 2025 tongnamu. All right reserved.
			    </small>
			</footer>
		</div>
		<script>
			$(document).ready(function(){
				
				$('#date').datepicker({
					dateFormat:"yy-mm-dd"
				});
				
				$('#reservationBtn').on('click', function(){
					
					// alert("클릭");
					let name = $('#name').val().trim();
					let day = $('#day').val().trim();
					let date = $('#date').val().trim();
					let headcount = $('#headcount').val().trim();
					let phoneNumber = $('#phoneNumber').val().trim();
					
					if (!name){
						alert("이름을 입력하세요.");
						return;
					}
					
					if (day < 1 || day > 128){
						alert("숙박 가능 범위가 아닙니다.");
						return;
					}
					
					if (headcount < 1 || headcount > 128){
						alert("숙박 정원 범위가 아닙니다.");
						return;
					}
					
					if (
							!phoneNumber.startsWith("010-") &&
							!phoneNumber.startsWith("02-") &&
							!phoneNumber.startsWith("031-") &&
							!phoneNumber.startsWith("032-") &&
							!phoneNumber.startsWith("033-") &&
							!phoneNumber.startsWith("041-") &&
							!phoneNumber.startsWith("042-") &&
							!phoneNumber.startsWith("043-") &&
							!phoneNumber.startsWith("044-") &&
							!phoneNumber.startsWith("051-") &&
							!phoneNumber.startsWith("052-") &&
							!phoneNumber.startsWith("053-") &&
							!phoneNumber.startsWith("054-") &&
							!phoneNumber.startsWith("055-") &&
							!phoneNumber.startsWith("061-") &&
							!phoneNumber.startsWith("062-") &&
							!phoneNumber.startsWith("063-") &&
							!phoneNumber.startsWith("064-") &&
							!phoneNumber.startsWith("010-")
						){
							alert("유효한 전화번호가 아닙니다.");
							return;
					}
					
					$.ajax({
						
						// request
						  type:"post"
						, url:"/booking/add-booking"
						, data:{"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber}
						
						//response
						, success:function(data){
							if (data.add_Success){
								alert("예약 성공");
								location.href = "/booking/booking-list-view"
							} else {
								alert("다시 시도해 주세요.")
							}
						}
						, error:function(request, status, error){
							alert("예약 실패")
						}
						
					});
					
				});
				
			});
		</script>
	</body>
</html>