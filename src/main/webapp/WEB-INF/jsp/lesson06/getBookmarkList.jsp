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
		<title>즐겨찾기 목록</title>
	</head>
	<body>
		<div class="container">
			<h1>즐겨찾기 목록</h1>
			
			<table class="table text-center">
				<thead>
					<tr>
						<th>No.</th>
						<th>이름</th>
						<th>주소</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${resultList}" var="result" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${result.name}</td>
							<td>${result.url}</td>
							<td style="display:none;">${result.id}</td>
							<td>
								<input type="button" name="delBtn" value="삭제" class="delBtn btn btn-danger">
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<script>
			$(document).ready(function(){
				
				$('.delBtn').on('click', function(){
					var delBtn = $(this);
					var tr = delBtn.parent().parent();
					
					console.log(tr.children().eq(3).text());
					console.log(tr.children().eq(1).text());
					console.log(tr.children().eq(2).text());
					var id = tr.children().eq(3).text();
					$.ajax({
						type:"get"
						, url:"/lesson06/quiz01/delete-bookmark"
						, data:{"id":id}
						// response
						, success:function(data) { // data는 string 또는 JSON=>dictionary
							// {"code":200, "del_Success":true}
							if (data.del_Success) {
								location.href = "/lesson06/quiz01/get-bookmark-list";
							}
						}
						, error:function(request, status, error) {
							alert("삭제를 실패했습니다.");
						}
					});
				});
				
			});
		</script>
	</body>
</html>