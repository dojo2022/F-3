<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main画面</title>
<link rel="stylesheet" type="text/css" href="/nakao/css/common.css">
<link rel="stylesheet" type="text/css" href="/nakao/css/main.css">
<script src="/nakao/javascript/common.js"></script>
<script src="/nakao/javascript/main.js"></script>
</head>

<body id="main">
<div class="left">


<div class="mission_c">
        <div class="miss1">
            <span id="mission1">${mission[0].getMission()}</span>
            <input type="button" value="✓" onclick="check1()" id="clearbtn1">
        </div>
        <div class="miss2">
            <span id="mission2">${mission[1].getMission()}</span>
            <input type="button" value="✓" onclick="check2()" id="clearbtn2">
        </div>
        <div class="miss3">
            <span id="mission3">${mission[2].getMission()}</span>
            <input type="button" value="✓" onclick="check3()" id="clearbtn3">
        </div>

</div>
<!-- 真ん中の画面 -->
<div class="center">
<div class="chara" >
  <div class="sute">
		<p>Lv:<!-- 経験値から割り出す--> Ex: ${growing.getEx_point()} ${growing.getName()}</p>
  </div>
  <div class="charaimg">
    <img src="/nakao/img/main_image/${growing.getFile_pass()}" width="" height="">

  </div>
</div>
  <button>
  <div>
    <a href="/nakao/CharaServlet">
    変更<!-- キャラクターの変更ボタン--><img src="/nakao/img/.jpg" width="" height="">
    </a>
  </div>
</div>
<!-- 右の画面 -->
<div class="right">
  <button>
  <div>
  <a href="/nakao/ResultServlet">
   退勤<img src="/nakao/img/.jpg" width="" height="">
  </a>
  </div>
</button>
<p>Tポイント: ${Tpoint}</p>
<div class="egg">
  <div class="eggA">
    卵の画像<img src="/nakao/img/.jpg" width="" height="">
  </div>
  <button>
    <div class="eggB">
      <a href="/nakao/BuyServlet">
        購入のボタン<img src="/nakao/img/.jpg" width="" height="">
      </a>
    </div>
  </button>
</div>
</div>
<style>
#main {
  display: flex;
  margin: 0px;
  width: 100%;
}
.left {
  margin: 20px;
  width: 20%;
}
.center {
  align-items: center;
  text-align: center;
  margin: 20px;
  width: 60%;
}
.right {
  margin: 20px;
  width: 20%;
}
</style>
</body>
</html>