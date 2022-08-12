<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<link href="${pageContext.request.contextPath}/css/login.css" type="text/css" rel="stylesheet">	
	<script src="http://code.jquery.com/jquery-latest.js"></script>	
	<jsp:include page="header.jsp" />
<style>
	.card {width: 500px;}
	.card button {width:100%; height: 50px}
</style>	
</head>
<body>
  <body>
	<div class="card">
      <div class="card-body">
		<h1 class="card-title text-center ">로그인</h1>
		<h6 class="card-subtitle text-center mb-5" style="color: darkgray">WELCOME BACK</h6>
		<form id="loginform" method="post">
		  <div class="form-floating mb-1">
		    <input type="text" class="form-control" id="id" name="id" placeholder="아이디">
		    <label for="floatingInput">id</label>
		  </div>
		  <div class="form-floating mb-1">
		    <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
		    <label for="floatingPassword">Password</label>
		  </div>              
		  <button class="btn btn-dark mb-2" type="submit" id="loginprocess">로그인</button>              
		 <div class="form-check mb-3">
		  <input class="form-check-input" type="checkbox"  id="remember" name="remember" value="store">
		  <label class="form-check-label" for="remember">
		    아이디 저장
		  </label>
		 </div>
		 <hr class="my-3">
		 <ul>
		 	<li><a href="idFind.net">아이디 찾기	&#124;	</a></li>
		 	<li><a href="passFind.net">비밀번호 찾기	&#124;	</a></li>
		 	<li><a href="join.net">회원가입</a></li>                 
		 </ul>
		 <hr class="my-3">
		 
		 <button class="btn btn-dark mb-2" type="submit" id="naver" ><img src="${pageContext.request.contextPath}/image/main/naver.png">네이버로 로그인</button>
		 <button class="btn btn-dark mb-2" type="submit" id="kakao" ><img src="${pageContext.request.contextPath}/image/main/kakao.png">카카오톡으로 로그인</button>
       </form>
     </div>
   </div>
  <jsp:include page="footer.jsp" />
</body>
<script>
	$('#loginprocess').on('click',
		function(){
			$('#loginform').attr("action","loginProcess.net");
	});
	
	var id = '${id}';  
	if (id) {
		$("#id").val(id);
		$("#remember").prop('checked', true);
	}
	
</script>
</html>

