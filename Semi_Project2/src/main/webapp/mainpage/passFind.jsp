<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<script src = "http://code.jquery.com/jquery-latest.js"></script>
<link href="${pageContext.request.contextPath}/css/join.css" type="text/css" rel="stylesheet">

<html>
<head>
<jsp:include page="header.jsp" />
<style>
	li span {width:200px; float:right; display: inline-block; text-align:center;}
	.card ul {width: 400px; margin: 0 auto;}
</style>
</head>
<body>
	<div class="passFind card" style="width: 700px;">
		<div class="card-body">
			<h2 class="card-title text-center mb-4" style="font-weight:bold">비밀번호 찾기</h2>
		</div>
		<form id="passfind" action="selfCerti.net">
			<ul class="list-group list-group-flush">
				<li class="list-group-item">인증수단
					<span>
						<label><input type="radio" name="certi" value="e" checked>이메일</label>&nbsp 
						<label><input type="radio" name="certi" value="p">휴대폰 번호</label>
					</span>
				</li>
			</ul>
			<ul id="page"></ul>
		</form>
		<button form='passfind' class='btn btn-Dark mt-5 mb-5' style='width: 80%; height: 58px; margin:0 auto'>확인</button>
	</div>
		<jsp:include page="footer.jsp" />
</body>
<script>
	$("#page").load("${pageContext.request.contextPath}/mainpage/emailcerti.jsp");

	$("input").change(function(){
		var value = $("input[type=radio]:checked").val();
		console.log(value);
		if(value == "p") {
			$("#page").load("${pageContext.request.contextPath}/mainpage/phonecerti.jsp");
		} else {
			$("#page").load("${pageContext.request.contextPath}/mainpage/emailcerti.jsp");				
		}
	})
	
	$("#page").attr("class", "list-group list-group-flush")
	

		
</script>

</html>

