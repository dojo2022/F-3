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
<body>

	<p>退勤しました。<br>
	本日も一日お疲れ様でした。</p>

	<!-- 日付と時間を取得 -->
	<div class="charaimage">
		<img src="/nakao/img/result_image/${resultChara.getFile_pass()}" width="" height="">
	</div>

	<!-- 画面を閉じる -->
	<form method="POST" action="/nakao/ResultServlet">
		<button>OK</button>
	</form>
</body>
</html>
<!--resultCharaに情報を格納しています by内田-->