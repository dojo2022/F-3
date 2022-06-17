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
<!-- 左の画面 -->
<div class="left">

	<div class="mission_c">
	        <div class="miss1">
	        	<br>
	        	<h1>  <img src="/nakao/img/0tk32.png"></h1>
	            <span id="mission1">${mission[0].getMission()}</span>
	            <br>
	            <input type="button" value="✓" onclick="check1()" id="clearbtn1">
	            <input type="hidden" value="${mission[0].getCleared()}" id="cleared1">
	        </div>
	        <br>
	        <br>
	        <br>
	        <div class="miss2">
	            <span id="mission2">${mission[1].getMission()}</span>
	            <br>
	            <input type="button" value="✓" onclick="check2()" id="clearbtn2">
	            <input type="hidden" value="${mission[1].getCleared()}" id="cleared2">
	        </div>
	        <br>
	        <br>
	        <br>
	        <div class="miss3">
	            <span id="mission3">${mission[2].getMission()}</span>
	            <br>
	            <input type="button" value="✓" onclick="check3()" id="clearbtn3">
	            <input type="hidden" value="${mission[2].getCleared()}" id="cleared3">
	        </div>

	</div>
</div>
<!-- 真ん中の画面 -->
<div class="center">
<div class="chara" >
  <div class="sute">
  <br>
		<img src="/nakao/img/Lv.png" width="10%" ><span id = "Level"></span>
		<img src="/nakao/img/Lv.png" width="10%" ><span id = "PassageArea">${growing.getEx_point()}</span>
		<img src="/nakao/img/No.png" width="10%" ><span> ${growing.getName()}</span>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
  </div>
  <div class="charaimg">
    <img src="/nakao/img/main_image/${growing.getFile_pass()}" width="" height="">
  </div>
</div>
	<div class="chb">
		<form method = "GET" action = "/nakao/CharaServlet">
		  <button>
		  <div>
		    <img src="/nakao/img/change.png">
		    <img src="/nakao/img/main_image/poyopoyokinoko.gif" width="14%" height="">
		  </div>
		  </button>
		 <input id="hide_ex1" type="hidden" name="EX" value="">
		</form>
	</div>
</div>

<!-- 右の画面 -->
<div class="right">
	<div class = "right2">
		<form method = "GET" name ="form1" action = "/nakao/ResultServlet" >
		<button id="endcount" type = button>
		<img src="/nakao/img/exit.png" width="50%" height="" ><img src="/nakao/img/pic.gif" width="25%"  height="">
		</button>
		<input id="hide_ex2" type="hidden" name="EX" value="">
		</form>
	</div>
	<br>
	<p>　　　　　　　　${Tpoint}</p>

	<div class="egg">

	  <!-- <div class="eggA">
	    <img src="/nakao/img/4n27x.png" width="30%" height="">
	  	<img src="/nakao/img/sen.png" width="" height="">
	  </div> -->

	  <div class="kanb">
      	<img src="/nakao/img/kanb.png" width="110px" height="">
      </div>

	  <div class = "eggB">
		<form method = "GET" name = "form2"action = "/nakao/BuyServlet">
		<button id="confirm-demo" type ="button"><img src="/nakao/img/68b7p.png" width="80%" height=""></button>
		<input id="hide_ex3" type="hidden" name="EX" value="">
		</form>
	  </div>

	</div>


</div>

</body>

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

    let cleared1 = document.getElementById("cleared1");
    let cleared2 = document.getElementById("cleared2");
    let cleared3 = document.getElementById("cleared3");

    let value1 = cleared1.getAttribute('value');
	let value2 = cleared2.getAttribute('value');
	let value3 = cleared3.getAttribute('value');

	console.log("value取得");

    if(value1 === "true")
    {
    	console.log("value1");

    	var ms = document.getElementById('mission1');
        var cbtn = document.getElementById('clearbtn1');
        ms.style.color = '#C0C0C0'; /* 文字の色を薄くする */
        ms.style.textDecoration = "line-through"; /* 取り消し線追加 */
        cbtn.value = "済";
        cbtn.disabled = 'true';
    }
    else
    {
    	console.log("value1失敗");
    }

    if(value2 === "true")
    {
    	console.log("value2");

    	var ms = document.getElementById('mission2');
        var cbtn = document.getElementById('clearbtn2');
        ms.style.color = '#C0C0C0'; /* 文字の色を薄くする */
        ms.style.textDecoration = "line-through"; /* 取り消し線追加 */
        cbtn.value = "済";
        cbtn.disabled = 'true';
    }
    else
    {
    	console.log("value2失敗");
    }

    if(value3 === "true")
    {
    	console.log("value3");

    	var ms = document.getElementById('mission3');
        var cbtn = document.getElementById('clearbtn3');
        ms.style.color = '#C0C0C0'; /* 文字の色を薄くする */
        ms.style.textDecoration = "line-through"; /* 取り消し線追加 */
        cbtn.value = "済";
        cbtn.disabled = 'true';
    }
    else
    {
    	console.log("value3失敗");
    }
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
<script>
let clearbtn1 = document.getElementById("clearbtn1");
let clearbtn2 = document.getElementById("clearbtn2");
let clearbtn3 = document.getElementById("clearbtn3");

const getData1 = () =>{
  let request = new XMLHttpRequest();
  request.onreadystatechange = function(e){
    if (request.readyState == 4){
      if (request.status == 200){
        console.log("成功1");
      }else{
        console.error(request.statusText);
      }
    }
  }
  request.open('GET', '/nakao/MissionClearServlet?btn=1', true);
  request.send();
}
clearbtn1.addEventListener('click', getData1, false)

const getData2 = () =>{
  let request = new XMLHttpRequest();
  request.onreadystatechange = function(e){
    if (request.readyState == 4){
      if (request.status == 200){
        console.log("成功2");
      }else{
        console.error(request.statusText);
      }
    }
  }
  request.open('GET', '/nakao/MissionClearServlet?btn=2', true);
  request.send();
}
clearbtn2.addEventListener('click', getData2, false)

const getData3 = () =>{
  let request = new XMLHttpRequest();
  request.onreadystatechange = function(e){
    if (request.readyState == 4){
      if (request.status == 200){
        console.log("成功3");
      }else{
        console.error(request.statusText);
      }
    }
  }
  request.open('GET', '/nakao/MissionClearServlet?btn=3', true);
  request.send();
}
clearbtn3.addEventListener('click', getData3, false)
</script>
<script src="/nakao/javascript/common.js"></script>
<script src="/nakao/javascript/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
</html>