<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>キャラ変更画面</title>
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
		 	Lv:<経験値から割り出す> <データベースからname>
		</div>
		<div class="imgchange">
		    キャラクターのGIFを貼る。chara_idで区別
		</div>
	</div>

	<div class = "change">
		<button >変更</button>
	</div>

	<h1>キャラ一覧</h1>
	<div class = "subbox">
	</div>

</body>
</html>