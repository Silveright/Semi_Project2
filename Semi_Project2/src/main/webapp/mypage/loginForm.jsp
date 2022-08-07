<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>회원관리 시스템 로그인 페이지</title>
<link href="css/login.css" rel="stylesheet" type="text/css">
<script src="js/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function(){
		//클래스 조인을 클릭하게되면 join.net으로 이동된다.
			$(".join").click(function(){
				location.href="join.net";
			});
			var id= '${id}';/* el의 $를 의미함 리퀘스트나 세션 영역의 아이디 값을 가져와 출력 
							MemberLoginAction 클래스의 setAttribute("id",id)를 통해 담아짐*/
			if(id){
				$("#id").val(id);
				$("#remember").prop('checked', true);
			}
	})
</script>
<body>
	<form name ="loginform" action="loginProcess.net" method="post">
	<h1>로그인</h1>
	<hr>
	<b>아이디</b>
	<input type="text" name="id" placeholder="Enter id" id="id" required>
	
	<b>Password</b>
	<input type="password" name="pass" placeholder="Enter password" required>
	<input type="checkbox" id="remember" name="remember" value="store">
	<span>remember</span>
	
	<div class="clearfix">
		<button type="submit" class="submitbtn">로그인</button>
		<button type="button" class="join">회원가입</button>
	</div>
</form>
</body>
</html>