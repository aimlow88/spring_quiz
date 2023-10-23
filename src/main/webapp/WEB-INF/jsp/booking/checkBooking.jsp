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
			<section class="banner bg-info">
				<img id="bannerImage" src="/img/booking/test06_banner1.jpg" alt="banner" width="1110" height="500">
			</section>
			<section class="reserve d-flex">
				<section class="real-time-reserved col-4 d-flex justify-content-center align-items-center">
				    <div class="display-4 text-white">실시간<br>예약하기</div>
				</section>
				<section class="confirm col-4">
				    <div class="m-3">
				        <span class="reserve-confirm mr-3">예약 확인</span>
				    </div>
				
				    <!-- 예약 확인 -->
				    <div id="memberInputBox" class="m-2">
				        <div class="d-flex justify-content-end mr-3">
				            <span class="text-white">이름:</span>
				            <input type="text" id="name" class="form-control input-form">
				        </div>
				        <div class="d-flex mt-2 justify-content-end mr-3">
				            <span class="text-white">전화번호:</span>
				            <input type="text" id="phoneNumber" class="form-control input-form">
				        </div>
				
				        <!-- 버튼 -->
				        <div class="text-right mt-3 mr-3">
				            <button type="button" id="submitBtn" class="btn btn-success submit-btn">조회 하기</button>
				        </div>
				    </div>
				</section>
				<section class="inquiry col-4 d-flex justify-content-center align-items-center">
				    <div class="text-white">
				        <h4 class="font-weight-bold">예약문의:</h4>
				        <h1>010-<br>0000-1111</h1>
				    </div>
				</section>
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
				
				$('#submitBtn').on('click', function(){
					
					let name = $('#name').val().trim();
					let phoneNumber = $('#phoneNumber').val().trim();
					
					// alert($(name));
					// alert(phoneNumber);
					
					if (!name){
						alert("이름을 입력하세요.");
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
						
						type:"post"
						, url:"/booking/confirm-booking"
						, data:{"name":name, "phoneNumber":phoneNumber}
						, success:function(data){
							if (data.check_exist){
								alert("이름 : " + data.name + "\n" +
										"예약날짜 : " + data.date + "\n" +
										"숙박일수 : " + data.day + "\n" +
										"숙박인원 : " + data.headcount + "\n" +
										"상태 : " + data.state
										);
							} else {
								alert("예약내역이 없습니다.");
							}
						}
						, error:function(request, status, error){
							alert("조회에 실패하였습니다. 관리자에게 문의하세요.")
						}
					});
					
				});
				
			});
		</script>
	</body>
</html>