<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<jsp:include page="header.jsp" />
<script src = "http://code.jquery.com/jquery-latest.js"></script>

<style>
	.card {width: 700px; margin:0 auto !important; border-top:none !important;}
	li span {width:300px; float:right; display: inline-block; text-align:left;}
	.card ul {width: 500px; margin: 0 auto;}
	.card ul li:nth-child(2) input {float:right}
	.card-title {font-weight:bold}
	.card div:last-child button{width: 100%; height: 58px}
</style>
</head>
<body>
	<div class="card">
		<div class="card-body">
			<h2 class="card-title text-center m-5" >본인확인 인증</h2>
		</div>
		<form id="self" action="resetpass.net">
		<ul class="list-group list-group-flush">	
			<c:if test = "${param.certi == 'e'}">					
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
			</c:if>
			<c:if test = "${param.certi == 'p'}">		
				<li class="list-group-item">본인확인 인증
					<span>
						<label><input type="radio" name="certi" value="e" checked>휴대폰</label>&nbsp
					</span>
				</li>				
				<li class="list-group-item">이메일 
					<span>01099863158<input type="button" value="인증번호 받기"></span>
				</li>						
				<li class="list-group-item">인증번호 
					<span><input type="text" size=36></span>
				</li>			
				<li class="list-group-item"><span>1회 발송된 인증번호의 유효 시간은 60분이며, 1회 인증번호 발송 후 30초 이후에 재전송이 가능합니다.</span></li>					
			</c:if>		
		</ul>	
		</form>			
		<div class="row g-2 m-5">
			<div class="col-6">
				<button form = "self" class="btn btn-Secondary" >확인</button>
			</div>
			<div class="col-6">
				<button class="btn btn-Dark" onclick="location.href='${pageContext.request.contextPath}/index.jsp'">취소</button>
			</div>
		</div>
	</div>
		<jsp:include page="footer.jsp" />
</body>


</html>

