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
<form method = "GET" name ="form1" action = "/nakao/ResultServlet" >
<button id="endcount" type = button>退勤</button>
<input id="hide_ex2" type="hidden" name="EX" value="">

</form>
<p>Tポイント: ${Tpoint}</p>
<div class="egg">
  <div class="eggA">
    卵の画像<img src="/nakao/img/.jpg" width="" height="">
  </div>
<form method = "GET" name = "form2"action = "/nakao/BuyServlet">
<button id="confirm-demo" type ="button">購入</button>
<input id="hide_ex3" type="hidden" name="EX" value="">
</form>
</div>
</div>

</body>
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

function check1(){
    var ms = document.getElementById('mission1');
    var cbtn = document.getElementById('clearbtn1');
    ms.style.color = '#C0C0C0'; /* 文字の色を薄くする */
    ms.style.textDecoration = "line-through"; /* 取り消し線追加 */
    cbtn.value = "済";
    cbtn.disabled = 'true';

    pa.textContent = parseInt(pa.textContent)+ 100;

}
function check2(){
    var ms = document.getElementById('mission2');
    var cbtn = document.getElementById('clearbtn2');
    ms.style.color = '#C0C0C0';
    ms.style.textDecoration = "line-through";
    cbtn.value = "済";
    cbtn.disabled = 'true';

    pa.textContent = parseInt(pa.textContent)+ 100;
}
function check3(){
    var ms = document.getElementById('mission3');
    var cbtn = document.getElementById('clearbtn3');
    ms.style.color = '#C0C0C0';
    ms.style.textDecoration = "line-through";
    cbtn.value = "済";
    cbtn.disabled = 'true';

    pa.textContent = parseInt(pa.textContent)+ 100;
}

document.getElementById("confirm-demo").onclick = function(){
    var options = {
        text: '卵を購入しますか？',
        buttons: {
            cancel: 'キャンセル',
            ok: '購入する'
        }
    };
    swal(options).then(function(value){
            if(value){
                document.form2.submit();
            }
        });
    };

document.getElementById("endcount").onclick = function(){
    var options = {
        text: '退勤しますか？',
        buttons: {
            cancel: 'キャンセル',
            ok: '退勤する'
        }
    };

   swal(options).then(function(value){
     if(value){
         document.form1.submit();
      }
    });

};



</script>
<script src="/nakao/javascript/common.js"></script>
<script src="/nakao/javascript/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
</html>