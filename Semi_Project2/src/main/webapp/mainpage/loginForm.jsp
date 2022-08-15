<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

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
		 	<li><a href="idFind.net">아이디 찾기</a></li>&#124;
		 	<li><a href="passFind.net">비밀번호 찾기</a></li>&#124;
		 	<li><a href="join.net">회원가입</a></li>                 
		 </ul>
		 <hr class="my-3">
		 
		 <button class="btn btn-dark mb-2" type="submit" id="naver" onclick="showLoginPopup();"><img src="${pageContext.request.contextPath}/image/main/naver.png">네이버로 로그인</button>
		 
		 
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
	
    // 네이버 로그인을 위한 팝업창 생성
    function showLoginPopup(){
        let uri = 'https://nid.naver.com/oauth2.0/authorize?' +
            'response_type=code' +                  // 인증과정에 대한 내부 구분값 code 로 전공 (고정값)
            '&client_id=7GIne8NXVpOnxoKv9ecI' +     // 발급받은 client_id 를 입력
            '&state=NAVER_LOGIN_TEST' +             // CORS 를 방지하기 위한 특정 토큰값(임의값 사용)
            '&redirect_uri=http://localhost:8080/NaverLoginCallback';   // 어플케이션에서 등록했던 CallBack URL를 입력

        // 사용자가 사용하기 편하게끔 팝업창으로 띄어준다.
        window.open(uri, "Naver Login Test PopupScreen", "width=450, height=600");
    }
	
</script>




<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <title>네이버 로그인</title>
  <link rel="stylesheet" href="./style.css" />
</head>
<body>
  <div class="container">
    <h1>Naver Login API 사용하기</h1>
    <div class="login-area">
      <div id="message">
        로그인 버튼을 눌러 로그인 해주세요.
      </div>
      <div id="button_area">
        <div id="naverIdLogin"></div>
      </div>
    </div>
  </div>
  
  
  
  <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
  <script type="text/javascript">
  
  const naverLogin = new naver.LoginWithNaverId(
   {
    clientId: "NfuiqEV4HltgQ4mfdiO6",
    callbackUrl: "http://127.0.0.1:5500",
    loginButton: {color: "green", type: 2, height: 40}
    }
   );
  

    naverLogin.init();
    naverLogin.getLoginStatus(function (status) {
      if (status) {
          const nickName=naverLogin.user.getNickName();
          const age=naverLogin.user.getAge();
          const birthday=naverLogin.user.getBirthday();

          if(nickName===null||nickName===undefined ){
            alert("별명이 필요합니다. 정보제공을 동의해주세요.");
            naverLogin.reprompt();
            return ;  
         }else{
          setLoginStatus();
         }
	}
    });
    console.log(naverLogin);

    function setLoginStatus(){
    
      const message_area=document.getElementById('message');
      message_area.innerHTML=`
      <h3> Login 성공 </h3>
      <div>user Nickname : ${naverLogin.user.nickname}</div>
      <div>user Age(범위) : ${naverLogin.user.age}</div>
      <div>user Birthday : ${naverLogin.user.birthday}</div>
      `;
     
      const button_area=document.getElementById('button_area');
      button_area.innerHTML="<button id='btn_logout'>로그아웃</button>";

      const logout=document.getElementById('btn_logout');
      logout.addEventListener('click',(e)=>{
        naverLogin.logout();
	location.replace("http://127.0.0.1:5500");
      })
    }
   

  </script>
</html>



