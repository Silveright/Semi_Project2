<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../mainpage/header.jsp"/>
<html>
<head>
<script src="js/jquery-3.6.0.js"></script>
<style>
.md{float:left;}
</style>

<title>회원 정보 관리</title>

<script>
var gender = '${customer.gender}';
$("input[value = " + gender + "]").prop("checked", true); //성별체크

//체크되지 않는 성별을 비 활성 시켜 임의로 선택할 수 없도록 합니다.
$("input:radio").not(":checked").prop("disabled", true);
</script> 
</head>
<body>
<form method='post' 
			  action='memberinfo.com'>
	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-sm-9 ">
				<b>회원정보 관리</b>
				<hr
					style="height: 2px; opacity: 1; border-width: 0; background-color: black; margin: 0 auto">
				<br>
				<table class="table table-bordered ">
					<tr>
						<td class="table-active text-center" style="width: 20%">아이디</td>
						<td><input type="text" name='' value= "${customerinfo.id}"></td>
					</tr>
					
					<tr>
						<td class="table-active text-center" style="width: 20%">이름</td>
						<td><input type="text" name='' value="${customerinfo.name}" ></td>
					</tr>
					<tr>
						<td class="table-active text-center">휴대전화</td>
						<td><input type="text" name="address1" class="me1" value="${customerinfo.phone.substring(0,3)}">
						-<input type="text" name="address1" class="me1" value="${customerinfo.phone.substring(3,7)}">
						-<input type="text" name="address1" class="me1" value="${customerinfo.phone.substring(7,11)}"></td>
					</tr>
					<tr>
						<td class="table-active text-center">주소</td>
						<td><input type="text" name="post" value="${customerinfo.post }" class="my-1">
						<button type="button" class="btn-sm btn-dark">우편번호</button><br>
							<input type="text" name="post" value="${customerinfo.address }"></td>
					</tr>
					<tr>
						<td class="table-active text-center">이메일</td>
						<td><input type="text" name="email" value="${customerinfo.email.split('@')[0]}" >
						@ <input type="text" name="email" class="me-1" value="${customerinfo.email.split('@')[1]}" ></td>
					</tr>
					
					<tr>
					<td class="table-active text-center">성별</td>
					<td>
				   	<input type="radio" name="gender" value="m" id="gender1" > 남자
				   	<input type="radio" name="gender" value="f" id="gender2" > 여자
					</td>
					
					</tr>
					<tr>
						<td class="table-active text-center" >등급</td>
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
					</tr>
				</table>
				<br>
				<div style="text-align: center">
					<a href="memberdelete.com?id=${customerinfo.id}"><button type="submit" class="btn btn-dark md">계정제거</button></a>
					<button type="submit" class="btn btn-dark">수정하기</button>
					<button type="reset" class="btn btn-light" onclick="history.back()"
						data-mdb-ripple-color="dark" style="width: 90px">취소</button>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>