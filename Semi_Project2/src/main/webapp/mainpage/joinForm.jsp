<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<html>
<head>
<jsp:include page="header.jsp" />
<style>
.card { width: 700px; margin:0 auto !important; border-top:none !important;}
.card-subtitle {color: darkgray}
</style>
</head>
<body>
	<div class="card">
		<div class="card-body">
			<h1 class="card-title text-center mt-5">회원가입</h1>
			<h5 class="card-subtitle text-center mb-5">SIGN	UP</h5>
			<form action = "agreeProcess.net" >
				<div class="form-floating mb-1">
					<input type="text" class="form-control" id="id" placeholder="아이디">
					<label for="id">아이디</label>
				</div>

				<div class="form-floating mb-1">
					<input type="password" class="form-control" id="pass"
						placeholder="비밀번호"> <label for="password">비밀번호</label>
				</div>

				<div class="form-floating mb-1">
					<input type="password" class="form-control" id="pass_check"
						placeholder="비밀번호 확인"> <label for="pass_check">비밀번호
						확인</label>
				</div>

				<div class="form-floating mb-1">
					<input type="text" class="form-control" id="name" placeholder="이름">
					<label for="name">이름</label>
				</div>

				<div class="row g-2 mb-1">
					<div class="col-md">
						<div class="form-floating">
							<input type="text" class="form-control" id="jumin1"
								placeholder="주민등록번호 앞자리"> <label for="jumin1">주민등록번호
								앞자리</label>
						</div>
					</div>
					<div class="col-md">
						<div class="form-floating">
							<input type="text" class="form-control" id="jumin2"
								placeholder="주민등록번호 뒷자리"> <label for="jumin2">주민등록번호
								뒷자리</label>
						</div>
					</div>
				</div>

				<div class="form-floating mb-1">
					<select class="form-select" id="gender">
						<option value="m">남자</option>
						<option value="f">여자</option>
					</select> <label for="gender">성별</label>
				</div>

				<div class="row g-2 mb-1">
					<div class="col-8">
						<div class="form-floating">
							<input type="text" class="form-control" id="post"
								placeholder="우편번호"> <label for="post">우편번호</label>
						</div>
					</div>
					<div class="col-4">
						<button type="button" class="btn btn-dark"
							style="width: 218px; height: 58px">우편번호 검색</button>
					</div>
				</div>

				<div class="form-floating mb-1">
					<input type="text" class="form-control" id="address"
						placeholder="주소"> <label for="address">주소</label>
				</div>
				<div class="form-floating mb-1">
					<input type="text" class="form-control" id="adress_detail"
						placeholder="상세주소"> <label for="adress_detail">상세주소</label>
				</div>

				<div class="row g-2 mb-1">
					<div class="col-3">
						<div class="form-floating">
							<input type="text" class="form-control" value="010" readonly
								style="text-align: center; padding: 0 0 0 5px; font-size: 14pt">
						</div>
					</div>
					<div class="col-9">
						<div class="form-floating">
							<input type="text" class="form-control" id="phone"
								placeholder="휴대폰 번호"> <label for="phone">휴대폰 번호</label>
						</div>
					</div>
				</div>

				<div class="row g-2 mb-1">
					<div class="col-4">
						<div class="form-floating">
							<input type="text" class="form-control" id="email"
								placeholder="이메일 주소"> <label for="email">이메일 주소</label>
						</div>
					</div>
					<span style="width: 15px; padding: 25px 0 0 0">@</span>
					<div class="col-4">
						<div class="form-floating">
							<input type="text" class="form-control" id="domain"
								placeholder="도메인"> <label for="domain">도메인</label>
						</div>
					</div>
					<div class="col-4 mb-1" style="width: 31%">
						<div class="form-floating">
							<select class="form-select" id="email">
								<option value=""></option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="nate.com">nate.com</option>
								<option value="yahoo.com">yahoo.com</option>
							</select> <label for="email">직접입력</label>
						</div>
					</div>
				</div>

				<div class="mb-2">
					<button type="button" class="btn btn-Secondary"
						style="width: 100%; height: 50px">이메일로 인증코드 전송</button>
				</div>

				<div class="row g-2 mb-3">
					<div class="col-8">
						<div class="form-floating">
							<input type="text" class="form-control" id="certification"
								placeholder="이메일로 전송된 인증코드를 입력하세요"> <label
								for="certification">인증코드 입력</label>
						</div>
					</div>
					<div class="col-4">
						<div class="form-floating">
							<button type="button" class="btn btn-dark"
								style="width: 218px; height: 58px">인증코드 확인</button>
						</div>
					</div>
				</div>

				<hr class="my-4">	
				
				<div class="row g-2 m-3">
					<div class="col-6">
						<button class="btn btn-success signupbtn" type="submit"
							style="width: 100%; height: 58px">회원가입</button>
					</div>
					<div class="col-6">
						<button class="btn btn-danger cancelbtn" type="reset"
							style="width: 100%; height: 58px">취소</button>
					</div>
				</div>
				
			</form>
		</div>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>

