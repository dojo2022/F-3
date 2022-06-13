<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/nakao/css/common.css">
<link rel="stylesheet" type="text/css" href="/nakao/css/main.css">
<script src="/nakao/javascript/common.js"></script>
<script src="/nakao/javascript/main.js"></script>
</head>
<body>

<div class="mission_c">
        <div class="miss1">
            <span id="mission1">ミッション1</span>
            <input type="button" value="✓" onclick="check1()" id="clearbtn1">
        </div>
        <div class="miss2">
            <span id="mission2">ミッション2</span>
            <input type="button" value="✓" onclick="check2()" id="clearbtn2">
        </div>
        <div class="miss3">
            <span id="mission3">ミッション3</span>
            <input type="button" value="✓" onclick="check3()" id="clearbtn3">
        </div>
</div>

<!-- 真ん中の画面 -->

<div class="chara" >

	<div class="sute">
Lv:<経験値から割り出す>Ex:<データベースからをEx_point>　<データベースからname>
	</div>

	<div class="charaimg">
    キャラクターのGIFを貼る。chara_idで区別
	</div>

</div>

  <button>
  <div>
  <a href="/nakao/CharaServlet">
   キャラクターの変更ボタン<img src="/nakao/img/.jpg" width="" height="">
   </a>
  </div>
</button>

<!-- 右の画面 -->

  <button>
  <div>
  <a href="/nakao/ResultServlet">
   退勤のボタン<img src="/nakao/img/.jpg" width="" height="">
   </a>
  </div>
</button>

Tポイント:<データベースからpoint>

<div class="egg">

	<div class="eggA">
		<img src="/nakao/img/.jpg" width="" height="">
	</div>

 	<button>
  		<div class="eggB">
  			<a href="/nakao/BuyServlet">
   				購入のボタン<img src="/nakao/img/.jpg" width="" height="">
   			</a>
  		</div>
	</button>

</div>


</body>
</html>