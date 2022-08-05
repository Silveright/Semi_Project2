<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>주문내역</title>
<jsp:include page="header.jsp"/>
<Style>
img{width:20px}
</Style>
</head>
<body>
	<br>
	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-sm-9 ">
				<div>
					<b>배송 주소록</b>
				</div>
				<hr
					style="height: 2px; opacity: 1; background-color: black; margin: 0 auto">
				<br>


				<!-- 내용 -->
							<br>

							<table class="table">
								<tr class="table-active">
									<td>배송지명</td>
									<td>수령인</td>
									<td>휴대전화</td>
									<td>주소</td>
									<td class="text-center">수정/삭제</td>
									
								</tr>
								<tr class="align-middle">
									<td>수량</td>
									<td>상품구매금액</td>
									<td>주문상태</td>
									<td>주소</td>
									<td class="text-center"><button class="btn btn-primary  me-2">수정</button>
									<button class="btn btn-danger">삭제</button></td>
							</table>
					</div>
														</div>

							</div>
</body>
</html>