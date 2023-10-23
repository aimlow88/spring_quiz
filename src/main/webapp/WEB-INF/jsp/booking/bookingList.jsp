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
 		<!-- date picker 사용을 위한 스크립트 -->
 		<link rel="stylesheet" href="/script/code.jquery.com_ui_1.13.2_themes_base_jquery-ui.css">
		<script src="/script/code.jquery.com_ui_1.13.2_jquery-ui.js"></script>

		<!-- 내가 만든 stylesheet -->
		<link rel="stylesheet" type="text/css" href="/css/booking/style.css">

		<meta charset="UTF-8">
		<title>통나무 펜션</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	
	<!-- jquery 원본 -->
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	
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
	 			<h2 class="text-center font-weight-bold m-4">예약 목록 보기</h2>
				<table class="table text-center">
					<thead>
						<tr>
						    <th>이름</th>
						    <th>예약날짜</th>
						    <th>숙박일수</th>
						    <th>숙박인원</th>
						    <th>전화번호</th>
						    <th>예약상태</th>
						    <th></th>
						</tr>
			        </thead>
			        <tbody>
			        	<c:forEach items="${bookingList}" var="booking" varStatus="status">
				            <tr>
				            	<td>${booking.name}</td>
				            	<td>
				            		<fmt:parseDate value="${booking.date}" pattern="yyyy-MM-dd" var="date"/>
				            		<fmt:formatDate value="${date}" pattern="yyyy년 M월 d일"/></td>
				            	<td>${booking.day}</td>
				            	<td>${booking.headcount}</td>
				            	<td>${booking.phoneNumber}</td>
				            	<td>${booking.state}</td>
				            	<td>
				            		<button type="button" id="delBtn" value="${booking.id}" class="del-Btn form-group btn btn-danger">삭제</button>
								</td>
				            </tr>
			            </c:forEach>
			        </tbody>
			    </table>
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
				
				$(".del-Btn").on('click', function(){
					let id = $(this).val();
					// console.log(id);
					// alert(id);
				
				$.ajax({
					type:"post"
					, url:"/booking/del-booking"
					, data:{"id":id}
					, success:function(data){
						console.log(data.del_success);
						if (data.del_Success) {
							alert("삭제 성공");
							location.reload(true);
						} else {
							alert("삭제 실패 : 예약 현황을 확인해 주세요.");
						}
					}
					, error:function(request, status, error){
						alert("삭제 실패 : 관리자에 문의해 주세요.");
					}
				});
					
					
				});
				
			});
		
		</script>
		
	</body>
</html>