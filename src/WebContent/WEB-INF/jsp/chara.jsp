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
</head>
<body>
<!-- 選択中のキャラ -->
 	<div class = "backbtn">
	<form method = "POST" action = "/nakao/CharaServlet">
	<button name="SUBMIT" value="0">戻る</button>
 	</form>
 	</div>

	<div class = "charabox">
	 	<div class = "sutechange">
	 		Lv:<span id = "mainLevel"></span>
		 	Name:<span>${growing.getName()}</span>
		 	<span id = "mainPassageArea">${growing.getEx_point()}</span>
		</div>
		<div class="imgchange">
		   <img id="mainchara" src="/nakao/img/main_image/${growing.getFile_pass()}" width="" height="">
		</div>
	</div>

	<h1>キャラ一覧</h1>
	<div class = "subbox">
	<c:forEach var = "e" items = "${charaList}">
	<form name = "charafrom" method = "GET" action="/nakao/ChangeCharaServlet">
		<div class = "sutechange">
		 	Lv:<span class = "Level"></span>
		 	Name:<span><c:out value = "${e.name}"/></span>
		 	<span class = "PassageArea"><c:out value = "${e.ex_point}"/></span>
		</div>
		<img class="charaImage" src="/nakao/img/main_image/${e.file_pass}"> <!-- onclick="clickimg()" -->
		<button>変更</button>
		<input name="char_id" type="hidden" value="${e.char_id}">
	</form>
	</c:forEach>
	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
let charpa = document.getElementsByClassName("PassageArea");
let charlv = document.getElementsByClassName('Level');
let length = charpa.length;

for(let i = 0; i < length; i++) {
	let exp = parseInt(charpa[i].textContent);
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
	charlv[i].textContent = levelCount;
}

let pa = document.getElementById("mainPassageArea");
let lv = document.getElementById('mainLevel');
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
<script src="/nakao/javascript/common.js"></script>
<script src="/nakao/javascript/chara.js"></script>
</body>
</html>