<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
 	<div class = "backbtn">
	<form method = POST action = "/nakao/CharaServlet">
 	<button>
   	戻るボタン<img src="/nakao/img/.jpg" width="" height="">
 	</button>
 	</form>
 	</div>

	<div class = "charabox">
	 	<div class = "sutechange">
		 	Lv:<経験値から割り出す> ${growing.getName()}
		</div>
		<div class="imgchange">
		   <img src="/nakao/img/main_image/${growing.getFile_pass()}" width="" height="">
		</div>
	</div>

	<div class = "change">
	<form method = POST action = "/nakao/CharaServlet">
	<button >変更</button>
	<input id="hide_charId" type="hidden" name="charId" value="">
	</form>
	</div>


	<h1>キャラ一覧</h1>
	<div class = "subbox">
	<c:forEach var = "e" items = "${charaList}">
	<div class = "items">
		<div class = "sutechange">
		 	Lv:<span id = "Level"></span>
		 	Name:<span><c:out value = "${e.name}"/></span>
		 	<span id = "PassageArea" hidden><c:out value = "${e.ex_point}"/></span>
		</div>
		<div class="imgchange">
		   <img src="/nakao/img/main_image/${e.file_pass}" width="" height="">
		</div>
	</div>
	</c:forEach>
	</div>

<script>
let pa = document.getElementById("PassageArea");
let lv = document.getElementById('Level');
let exp = parseInt(pa.textContent);
let levelCount = 0;

while(exp > 0)
{
	if(exp < 0)
	{
		break;
	}
	else
	{
		exp = exp - (100 + (5 * levelCount));
    	levelCount = levelCount + 1;
	}
}
lv.textContent = levelCount;
console.log(levelCount);
</script>
</body>
</html>