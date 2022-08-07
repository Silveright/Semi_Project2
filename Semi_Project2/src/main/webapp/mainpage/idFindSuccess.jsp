<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<script src = "http://code.jquery.com/jquery-latest.js"></script>
<link href="${pageContext.request.contextPath}/css/join.css" type="text/css" rel="stylesheet">

<html>
<head>
<jsp:include page="header.jsp" />
<style>
	li span {width:120px; float:right; display: inline-block; text-align:center;}
	.card ul {width: 350px; margin: 0 auto;}
</style>
</head>
<body>
	<div class="card" style="width: 700px;">
		<div class="card-body ">
			<h3 class="card-title text-center mb-4" style="font-weight:bold">아이디 찾기</h3>
			<h3 class="card-subtitle text-center mb-3" style="color: #178FEB; font-weight:bold">고객님 아이디 찾기가 완료 되었습니다.</h3>
		</div>
		<ul class="list-group list-group-flush mb-4" >
			<li class="list-group-item">아이디<span>id(앞 3자리만)</span></li>
			<li class="list-group-item">이름<span>name</span></li>
			<li class="list-group-item">이메일<span>email</span></li>
			<li class="list-group-item">가입날짜<span>registerdate</span></li>
		</ul>
		<div class="m-4" style="text-align:center">
			<h6>고객님의 아이디 찾기가 성공적으로 이루어졌습니다.</h6>
			<h6>항상 고객님의 즐겁고 편리한 쇼핑을 위해 최선의 노력을 다하는 쇼핑몰이 되겠습니다.</h6>
		</div>					
		<div class="row g-2 m-4">
			<div class="col-6">
				<button class="btn btn-Secondary" style="width: 100%; height: 58px" onclick="location.href='login.net'">로그인</button>
			</div>
			<div class="col-6">
				<button class="btn btn-Dark" style="width: 100%; height: 58px" onclick="location.href='passFind.net'">비밀번호 찾기</button>
			</div>
		</div>
	</div>
		<jsp:include page="footer.jsp" />
</body>
</html>
