
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

<div id="main">
  <div class="left"> <!-- 選択中のキャラ(左の画面) -->
    <div class = "backbtnbox">
	    <form method = "POST" action = "/nakao/CharaServlet">
		    <button id="backbtn" name="SUBMIT" value="0"><img src="/nakao/img/sa.png" ></button>
	    </form>
    </div>
    <h1>選択キャラ</h1>
    <div class = "maincharabox">
	    <div class = "maincharainf">
			Lv:<span id = "mainLevel"></span>
			<span>${growing.getName()}</span>
			Ex:<span id = "mainPassageArea">${growing.getEx_point()}</span>
		</div>
	    <div class="maincharaimg">
	        <img id="mainchara" src="/nakao/img/main_image/${growing.getEggimg()}.gif" width="" height="">
	    </div>
    </div>
  </div>
  <div class="right"><!--右の画面-->
	<div class="listcharabox">
    <c:forEach var = "e" items = "${charaList}">
	    <div class="formcharabox">
			<form name = "charafrom" method = "GET" action="/nakao/ChangeCharaServlet">

				<div class = "listcharainf">
				 	Lv:<span class = "Level"></span>
				 	<span><c:out value = "${e.name}"/></span>
				 	Ex:<span class = "PassageArea"><c:out value = "${e.ex_point}"/></span>
				</div>
		      	<div class="listcharaimg">
					<c:set var="ex_point">${e.ex_point}</c:set>
					<c:set var="lv">
					<%
						String str = (String)pageContext.getAttribute("ex_point");
						int exp = Integer.parseInt(str);

						int levelCount = 0;
						while(exp > 0)
						{
							exp = exp - (100 + (5 * levelCount));
						    levelCount = levelCount + 1;
						}
						System.out.println("level = " + levelCount);
						out.print(levelCount);
					%>
					</c:set>
					<c:if test="${lv >= 0 && lv <= 1}"><img class="charaimage" src="/nakao/img/chara_image/${e.eggimg}.png"></c:if>
					<c:if test="${lv > 1 && lv <= 2}"><img class="charaimage" src="/nakao/img/chara_image/${e.charaimg1}.png"></c:if>
					<c:if test="${lv > 2 && lv <= 3}"><img class="charaimage" src="/nakao/img/chara_image/${e.charaimg2}.png"></c:if>
					<c:if test="${lv > 3 && lv <= 4}"><img class="charaimage" src="/nakao/img/chara_image/${e.charaimg3}.png"></c:if>
					<c:if test="${lv > 4}"><img class="charaimage" src="/nakao/img/chara_image/${e.charaimg4}.png"></c:if>
				</div>

				<div class="changeBtn">
					<button>変更</button>
					<input name="char_id" type="hidden" value="${e.char_id}">
				</div>
			</form>
		</div>
	</c:forEach>
	</div>
  </div>
</div>



	<div class = "subbox">

	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
let charpa = document.getElementsByClassName("PassageArea");
let charlv = document.getElementsByClassName('Level');
let charimg = document.getElementsByClassName('charaimage');
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
let img = document.getElementById("mainchara");
if(levelCount > 1) {
	img.src = '/nakao/img/main_image/' + '${growing.getCharaimg1()}' + '.gif';
}
if(levelCount > 2) {
	img.src = '/nakao/img/main_image/' + '${growing.getCharaimg2()}' + '.gif';
}
if(levelCount > 3) {
	img.src = '/nakao/img/main_image/' + '${growing.getCharaimg3()}' + '.gif';
}
if(levelCount > 4) {
	img.src = '/nakao/img/main_image/' + '${growing.getCharaimg4()}' + '.gif';
}
console.log("level = " + levelCount);
</script>
<script src="/nakao/javascript/common.js"></script>
<script src="/nakao/javascript/chara.js"></script>
</body>
</html>