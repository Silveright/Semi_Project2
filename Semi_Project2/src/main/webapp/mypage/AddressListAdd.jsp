<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>주문내역</title>
<jsp:include page="../mainpage/header.jsp"/>
<Style>
img{width:20px}
</Style>
</head>
<body>
	<form method='post' 
			  action='addresslistaddprocess.pg?id=${id }'>
	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-sm-9 ">
				<br>
				<b>배송지 등록</b>
				<hr
					style="height: 2px; opacity: 1; border-width: 0; background-color: black; margin: 0 auto">
				<br>
				<table class="table table-bordered ">
					<tr>
						<td class="table-active text-center" style="width: 20%">배송지명</td>
						<td><input type="text" name='address_name' class="form-control"></td>
					</tr>
					<tr>
						<td class="table-active text-center">수령인</td>
						<td><input type="text" name='address_receiver' class="form-control"></td>
					</tr>
					<tr>
						<td class="table-active text-center">휴대전화</td>
						<td><input type="text" name='address_phone' class="form-control" id="check_pass"></td>
					</tr>
					<tr>
						<td class="table-active text-center">우편번호</td>
						<td><input type="text" name="address_post" class="form-control" ></td>
					</tr>
					<tr>
						<td class="table-active text-center">주소</td>
						<td><input type="text" name="address" class="form-control" ></td>
					</tr>
				</table>
				<br>
				<div style="text-align: center">
					<button type="submit" class="btn btn-dark">등록</button>
					<button type="reset" class="btn btn-light"
						data-mdb-ripple-color="dark" style="width: 90px">취소</button>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>