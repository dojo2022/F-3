<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main画面</title>
<!-- <link rel="stylesheet" type="text/css" href="/simpleBC/WebContent/css/loge.css"> -->
<link href="https://unpkg.com/nes.css@latest/css/nes.min.css" rel="stylesheet" />
<script src="/nakao/javascript/common.js"></script>
<script src="/nakao/javascript/main.js"></script>
</head>
<head>
<meta charset="UTF-8">
<title>卵購入</title>
<link rel="stylesheet" type="text/css" href="/nakao/css/common.css">
<link rel="stylesheet" type="text/css" href="/nakao/css/buy.css">
</head>
<body>
<div class = "yoko">
	<div class="cen">
    <img src="/nakao/img/dansu.gif" width="70%" height="" >
    </div>
    <div class = "koma">
	<!-- アニメーション -->
	<video id = "video" src="/nakao/img/notloop.mp4" width="900" height="" onended="finish()"></video>
    </div>
    <div class="ken">
    <img src="/nakao/img/dansu.gif" width="70%" height="" >
    </div>
</div>
<div class="sa">
		<div class="b">
		<a id = "gachabtn" onclick="change()" class="btn btn-solid-gold">　PUSH!　</a>
	</div>
	<div class = "backbtn">
		<form name="form" method="GET" action="/nakao/MainServlet">
	 	<input type="hidden" value="${cant_buy}" id = "cant_buy">
		<input type="button" value="戻る" id = "backbtn1" disabled>
		</form>
	</div>
</div>
<script src="/nakao/javascript/common.js"></script>
<script src="/nakao/javascript/buy.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>
let cb = document.getElementById("cant_buy");
console.log("cb = " + cb.value);

window.onload = function() {
	if(cb.value == "false")
	{
	    var options = {
	        text: '購入できるキャラがいません',
	        buttons: {
	            ok: '戻る'
	        }
	    };
	    swal(options).then(function(value){
	        document.form.submit();
	    });
	}
}
</script>
</body>
</html>









