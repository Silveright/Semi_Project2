<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../mainpage/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<title>주문내역</title>


<style>
textarea {
	width: 100%;
  top: 0; left: 0; right: 0; bottom: 0;
}

	table#DeliveryInfo{ /* 배송 정보 테이블  */
        width: 100%;
	}  
	table#DeliveryInfo tr {
        /* line-height: 30px; */
        border-top: solid 1px #d9d9d9;
        border-bottom: solid 1px #d9d9d9;
	}
	table#DeliveryInfo th {
		border-right: solid 1px #d9d9d9;
		width: 15%;
		padding-left: 8px;
	}
	table#DeliveryInfo td {
		padding-left: 8px;
		padding-top: 8px;
        padding-bottom: 8px;
	}
	.star { /* 필수 입력 사항 표시 */
		color: red;
        font-weight: bold;
        font-size: 15pt;
	}
	
	
	
</style>
</head>
<body>
<form action="주문완료 페이지 링크.go">
<!-- 결제 화면에서 받아가야 할 정보를 hidden으로 처리했습니다. -->
<input type="hidden" name="" value="${p.product_image}">
<input type="hidden" name="" value="${p.product_name}">
	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-sm-9 ">
				<br>
				<div>
					<b>주문 내역</b>
				</div>
				<hr
					style="height: 2px; opacity: 1; background-color: black; margin: 0 auto">
				<br>

							<table class="table">
								<tr class="table-active">
									<td>이미지</td>
									<td>상품명</td>
									<td>수량</td>
									<td>상품구매금액</td>
									<td>배송비</td>
									<td>합계</td>
								</tr>
								<tr class="align-middle">
									<td><img src="${pageContext.request.contextPath}/image/main/product/${p.product_image}.jpg" alt="${p.product_image}" width="77px"></td>
									<td>${p.product_name}</td>
									<td>${count }</td>
									<c:set var="total_product" value="${p.product_price }"/>
									<c:set var="total_product" value="${p.product_price }*${count }"/><!-- 이렇게 하면 수량에 가격 곱해져서 나올 줄 알았는데 안되네요 이것도 강사님께 여쭤보실래요? -->
									
									<td>${total_product }</td><!-- 수량에 따른 금액 계산 처리 필요 -->
									<td>2500</td><!-- 2500원으로 고정 or 복잡할 것 같으면 빼버리기 -->
									<c:set var="sum" value="2500"/><!-- 배송비 2500일때 합계구하는 법  -->
									<td>
									<fmt:formatNumber  value="${sum+p.product_price}" pattern="#,###" />
									<input type="hidden" name="totalprice" value="${sum }"><!-- 결제 시 결제화면에 담아갈 총금액 정보-->
									</td>

										
							</table>
							<br>
					
						<br>
				<div style="clear: both; margin-top: 40px; margin-bottom: 10px; ">
					<b>주문 정보</b>
					<div style="float: right;">
					<span class="star">*</span><span style="font-size: 15px;">필수입력사항</span>
					</div>
				</div>
				<hr
					style="height: 2px; opacity: 1; background-color: black; margin: 0 auto">
				<br>

		<form name="DeliveryInfo">
			<table id="DeliveryInfo">
				<tbody>
					<tr>
						<th>배송지 선택</th>
						<td>
							<input type="radio" id="destinationSame" name="destination" checked/><label for="destinationSame" style="margin-left: 1%; font-weight: 400;">회원 정보와 동일</label>
							<input type="radio" id="destinationNew" name="destination" style="margin-left: 2%;" /><label for="destinationNew" style="margin-left: 1%; font-weight: 400;">새로운 배송지</label>
						</td> 
	      			</tr>
	      			<tr>
	      				<th>받으시는 분&nbsp;<span class="star">*</span></th>
	      				<td>
	      					<input type="text" name="name" id="name" value="${memberinfo.name }" class="requiredInfo" required/> 
	      					<span class="error">받으시는 분을 입력하세요</span>
						</td> 
					</tr>
					<tr>
						<th>주소&nbsp;<span class="star">*</span></th>
						<td>
							<input type="text" id="post" name="post" value="${memberinfo.post }" size="6" maxlength="5" readonly class="requiredInfo" required/>&nbsp;&nbsp;
							<%-- 우편번호 찾기 --%>
							<input type="button" class="btn-sm btn-dark" id="postcode" name="postcode" value="우편번호" readOnly><br/>

							<input type="text" id="address" name="address" value="${memberinfo.address}" size="40" readonly class="requiredInfo" placeholder="주소" required style="margin-top: 4px;"/><br/>
	            			<input type="text" id="detailAddress" name="detailAddress" size="40" class="requiredInfo" placeholder="상세주소" required style="margin-top: 4px;"/><br/>
							<!-- 회원 테이블에 detail주소가 빠져서 쓸 수 없음 직접 입력하도록 해야함 -->
							
							<span class="error">주소를 입력하세요</span>
						</td> 
					</tr>
					<tr>
						<th>연락처&nbsp;<span class="star">*</span></th>
						<td>
				             <input type="text" id="hp1" name="hp1" size="6" maxlength="3" value="010" readonly class="requiredInfo"/>&nbsp;-&nbsp;
				             <input type="text" id="hp2" name="hp2" size="6" maxlength="4" value="${ fn:substring(memberinfo.tel, 0, 4) }" class="requiredInfo" required/>&nbsp;-&nbsp;
				             <input type="text" id="hp3" name="hp3" size="6" maxlength="4" value="${ fn:substring(memberinfo.tel, 4, 8) }" class="requiredInfo" required/>
				             <span class="error">휴대폰 형식이 아닙니다.</span>
						</td>
					</tr>
					<tr>
						<th>이메일&nbsp;<span class="star">*</span></th>
						<td>
							<input type="text" name="email" id="email" value="${memberinfo.email}" class="requiredInfo" required placeholder="abc@abc.com"/> 
							<span class="error">이메일 형식에 맞지 않습니다.</span>
							<br>이메일을 통해 주문처리과정을 보내드립니다.
							<br>이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요.
						</td>
					</tr>
					<tr>
						<th>배송메시지</th>
						<td>
							<textarea rows="2" cols="60" name="deliveryMsg"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<!-- 배송 정보 form 테이블 끝 -->
		
							<br>
				<div>
					<b>결제 예정금액</b>
				</div>
				<hr
					style="height: 2px; opacity: 1; background-color: black; margin: 0 auto">
				<br>
				<table class="table table-bordered ">
					<tr>
						<td class="text-center" style="width: 20%">총 주문금액</td>
						<td class="text-center" style="width: 20%">총 할인 + 부가결제 금액</td>
						<td class="text-center" style="width: 20%">총 결제예정 금액</td>
					</tr>
					<tr>
						<td class="text-center" style="width: 20%"></td>
						<td class="text-center" style="width: 20%"></td>
						<td class="text-center" style="width: 20%"></td>
					</tr>
				</table>
				
				<br>
				
				<div>
					<b>결제 수단</b>
					<br>
				</div>

					<div class="container-fluid border p-3 my-custom-container">


					<input type="radio" id="huey" name="drone" value="huey" checked> <label
						for="huey">무통장입금</label> 
					<input type="radio" id="dewey"
						name="drone" value="dewey"> <label for="dewey">카드결제</label>

					<table class="table table-bordered ">
					<tr>
						<td class="table-active text-center" style="width: 20%">입금자명</td>
						<td><input type="text" name='' value='${memberinfo.name}' ></td>
					</tr>
					<tr>
						<td class="table-active text-center">입금은행</td>
						<td><input type="text" name="post" value="XX은행 110-123-567890" class="my-1">
						</td>
					</tr>
				</table>
					<input type="radio" name="b" checked> <label
						for="huey" >현금영수증 신청</label> 
					<input type="radio" name="b"> <label for="dewey">신청 안 함</label>
					<a href="http://localhost:8088/" onclick="window.open('payment.jsp','width=900,height=600',resizable=1);">
					<button type="submit" class="btn btn-dark float-end">결제하기</button>
					</a>
					</div>
					<br>
	
	
	<!-- 무이자 할부 이용안내 시작 -->
		<div style="border: solid 1px #d9d9d9; margin-top: 40px; margin-bottom: 10px; ">
			<h5 style="font-weight: bold; padding: 4px; border-bottom: solid 1px #d9d9d9;">무이자 할부 이용안내</h5>
			<div>
				<ul style="list-style-type: circle; padding-left: 30px; font-size: 13px;">
					<li>무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에 대해 무이자할부가 적용되지 않습니다.</li>
					<li>무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기 바랍니다.</li>
				</ul>
			</div>
		</div>
		<!-- 무이자 할부 이용안내 끝 -->

		<!-- 이용안내 시작 -->
		<div style="border: solid 1px #d9d9d9; margin-top: 15px; margin-bottom: 50px;">
			<h5 style="font-weight: bold; padding: 4px; border-bottom: solid 1px #d9d9d9;">이용안내</h5>
			<div>
				<div style="padding-left: 4px; font-size: 13px;">WindowXP 서비스팩2를 설치하신후 결제가 정상적인 단계로 처리되지 않는경우, 아래의 절차에 따라 해결하시기 바랍니다.</div>
				<ul style="list-style-type: square; padding-left: 30px; margin-top: 4px; font-size: 13px;">
					<li>
						<a href="javascript:;" onclick="window.open('https://service-api.echosting.cafe24.com/shop/notice_XP_ActiveX.html','','width=795,height=500,scrollbars=yes',resizable=1);" style="color:blue;">안심클릭 결제모듈이 설치되지 않은 경우 ActiveX 수동설치</a>
					</li>
					<li>
						<a href="http://www.microsoft.com/korea/windowsxp/sp2/default.asp" target="_blank" style="color:blue;">Service Pack 2에 대한 Microsoft사의 상세안내 </a>
					</li>
				</ul>
			</div>

			<div>
				<div style="padding-left: 4px; margin-top: 8px; font-size: 13px;">아래의 쇼핑몰일 경우에는 모든 브라우저 사용이 가능합니다.</div>
				<ul style="list-style-type: square; padding-left: 30px; margin-top: 4px; font-size: 13px;">
					<li>KG이니시스, KCP, LG U+를 사용하는 쇼핑몰일 경우</li>
					<li>결제가능브라우저 : 크롬,파이어폭스,사파리,오페라 브라우저에서 결제 가능<br>(단, window os 사용자에 한하며 리눅스/mac os 사용자는 사용불가)</li>
					<li>최초 결제 시도시에는 플러그인을 추가 설치 후 반드시 브라우저 종료 후 재시작해야만 결제가 가능합니다.<br>(무통장, 휴대폰결제 포함)</li>
				</ul>
			</div>

			<div>
				<div style="padding-left: 4px; margin-top: 8px; font-size: 13px;">세금계산서 발행 안내</div>
				<ul style="list-style-type: square; padding-left: 30px; margin-top: 4px; font-size: 13px;">
					<li>부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음달 10일까지만 요청하실 수 있습니다.</li>
					<li>세금계산서는 사업자만 신청하실 수 있습니다.</li>
					<li>배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.</li>
					<li>[세금계산서 신청]버튼을 눌러 세금계산서 신청양식을 작성한 후 팩스로 사업자등록증사본을 보내셔야 세금계산서 발생이 가능합니다.</li>
					<li>[세금계산서 인쇄]버튼을 누르면 발행된 세금계산서를 인쇄하실 수 있습니다.</li>
				</ul>
			</div>

			<div>
				<div style="padding-left: 4px; margin-top: 8px; font-size: 13px;">부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경안내</div>
				<ul style="list-style-type: square; padding-left: 30px; margin-top: 4px; font-size: 13px;">
					<li>변경된 부가가치세법에 의거, 2004.7.1 이후 신용카드로 결제하신 주문에 대해서는 세금계산서 발행이 불가하며</li>
					<li>신용카드매출전표로 부가가치세 신고를 하셔야 합니다.(부가가치세법 시행령 57조)</li>
					<li>상기 부가가치세법 변경내용에 따라 신용카드 이외의 결제건에 대해서만 세금계산서 발행이 가능함을 양지하여 주시기 바랍니다.</li>
				</ul>
			</div>

		</div>
		<!-- 이용안내 끝 -->
				</div>
		</div>
	</div>

</form>
</body>
</html>