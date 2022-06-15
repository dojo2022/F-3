<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>卵購入</title>
<link rel="stylesheet" type="text/css" href="/nakao/css/common.css">
<link rel="stylesheet" type="text/css" href="/nakao/css/buy.css">
</head>
<body>

	<div>
		<button id = "gachabtn" onclick="change()">引く</button>
	</div>


	<!-- アニメーション -->
	<video id = "video" src="/nakao/img/sample.mp4" width="300" height="300" onended="finish()"></video>


	<div class = "backbtn">
		<a href="/nakao/MainServlet">
			<input type="button" value="戻る" id = "backbtn1" disabled>
		</a>
	</div>


<script src="/nakao/javascript/common.js"></script>
<script src="/nakao/javascript/buy.js"></script>

</body>
</html>