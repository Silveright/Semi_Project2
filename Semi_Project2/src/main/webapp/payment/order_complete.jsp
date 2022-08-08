<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>주문 완료</title>
	<jsp:include page="/mainpage/header.jsp"/>
	  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  footer{position:fixed; 
			bottom:0px; 
			height:3rem;
			background:#ccc;
			width:100%; 
			text-align:center;
			line-height:3rem;}
@media (min-width: 768px) {
    .my-custom-container{
        width:85%;
    }
}

  </style>
<%-- 필요한 클래스를 import 하려면 <%@ page %>  page directive(페이지 지시어)를 사용하여 import 를 한다. --%>    
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>


<% 
	//현재날짜와 시간을 알아오는 메소드 생성하기
	Date now = new Date(); // 현재시각
	
	SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String today = sdformat.format(now);
%>
<body>

<br>

	<div class = "container px-0">

		<div class="border border-muted mx-auto" style="display:table; width:200px; height:20px; text-align: center;">
			<h3 class="h3" style="display:table-cell; text-align: center">주문 완료</h3> <!-- 세로방향으로 가운데정렬 -->
		</div>
		<br>


<div class="container">
	<div class="jumbotron">
	<!-- 점보트론은 특별한 내용이나 정보에 대한 추가 주의를 환기시키기 위한 큰 회색 상자를 나타내는 것입니다. -->
		<h2 class="display-4"><img src="../img/check.png" width="100" height="100"/>&nbsp;<i class="fas fa-shopping-basket"></i>고객님의 주문이 완료 되었습니다.</h2><br>
		<p class="lead">주문번호 : ${requestScope.order_code}<br>주문일자 : <%= today%></p>
		<hr class="my-4">
		<p>고객님의 주문이 완료 되었습니다.</p>
		 주문내역 및 배송에 관한 안내는 <a href="../mypage/OrderList.jsp" style="color: blue;">주문정보</a> 를 통하여 확인 가능합니다.
	</div>	
</div>

<br>
<div style="margin-top: 40px; margin-bottom: 10px; font-weight: bold; font-size: 16px;">결제 정보</div>
		<table class="table table-bordered" style="text-align: center; margin-bottom: 0px;">
			<thead>
				<tr style="font-weight: bolder; font-size: 13pt;">
					<th>총 주문 금액</th>
					<td style="width: 85%">원</td>
				</tr>	
			</thead>
			<tbody>	
				<tr style="font-weight: bolder; font-size: 13pt;">
					<th>결제 수단</th>
					<td style="width: 85%">신한 카드</td>
				</tr>
			</tbody>
		</table>
<br>

<div style="margin-top: 40px; margin-bottom: 10px; font-weight: bold; font-size: 16px;">주문 상품 정보</div>
<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr style="text-align: center;"> <!-- 글자 가운데정렬 -->
							<th>이미지</th>
							<th>상품정보</th>
							<th>판매가</th>
							<th>수량</th>
							<th>적립금</th>
							<th>배송구분</th>
							<th>배송비</th>
							<th>합계</th>
						</tr>
					</thead>
					<tbody>

						<c:set var="totalPrice" value="0" />

							<tr>
								<td class="verticalM" align="center"><img alt="${제품이미지}" src="../img/${제품이미지}" width="90" height="100"></td>
								<td class="verticalM">
									<strong>${제품이미지}</strong>
									<input type="hidden" name="product_code" value="${상품코드}" /> <!-- 주문완료페이지에 보낼 제품번호 -->
									<ul style="margin-top: 15px;">
										<li>[옵션: ${옵션}]</li>
									</ul>
									<input type="hidden" name="opt_code" value="${옵션번호}" /> <!-- 주문완료페이지에 보낼 옵션번호 -->
								</td>
								<td class="verticalM" align="center"><strong>원</strong></td>
								<td class="verticalM" align="center">
									<span>${주문수량}</span>
									<input type="hidden" name="order_count" value="${주문수량}" /> <!-- 주문완료페이지에 보낼 주문수량 -->
								</td>
								<td class="verticalM" align="center">
									<span>원</span>
								</td>
								<td class="verticalM" align="center"><span>기본배송</span></td>
								<td class="verticalM" align="center">
									<div>[고정]</div>
								</td>
								<td class="verticalM" align="center">
									<strong>원</strong>
									<input type="hidden" name="order_cost" value="${주문금액 + 주문수량}" /> <!-- 주문완료페이지에 보낼 주문가격(한개당가격*수량) -->
								</td>
							</tr>


						<tr style="border-bottom: 1px solid #d9d9d9;">
							<td></td>
							<td colspan="8">
								<div style="float: left;">[기본배송]</div>
								<div style="float: right;">
									<c:choose>
										<c:when test="${totalPrice >= 100000}">
											<c:set var="deliveryFee" value="0" />
										</c:when>
										<c:otherwise>
											<c:set var="deliveryFee" value="2500" />
										</c:otherwise>
									</c:choose>
									상품구매금액  + 배송비  = 합계 : 원
								</div>
							</td>
						</tr>

					</tbody>
				</table>
			</div>
	</div>

<div class="mt-5 p-4 bg-light text-center">
  <p>Footer</p>
</div>
 </body>
</html> 