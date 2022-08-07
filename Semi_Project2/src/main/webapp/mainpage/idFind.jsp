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
	<div class="card" style="width: 700px; margin : 0 auto">
		<div class="card-body">
			<h2 class="card-title text-center mb-4" style="font-weight:bold">아이디 찾기</h2>
		</div>
		<ul class="list-group list-group-flush">
			<li class="list-group-item">인증수단
				<span>
					<label><input type="radio" name="certi" value="e" checked>이메일</label>&nbsp
					<label><input type="radio" name="certi" value="p">휴대폰 번호</label>
				</span>
			</li>	
		</ul>	
		<form id="page"></form>	
		<button form="page" class='btn btn-Dark mt-5 mb-5' style='width: 80%; height: 58px; margin:0 auto'>확인</button>		
	</div>
		<jsp:include page="footer.jsp" />
</body>
<script>
	$("#page").load("${pageContext.request.contextPath}/mainpage/emailcerti.jsp", function(){
		$("#idshow").hide();
	});	
	
	$("input").change(function(){
		var value = $("input[type=radio]:checked").val();
		console.log(value);
		if(value == "p") {
			$("#page").load("${pageContext.request.contextPath}/mainpage/phonecerti.jsp", function(){
				$("#idshow").hide();
			});
		} else {
			$("#page").load("${pageContext.request.contextPath}/mainpage/emailcerti.jsp", function(){
				$("#idshow").hide();
			});	
		}
	});
	
	$("#page").attr("action", "idFindSuccess.net")
</script>

</html>

