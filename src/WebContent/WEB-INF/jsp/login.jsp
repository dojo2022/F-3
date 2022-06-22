<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>なかおっち</title>
<link rel="stylesheet" type="text/css" href="/nakao/css/login.css">
<link href="https://unpkg.com/nes.css@latest/css/nes.min.css" rel="stylesheet" />
<script src="/nakao/javascript/common.js"></script>
<script src="/nakao/javascript/login.js"></script>
</head>
<body>
 <form method="POST" action="/nakao/LoginServlet">
<!--   <div class="fuchidori">なかおっち</div> -->
<h1>
  <img src="/nakao/img/76b5587b707b4cb3e0585f64747e33ad (1).png" width="600" height="130" alt="なかおっち">
  </h1>

	<div class="namepass">

	<div class="nes-container is-rounded is-dark">
 <input type="text" name="user_name" placeholder="Username"/><br>
</div>

	<div class="nes-container is-rounded is-dark">
<input type="password" name="user_pass" placeholder="Password"/><br>
</div>

	</div>
<div class="btn">
  <button data-hover="click me!"><div>Go to work!</div></button>
  </div>
  <input type="hidden" id="cant_login" value="${flag}" />
</form>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>
let flag = document.getElementById("cant_login");
if(flag.value == "false")
{
	var options = {
	        text: 'UsernameかPasswordが違います',
	        buttons: {
	            ok: 'OK'
	        }
	};
	swal(options).then(function(value){
	        console.log("UsernameかPasswordが違います")
	});
}
</script>
</html>