<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<script src = "http://code.jquery.com/jquery-latest.js"></script>
<link href="${pageContext.request.contextPath}/css/join.css" type="text/css" rel="stylesheet">

<html>
<head>
<jsp:include page="header.jsp" />
<style>
	li span {width:300px; float:right; display: inline-block; text-align:left;}
	.card ul {width: 500px; margin: 0 auto;}
	.card ul li:nth-child(2) input {float:right}
</style>
</head>
<body>
	<div class="card" style="width: 700px;">
		<div class="card-body">
			<h4 class="card-title text-center mb-4" style="font-weight:bold">본인확인 인증</h4>
		</div>
		<ul class="list-group list-group-flush">
			<li class="list-group-item">본인확인 인증
				<span>
					<label><input type="radio" name="certi" value="e" checked>이메일</label>&nbsp
				</span>
			</li>	
			
			<li class="list-group-item">이메일 
				<span>j34@2gmail.com<input type="button" value="인증번호 받기"></span>
			</li>			
			
			<li class="list-group-item">인증번호 
				<span><input type="text" size=36></span>
			</li>			
			
			<li class="list-group-item"><span>1회 발송된 인증번호의 유효 시간은 60분이며, 1회 인증번호 발송 후 30초 이후에 재전송이 가능합니다.</span></li>
					
		</ul>		
		<div class="row g-2 m-5">
			<div class="col-6">
				<button class="btn btn-Secondary" style="width: 100%; height: 58px">확인</button>
			</div>
			<div class="col-6">
				<button class="btn btn-Dark" style="width: 100%; height: 58px">취소</button>
			</div>
		</div>
	</div>
		<jsp:include page="footer.jsp" />
</body>


</html>

