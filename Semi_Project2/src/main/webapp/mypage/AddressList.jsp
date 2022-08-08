<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>배송주소록 관리</title>
<jsp:include page="../mainpage/header.jsp"/>
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
							<c:if test="${empty id }">
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
							</c:if>
							<c:if test="${empty list}">
							<h1>등록된 배송지가 없습니다.</h1>
							<a href="addresslistadd.pg?id=${id}">
							<button class="btn btn-secondary float-end">등록하기</button>
							</a>
							</c:if>
							
					</div>
			</div>

	</div>

</body>
</html>