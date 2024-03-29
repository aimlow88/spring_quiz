<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- -- JSTL을 사용하려면 아래의 태그를 붙여 넣는다. -->--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSTL core변수 연습(1)</title>
	</head>
	<body>
		<h1>1.JSTL core 변수</h1>
		<c:set var="number1" value="36" />
		첫번째 숫자 : ${number1}<br>
		<c:set var="number2">3</c:set>
		두번째 숫자 : ${number2}<br>
		
		<h1>2.JSTL 사칙연산</h1>
		더하기 : ${number1 + number2}<br>
		빼기 : ${number1 - number2}<br>
		곱하기 : ${number1 * number2}<br>
		나누기 : ${number1 / number2}<br>
		나누기 : ${(number1 / number2)/2}<br>
		
		<h1>3. JSTL core out</h1>
		<c:out value="<title>core out</title>" />
		
		<h1>4.JSTL core if</h1>
		<c:if test="${(number1 + number2)/2 ge 10}">
			<h1>${(number1 + number2)/2}</h1>
		</c:if>
		<c:if test="${(number1 + number2)/2 lt 10}">
			<h3>${(number1 + number2)/2}</h3>
		</c:if>
		
		<h1>5.core if</h1>
		<c:if test="${(number1 * number2) gt 100}">
			<c:out value="<script>alert('너무 큰 수 입니다.')</script>" escapeXml="false"/>
		</c:if>
	</body>
</html>