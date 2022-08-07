<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<script src = "http://code.jquery.com/jquery-latest.js"></script>
<link href="${pageContext.request.contextPath}/css/join.css" type="text/css" rel="stylesheet">

<html>
<head>
<jsp:include page="header.jsp" />
<style>
	li span {width:300px; float:right; display: inline-block; text-align:left;}
	.card ul {width: 500px; margin: 0 auto;}
	.join {width:100%; text-align:center; display:inline-clock;}
</style>
</head>
<body>
	<div class="card" style="width: 700px;">
		<div class="card-body">
			<h4 class="card-title text-center mb-4" style="font-weight:bold">비밀번호 재설정</h4>
		</div>
		<ul class="list-group list-group-flush">
			<li class="list-group-item">아이디<span>id</span></li>		
			
			<li class="list-group-item">새 비밀번호 
				<span><input type="password" size=36></span>
			</li>		
			
			<li class="list-group-item"><span>(영문 대소문자/숫자/특수문자 중 3가지 이상 조합, 8자~16자)</span></li>
			
			<li class="list-group-item">새 비밀번호 확인
				<span><input type="password" size=36></span>
			</li>			
			
					
		</ul>		
		<div class="row g-2 m-5">
			<div class="col-6">
				<button class="btn btn-Secondary" style="width: 100%; height: 58px">비밀번호 변경</button>
			</div>
			<div class="col-6">
				<button class="btn btn-Dark" style="width: 100%; height: 58px">취소</button>
			</div>
		</div>
	</div>
		<jsp:include page="footer.jsp" />
</body>
<script>
	$("#page").load("emailcerti.jsp");	
	$("input").change(function(){
		var value = $("input[type=radio]:checked").val();
		console.log(value);
		if(value == "p") {
			$("#page").load("phonecerti.jsp");
			
		} else {
			$("#page").load("emailcerti.jsp");	
		}
	})
</script>

</html>

