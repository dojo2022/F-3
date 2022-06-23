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
	    <img src="/nakao/img/main_image/${resultChara.getEggimg()}.gif" width="" height="">
	</div>

	<div class="cen">
	    <img src="/nakao/img/main_image/${resultChara.getCharaimg1()}.gif" width="" height="">
	</div>


		<img id = "iwa" src="/nakao/img/zn6.png" width="650" height="200">
	  <div class="blackboard-box">
	  	<br>
	  	<div class="text">
	    <p>退勤しました。</p>
	    <br>
	    <p>本日も一日お疲れ様でした。</p>
	    </div>
		<br>
	    <!--<div class="chalk1"></div>-->
	    <!--<div class="chalk2"></div>-->
	  </div>


	<!-- 画面を閉じる -->
	<form method="POST" action="/nakao/ResultServlet">
		<button class="ok"><img src="/nakao/img/okbtn.png" width="140px" height="40px" ></button>
	</form>
</body>
</html>
<!--resultCharaに情報を格納しています by内田-->