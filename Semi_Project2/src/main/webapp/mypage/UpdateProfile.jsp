<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
<jsp:include page="../mainpage/header.jsp"/>
<title>회원정보 수정</title>
 <style>
  footer{position:fixed; 
			bottom:0px; 
			height:3rem;
			background:#ccc;
			width:100%; 
			text-align:center;
			line-height:3rem;}
table td {
  position: relative;
}

table td input {
  position: absolute;
  display: block;
  top:0;
  left:0;
  margin: 0;
  height: 100%;
  width: 100%;
  border: none;
  padding: 10px;
  box-sizing: border-box;
}
  </style>
</head>
<body>
<form method='post' 
			  action='updateprofileProcess.pg'>
	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-sm-9 ">
				<b>회원정보 수정</b>
				<hr
					style="height: 2px; opacity: 1; border-width: 0; background-color: black; margin: 0 auto">
				<br>
				<table class="table table-bordered ">
					<tr>
						<td class="table-active text-center" style="width: 20%">아이디</td>
						<td><input type="text" name='id' value="${id }" readOnly class="form-control"></td>
					</tr>
					<tr>
						<td class="table-active text-center">비밀번호</td>
						<td><input type="text" id="pass" name='pass' value="${memberinfo.password }" class="form-control"></td>
					</tr>
					<tr>
						<td class="table-active text-center">비밀번호 확인</td>
						<td><input type="text" class="form-control" id="check_pass"></td>
					</tr>
					<tr>
						<td class="table-active text-center">이름</td>
						<td><input type="text" name="name" value="${memberinfo.name }" class="form-control" ></td>
					</tr>
					<tr>
						<td class="table-active text-center">우편번호</td>
						<td><input type="text" name="post" value="${memberinfo.post }" class="form-control"></td>
					</tr>
					<tr>
						<td class="table-active text-center">주소</td>
						<td><input type="text" class="form-control" name="address1" value="${memberinfo.address }" ></td>
					</tr>
					<tr>
						<td class="table-active text-center">상세주소</td>
						<td><input type="text" class="form-control" name="address2" value="${memberinfo.address2 }" ></td>
					</tr>
					<tr>
						<td class="table-active text-center">휴대전화</td>
						<td><input type="text" name="phone" value="${memberinfo.tel_cell }" class="form-control" ></td>
					</tr>
					<tr>
						<td class="table-active text-center">이메일</td>
						<td><input type="text" name="email" value="${memberinfo.email }" class="form-control" ></td>
					</tr>
				</table>
				<br>
				<div style="text-align: center">
					<button type="submit" class="btn btn-dark">수정하기</button>
					<button type="reset" class="btn btn-light"
						data-mdb-ripple-color="dark" style="width: 90px">취소</button>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>