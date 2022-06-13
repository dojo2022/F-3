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
<frameset cols="200,*,200">

<frame src="example_a.html" name="frame1" title="左フレーム">
<frame src="example_b.html" name="frame2" title="中フレーム">
<frame src="example_c.html" name="frame3" title="右フレーム">

<noframes>
<body>
<p>フレームの代替内容</p>
</body>
</noframes>

</frameset>
<body>
<div class="mission_c">
				<button id="btn1">
				  <div>
				 データベースのミッション1が表示<img src="/nakao/img/.jpg" width="" height="">
				  </div>
				</button><br>

				 <button id="btn2">
				  <div>
				 データベースのミッション2が表示<img src="/nakao/img/.jpg" width="" height="">
				  </div>
				</button><br>

				  <button id="btn3">
				  <div>
				   データベースのミッション3が表示<img src="/nakao/img/.jpg" width="" height="">
				  </div>
				</button>

  <div>
 		<p>データベースのミッション1が表示</p>
        <input type="button" value="&#x2714;" onclick="check1()" id="btn1">
  </div>

  <div>
 		<p>データベースのミッション2が表示</p>
        <input type="button" value="&#x2714;" onclick="check2()" id="btn2">
  </div>

  <div>
 		<p>データベースのミッション3が表示</p>
        <input type="button" value="&#x2714;" onclick="check3()" id="btn3">
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

<div class="migi">

				  <button>
				  <div>
				  <a href="/nakao/ResultServlet">
				   退勤のボタン<img src="/nakao/img/.jpg" width="" height=""><br>
				   </a>
				  </div>
				</button>

				Tポイント:データベースからpoint<br>

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
 </div>
</body>
</html>