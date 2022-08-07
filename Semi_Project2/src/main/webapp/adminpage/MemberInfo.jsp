<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>
<html>
<head>

<title>회원 정보 관리</title>
</head>
<body>
 
	
		<div class="container" style="margin-top: 70px">
			<h2>회원 정보 관리</h2>
			<br>
			<form action="#" class="form-horizontal" name="update" method="post">
				<input type="hidden" name="Id" value="">
				<div class="form-group row">
					<label class="contral-label col-sm-2">이름</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="Name" value="d">
					</div>
				</div>
				<div class="form-group row">
					<label class="control-lable col-sm-2">전화번호</label>
					<div class="col-sm-1">
						<input class="form-control" name="fnum" type="text" maxlength="3"value="010">
					</div>
					
					<div class="col-sm-1">
						<input class="form-control" name="snum" maxlength="4" type="text" value="0000">
					</div>
					
					<div class="col-sm-1">
						<input class="form-control" name="lnum" maxlength="4"type="text" value="0000">
					</div>
				</div>
				<div class="form-group row">
			<label class="control-lable col-sm-2">주소</label>
			<div class="col-sm-4">
				<input type="text" id="post_code" name="post_code" class="form-control"value="d"placeholder="우편번호">
				<input type="text" id="address1" name="address1" class="form-control" value="d"placeholder="주소">
				<input type="text" id="address2" name="address2" class="form-control" value="d" placeholder="상세주소">
			</div>
			<div class="col-sm-3 col-sm-offset-3">
				<input type="button" onclick="showPostcode()"class="form-control" value="우편번호 검색"><br>
			</div>
			</div>
			<div class="form-group row">
			<label class="control-lable col-sm-2">이메일</label>
			<div class="col-sm-3">
				<input type="text" name="email1" class="form-control"maxlength="18" value="d">
				<select name="email2" class="form-control" id="email2">
					<option value="gmail.com">gmail.com</option>
					<option value="naver.com">naver.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="daum.net">daum.net</option>
					<option value="nate.com">nate.com</option>
				</select>
				
			</div>
			</div>
			<div class="form-group row">
				<label class="control-lable col-sm-2">성별</label>
				<div class="col-sm-3">
					<input type="radio"name="gender" value='남'>남
					<input type="radio"name="gender" value='여'>여
				</div>
			
			</div>
			<div class="form-group row">
				<label class="control-lable col-sm-2">등급</label>
				<div class="col-sm-3">
					<select id="viewcount" name="member_grade">
						<option value="0" selected>등급</option>
						<option value="1">S</option>
						<option value="2">A</option>
						<option value="3">B</option>
						<option value="4">C</option>
					</select>
				</div>
			
			</div>
			<div class="form-group row">
				<label class="control-lable col-sm-2">상품 등록 상태</label>
				<div class="col-sm-3">
				   <input type="text" name="classNum" class="form-control" value="d">
				</div>
				 <p>
				<div class="col-sm-3">
				   <input type="text" name="classNum" class="form-control" value="d">
				</div>
				 <p>
				<div class="col-sm-3">
				   <input type="text" name="classNum" class="form-control" value="d">
				</div>
				 <p>
			</div>
				<br>
			<input class="btn btn-secondary" type="submit" value="계정제거">
			<input class="btn btn-secondary" type="submit" value="수정완료">
			</form>
		</div>
</body>
</html>