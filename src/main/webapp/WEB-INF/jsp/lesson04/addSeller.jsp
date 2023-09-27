<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

		<meta charset="UTF-8">
		<title>판매자 추가</title>
	</head>
	<body>
		<div class="container">
			<h1>판매자 추가</h1>
			<form method="post" action="/lesson04/quiz01/add-seller">
				<div class="form-group">
					<label for="naickName">닉네임</label>
					<input type="text" id="nickName" name="nickname" class="form-control col-3">
				</div>
				<div class="form-group">
					<label for="profileImageUrl">프로필 사진</label>
					<input type="text" id="profileImageUrl" name="profileImageUrl" class="form-control col-5">
				</div>
				<div class="form-group">
					<label for="temperature">매너 온도</label>
					<input type="text" id="temperature" name="temperature" class="form-control col-3">
				</div>				
				<input type="submit" class="form-control btn btn-info col-2" value="추가">
			</form>
		</div>
	</body>
</html>