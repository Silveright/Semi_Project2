<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>
<html>
<head>

<style>
.md{float:left;}
</style>

<title>회원 정보 관리</title>
 <style>
 
  </style>
</head>
<body>
<form method='post' 
			  action='#'>
	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-sm-9 ">
				<b>회원정보 수정</b>
				<hr
					style="height: 2px; opacity: 1; border-width: 0; background-color: black; margin: 0 auto">
				<br>
				<table class="table table-bordered ">
					<tr>
						<td class="table-active text-center" style="width: 20%">이름</td>
						<td><input type="text" name='' value= ></td>
					</tr>
					<tr>
						<td class="table-active text-center">휴대전화</td>
						<td><input type="text" name="address1" class="me1">
						-<input type="text" name="address1" class="me1">
						-<input type="text" name="address1" class="me1"></td>
					</tr>
					<tr>
						<td class="table-active text-center">주소</td>
						<td><input type="text" name="post" value="${memberinfo.post }" class="my-1">
						<button type="button" class="btn-sm btn-dark">우편번호</button><br>
							<input type="text" name="post" value="${memberinfo.post }"></td>
					</tr>
					<tr>
						<td class="table-active text-center">이메일</td>
						<td><input type="text" name="address1" value="${memberinfo.address }" >
						@ <input type="text" name="address1" class="me-1" value="${memberinfo.address }" ></td>
					</tr>
					<tr>
						<td class="table-active text-center">성별</td>
						<td></td>
					</tr>
					<tr>
						<td class="table-active text-center">등급</td>
						<td>
						<select id="viewcount" name="member_grade">
						<option value="0" selected>등급</option>
						<option value="1">S</option>
						<option value="2">A</option>
						<option value="3">B</option>
						<option value="4">C</option>
					</select>
					</td>
					<tr>
						<td class="table-active text-center">상품 등록상태</td>
						<td><input type="text" name="email">
							<input type="text" name="email"></td>
					</tr>
				</table>
				<br>
				<div style="text-align: center">
					<button type="submit" class="btn btn-dark md">계정제거</button>
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