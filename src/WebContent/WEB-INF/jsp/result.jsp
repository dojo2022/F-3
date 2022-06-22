<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>退勤</title>
<link rel="stylesheet" type="text/css" href="/nakao/css/common.css">
<link rel="stylesheet" type="text/css" href="/nakao/css/result.css">
<script src="/nakao/javascript/common.js"></script>
</head>

<body id="main">

	<div class="den">
	    <img src="/nakao/img/main_image/${resultChara.getEggimg()}" width="" height="">
	</div>

	<div class="cen">
	    <img src="/nakao/img/main_image/${resultChara.getCharaimg1()}" width="" height="">
	</div>



	  <div class="blackboard-box">
	  	<br>
	    <p>退勤しました。</p>
	    <p>本日も一日お疲れ様でした。</p>
		<br>
	    <div class="chalk1"></div>
	    <div class="chalk2"></div>
	  </div>

	<!-- 画面を閉じる -->
	<form method="POST" action="/nakao/ResultServlet">
		<button class="ok"><img src="/nakao/img/okbtn.png" width="140px" height="40px" ></button>
	</form>
</body>
</html>
<!--resultCharaに情報を格納しています by内田-->