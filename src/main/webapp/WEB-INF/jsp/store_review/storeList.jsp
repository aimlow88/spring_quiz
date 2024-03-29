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
		<title>Insert title here</title>
	</head>
	<body>
		<div class="container">
			<header class="bg-primary height=150 d-flex align-items-center">
				<div>
					<span class="text-white dispaly-3 font-weight-bold">배탈의 민족</span>
				</div>
			</header>
			<section>
				<h1>우리동네 가게</h1>
				<c:forEach items="${storeList}" var="store">
					<span class="font-weight-bold"><a href="http://localhost:8080/store-review/review-view?id=${store.id}&name=${store.name}">${store.name}</a></span><br>
					${store.phoneNumber }<br>
					${store.address }<br>
					<hr>
				</c:forEach>
			</section>
			<footer class="bg-light height=80">
				<div>
					<span class="text-white dispaly-6 font-weight-bold">우와한 형제</span>
				</div>
			</footer>
		</div>
	</body>
</html>