<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- -- JSTL을 사용하려면 아래의 태그를 붙여 넣는다. -->--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

		<meta charset="UTF-8">
		<title>JSTL fmt 라이브러리</title>
	</head>
	<body>
		<div class="container">
			<h1>(1) JSTL Formatter 숫자, 비율</h1>
			<hr>
			<h1>1.후보자 득표율</h1>
			
			<c:set var="sum" value="0" />
			<c:forEach items="${candidates}" var="candidate">
				<fmt:formatNumber type="number" value="${sum = sum + candidate}" var="pattern1" groupingUsed="false"/>
			</c:forEach>
			<table class="table text-center">
				<thead>
					<tr>
						<th>기호</th>
						<th>득표수</th>
						<th>득표율</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${candidates}" var="candidate" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td><fmt:formatNumber type="number" value="${candidate}" /></td>
						<td><fmt:formatNumber type="percent" value="${candidate / pattern1}" /></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<hr>
			
			<h1>(2) JSTL Formatter 통화, 날짜</h1>
			<h1>2.카드명세서</h1>
			
			<table class="table text-center">
				<thead>
					<tr>
						<th>사용처</th>
						<th>가격</th>
						<th>사용날짜</th>
						<th>할부</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${cardBills}" var="bill">
					<tr>
						<td>
							${bill.store}
						</td>
						<td>
							<fmt:formatNumber type="currency" value="${bill.pay}" />
						</td>
						<td>
							<fmt:parseDate value="${bill.date}" pattern="yyyy-MM-dd" var="day"/>
							<fmt:formatDate value="${day}" pattern="yyyy년 M월 d일"/>
						</td>
						<td>${bill.installment}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		
		</div>
	</body>
</html>