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
<ul="mission_katati">
<li>
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
</div>
</li>
				<!-- 真ん中の画面 -->
<li>
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
</li>
				<!-- 右の画面 -->
				<li>
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
</li>
</ul>
</body>
</html>