<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	  	<link rel="stylesheet" href="/script/maxcdn.bootstrapcdn.com_bootstrap_4.0.0_css_bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<!-- AJAX사용하려면 jquey 원본 사용 slim사용 안됨 -->
		<script src="/script/code.jquery.com_jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
 		<script src="/script/cdnjs.cloudflare.com_ajax_libs_popper.js_1.12.9_umd_popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
 		<script src="/script/maxcdn.bootstrapcdn.com_bootstrap_4.0.0_js_bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

		<meta charset="UTF-8">
		<title>즐겨찾기 추가하기</title>
	</head>
	<body>
		<div class="container">
			<h1>즐겨찾기 추가하기</h1>
			<div class="form-group">
				<div>
					<label for="name">제목</label>
					<input type="text" id="name" name="name" class="form-control">
				</div>
				<label for="url">주소</label>
				<div class="d-flex">
					<input type="text" id="url" name="url" class="form-control">
					<button type="button" class="btn btn-info" id="dupCheckBtn">중복 확인</button>
				</div>
				<small id="urlValidCheckArea"></small>
			</div>
			
			<input type="button" id="addBtn" name="addBtn" class="form-control btn-success w-100" value="추가">
		</div>
		
		<script>
			$(document).ready(function(){
				$('#addBtn').on('click', function(){
					let name = $('#name').val().trim();
					let url = $('#url').val().trim();
					
					if(name == ""){
						alert("이름을 입력하세요.")
					}
					
					if(url == ""){
						alert("주소를 입력하세요.")
					}
					
					console.log(name);
					console.log(url);
					
					$.ajax({
						  type:"post"
						, url:"/lesson06/quiz01/add-bookmark"
						, data:{"name":name, "url":url}
						, success:function(data){
							if(data == "성공") {
								location.href = "/lesson06/quiz01/get-bookmark-list";
							}
						}
						, error:function(request, status, error){
							// 에러일 때 수행 (400, 405, 500 등 모든 에러일 때 출력)
							alert(request);
							alert(status);
							alert(error);
						}
					});
				});
				
				$('#dupCheckBtn').on('click', function(){
					
					$('#urlValidCheckArea').empty();
					let url = $('#url').val().trim();
					
					if (url == ""){
						$('#urlValidCheckArea').append('<span class="text-danger">url을 입력해 주세요.</span>');
						return;
					}
					
					if (!url.startsWith("http://") && !url.startsWith("https://")){
						$('#urlValidCheckArea').append('<span class="text-danger">url이 형식에 맞지 않습니다.</span>');
						return;
					}
					
					$.ajax({
						// request
						type:"post"
						, url:"/lesson06/quiz01/is-duplication"
						, data:{"url":url}
					
						// response
						, success:function(data) {
							if (data.is_Duplication) {
								$('#urlValidCheckArea').append('<span class="text-danger">중복된 url입니다.</span>');
							} else {
								$('#urlValidCheckArea').append('<span class="text-danger">저장 가능한 url입니다.</span>');
							}
						}
						, error:function(request, status, error){
							$('#urlValidCheckArea').append('<span class="text-danger">중복 확인에 실패했습니다.</span>');
						}
					});
				});
			});
			
		</script>
	</body>
</html>