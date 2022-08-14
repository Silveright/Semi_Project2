<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../mainpage/header.jsp"/>
<!DOCTYPE html>
<html>
<head>	 
<title>관심 상품</title>
<style>
.table-image{width:50px;}
.table-active>td{width:150px;}
.table-active>td:nth-child(4){width:180px;}	 
div#myTabContent{width:950px; height:auto;}
td{text-align:center;}
.mt-3 {
    margin-top: 0.1rem!important;
}

#opt-change{
    color: #fff;
    background-color: #000036;
    border-color: #000036;
    width:90px;
    height:30px;
    margin:5px;
    padding:4px 0;
    border:none;
    }
.btn{
    border:none;
    width:120px;
    background-color: #000036;
    border-color: #000036;
    margin:3px;
}
#subject{
    vertical-align: top;
}
#select>td{
    vertical-align: top;
    color:red;
}
p{text-align:left}
.btn:nth-child(3){background-color:#dcdcdc;color:black;}
.btn-secondary{background-color:#dcdcdc;color:black}
.select-btn{text-align:right;}
.btn-orderAll{background-color:#black;color:white;width:150px;}
.btn-deleteAll{background-color:white;color:black;border:1px solid;width:150px}
</style>
</head>
<body>

	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-sm-9 ">
				<br>
				<div>
					<b>내 관심 상품</b>
				</div>
				<hr
					style="height: 2px; opacity: 1; background-color: black; margin: 0 auto">
				<br>

				<ul class="nav nav-tabs" id="wishTab" role="=wishlist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active">관심 상품 정보</button>
					</li>
					
				</ul>
                <c:if test="${!empty wishlist }">
				<div class="wish-content" id="mywishContent">
					<div class="tab-pane fade show active" id="userinfo"
						role="tabpanel" aria-labelledby="userinfo-tab">
						<div class="container custom">
							<br>
			
							<br>

							<table class="table">
								<tr class="table-active">
									<td class="table-image"><input type='checkbox' name='Allchoice' value='Allchoice' /></td>
									<td>이미지</td>
									<td>상품명</td>
									<td>상품구매금액</td>
									<td>합계</td>
									<td align="center">선택</td>
								</tr>
								<c:forEach var="w" items="${wishlist }" varStatus="vs2">
								<tr class="align-middle">
									<td><input type='checkbox' name='choice' value='choice' /></td>
									<td><img src="${pageContext.request.contextPath}/image/main/product/${w.product_image }.jpg" alt="${w.product_image}" width="77px"></td>
									<td>${w.product_name }<br>
									<button type="button" id="opt-change" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#optionModal">옵션변경</button>
									</td>
									<td>${product.product_price }</td>
									<td>${product.product_price }</td>
									<td align="center">
									
							<!-- Button trigger modal -->
                              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#orderModal${vs2.index }">
                              주문하기
                              </button>
                              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#moveModal${vs2.index }">
                              장바구니로
                              </button>
                              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#removeModal${vs2.index }">
                              삭제
                              </button>

                              <!-- orderModal -->
                              <div class="modal fade" id="orderModal${vs2.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                      <h5 class="modal-title" id="exampleModalLabel">주문하기</h5> 
                                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                      주문하기로 이동하시겠습니까?
                                    </div>
                                    <div class="modal-footer">
                                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">뒤로가기</button>        
                                      <a href="purchaseAction.go?num=${ w.product_code}&color=${w.opt_color}&size=${w.opt_size}">
                                      <button type="button" class="btn btn-primary">주문하기</button></a>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <!-- moveModal  -->
                              <div class="modal fade" id="moveModal${vs2.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                      <h5 class="modal-title" id="exampleModalLabel">장바구니로</h5>
                                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                      장바구니로 이동하시겠습니까?
                                    </div>
                                    <div class="modal-footer">
                                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">뒤로가기</button>
                                      <a href="cart.do?num=${ w.product_code}&p_num1=1&color=${w.opt_color}&size=${w.opt_size}">
                                      <button type="button" class="btn btn-primary">이동하기</button></a>  
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <!-- removeModal  -->
                              <div class="modal fade" id="removeModal${vs2.index}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                      <h5 class="modal-title" id="exampleModalLabel">삭제</h5>
                                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                      정말로 삭제하시겠습니까?
                                    </div>
                                    <div class="modal-footer">
                                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">뒤로가기</button>
                                      <a href="wishlistdelte.do?id=${id }&code=${w.cart_code}"><button type="button" class="btn btn-primary">삭제하기</button></a>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <!-- optionModal  -->
                              <div class="modal fade" id="optionModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                      <h5 class="modal-title" id="exampleModalLabel">옵션변경</h5>
                                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                      <p>상품명</p>
                                      <hr>
                                      <table class="select">
                                      <td><img src="../image/profile.png" width="150px"></td>
                                      <td><label for="select">필수 옵션&nbsp;</label></td>
                                      <td><select name="select" id="cloth-select">
                                         <option value="">--[필수] 옵션을 선택하세요--</option>
                                         <option value="s">s</option>
                                         <option value="m">m</option>
                                         <option value="l">l</option>
                                     </select></td>
                                     
                                      </table>
                                    </div><%-- <a href="wishlistupdate.do?id=${id }&code=${c.cart_code}"> --%>
                                    <div class="modal-footer">
                                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">변경</button>  <!-- 변경된 옵션을 저장 -->
                                      <button type="button" class="btn btn-primary">취소</button>
                                    </div>
                                    
                                    
                                  </div>	
                                </div>
                              </div>
							 </td>
							 </c:forEach>
							</table>
						</div>
					</div>
					
				</div>
				</c:if>
				<div class="select-btn">
				   <button type="button" class="btn btn-orderAll" data-bs-dismiss="modal">전체 상품 주문</button> <!--  체크된 상품들을 모두 결제창으로 -->
                   <button type="button" class="btn btn-deleteAll">관심상품 비우기</button> <!--  체크된 상품들을 display none -->
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../mainpage/footer.jsp" />
</body>
</html>