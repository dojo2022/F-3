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
</div>

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
		Lv:<span id = "Level"></span>
		Ex:<span id = "PassageArea">${growing.getEx_point()}</span>
		Name:<span> ${growing.getName()}</span>
  </div>
  <div class="charaimg">
    <img src="/nakao/img/main_image/${growing.getFile_pass()}" width="" height="">
  </div>
</div>
<form method = "GET" action = "/nakao/CharaServlet">
  <button>
  <div>
    変更<img src="/nakao/img/.jpg" width="" height="">
  </div>
  </button>
 <input id="hide_ex1" type="hidden" name="EX" value="">
</form>
</div>
<!-- 右の画面 -->
<div class="right">
<form method = "GET" action = "/nakao/ResultServlet">
  <button>
  <div>
   退勤<img src="/nakao/img/.jpg" width="" height="">
  </div>
</button>
<input id="hide_ex2" type="hidden" name="EX" value="">
</form>
<p>Tポイント: ${Tpoint}</p>
<div class="egg">
  <div class="eggA">
    卵の画像<img src="/nakao/img/.jpg" width="" height="">
  </div>
<form method = "GET" action = "/nakao/BuyServlet">
  <button>
    <div class="eggB">
        購入のボタン<img src="/nakao/img/.jpg" width="" height="">
    </div>
  </button>
<input id="hide_ex3" type="hidden" name="EX" value="">
</form>
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
<script>

let pa = document.getElementById("PassageArea");
let ex1 = document.getElementById('hide_ex1');
let ex2 = document.getElementById('hide_ex2');
let ex3 = document.getElementById('hide_ex3');
let lv = document.getElementById('Level');


function showPassage(pa) {
    pa.textContent = parseInt(pa.textContent)+ 1;
    ex1.value = pa.textContent;
    ex2.value = pa.textContent;
    ex3.value = pa.textContent;

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
}

window.onload = function() {
    PassageID = setInterval('showPassage(pa)',1000);
}

</script>
<script src="/nakao/javascript/common.js"></script>
<script src="/nakao/javascript/main.js"></script>
</body>
</html>