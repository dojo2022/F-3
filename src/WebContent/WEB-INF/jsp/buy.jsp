
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購入画面</title>

</head>
<head>
<meta charset="UTF-8">
<title>卵購入</title>
<link rel="stylesheet" type="text/css" href="/nakao/css/common.css">
<link rel="stylesheet" type="text/css" href="/nakao/css/buy.css">
</head>
<body>
<form method="GET" action="/nakao/MainServlet" name="form">
	<button type="submit"id="backbtn"><img src="/nakao/img/sa.png"id="backbtnimg" ></button>
</form>
<div class = "yoko">
	<div class="cen">
    <img src="/nakao/img/dansu.gif" width="70%" height="" >
    </div>
    <div class = "koma">
	<!-- アニメーション -->
	<video  id = "video" src="/nakao/img/notloop.mp4" width="800" height="" onended="finish()"></video>
    </div>
    <div class="ken">
    <img src="/nakao/img/dansu.gif" width="70%" height="" >
    </div>
</div>
<div class="sa">
	<div class="b">
		<img src="/nakao/img/r9.gif" width="10%" height="" >
		<img src="/nakao/img/r9.gif" width="10%" height="" >
		<img id = "btn1" src="/nakao/img/eggg.gif" width="100" height="100">
		<img src="/nakao/img/r9.gif" width="10%" height="" >
		<img src="/nakao/img/r9.gif" width="10%" height="" >
	</div>
</div>

<input type="hidden" value="${cant_buy}" id = "cant_buy">
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
};

</script>


	<script>
		let egg = document.getElementById("btn1");
		let v = document.getElementById('video');

		function eggPush(){
		  v.play();
		  let dbtn = document.getElementById("gchabtn")
		  dbtn.disabled = true;
		}
		egg.addEventListener("click",eggPush,false);

		function finish(){
			let back = document.getElementById("backbtn1")
		  back.disabled = false;
		}

	</script>
</body>
</html>









