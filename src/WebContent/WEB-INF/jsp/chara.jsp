<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>キャラ変更画面</title>
<link rel="stylesheet" type="text/css" href="/nakao/css/common.css">
<link rel="stylesheet" type="text/css" href="/nakao/css/chara.css">
<script src="/nakao/javascript/common.js"></script>
<script src="/nakao/javascript/chara.js"></script>
</head>
<body>
<!-- 選択中のキャラ -->

 	<button>
 	<div class = "backbtn">
  	<a href="/nakao/MainServlet">
   	戻るボタン<img src="/nakao/img/.jpg" width="" height="">
   	</a>
 	</div>
 	</button>

	<div class = "charabox">
	 	<div class = "sutechange">
		 	Lv:<経験値から割り出す> ${growing.getName()}
		</div>
		<div class="imgchange">
		   <img src="/nakao/img/main_image/${growing.getFile_pass()}" width="" height="">
		</div>
	</div>

	<div class = "change">
		<button >変更</button>
	</div>


	<h1>キャラ一覧</h1>
	<div class = "subbox">
	<c:forEach var = "e" items = "${charaList}">
	<div class = "items">
		<div class = "sutechange">
		 	<p>Lv:<経験値から割り出す> <c:out value = "${e.name}"/></p>
		</div>
		<div class="imgchange">
		   <img src="/nakao/img/main_image/${e.file_pass}" width="" height="">
		</div>
	</div>
	</c:forEach>
	</div>


</body>
</html>