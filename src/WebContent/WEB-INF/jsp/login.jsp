<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>なかおっち</title>
<link rel="stylesheet" type="text/css" href="/nakao/css/common.css">
<link rel="stylesheet" type="text/css" href="/nakao/css/login.css">
<script src="/nakao/javascript/common.js"></script>
<script src="/nakao/javascript/login.js"></script>
</head>
<body>
 <form method="POST" action="/simpleBC/LoginServlet">
<!--   <div class="fuchidori">なかおっち</div> -->
<h1 id="logo">
  <img src="/nakao/img/poyopoyokinoko.gif" width="1367" height="130" alt="なかおっち">
  </h1>
  <input type="text" name="ID" placeholder="Username"/>
  <input type="password" name="PW" placeholder="Password"/>
  <button>
  <div>
  出勤する
  </div>
</button>
</form>
</body>
</html>