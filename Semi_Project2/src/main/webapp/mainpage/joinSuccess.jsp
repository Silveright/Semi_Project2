<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<link href="${pageContext.request.contextPath}/css/join.css" type="text/css" rel="stylesheet">

<html>
<head>
<jsp:include page="header.jsp" />
<style>
	.card {width: 700px;}
	li span {width:80px; float:right; display: inline-block; text-align:center;}
	.card ul {width: 300px; margin: 0 auto;}
	.card button {width: 100%; height: 58px}
	.card {margin: 0 auto;}
</style>
</head>
<body>
	<div class="card">
		<div class="card-body">
			<h1 class="card-title text-center mt-5">회원가입이 완료되었습니다</h1>
			<h5 class="card-subtitle text-center mb-5" style="color: darkgray">THANK YOU!</h5>
		</div>
		<ul class="list-group list-group-flush">
			<li class="list-group-item">아이디<span>id</span></li>
			<li class="list-group-item">이름<span>name</span></li>
			<li class="list-group-item">이메일<span>email</span></li>
			<li class="list-group-item">휴대폰 번호<span>phone</span></li>
		</ul>
		<div class="row g-2 m-5">
			<div class="col-6">
				<button class="btn btn-Secondary" onclick="location.href='login.net'">로그인</button>
			</div>
			<div class="col-6">
				<button class="btn btn-Dark" onclick="location.href='${pageContext.request.contextPath}/index.jsp'">메인페이지</button>
			</div>
		</div>
	</div>
		<jsp:include page="footer.jsp" />
</body>
</html>

