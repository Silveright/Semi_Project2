<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- CSS only -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<jsp:include page="../mainpage/header.jsp"/>
<!DOCTYPE html>
<html>
<head>	 
<title>장바구니</title>
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
					<b>내 장바구니</b>
				</div>
				<hr
					style="height: 2px; opacity: 1; background-color: black; margin: 0 auto">
				<br>

				<ul class="nav nav-tabs" id="cartTab" role="cartlist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active">장바구니 정보</button>
					</li>
					
				</ul>
				<c:if test="${!empty cart }">
				<div class="cart-content" id="mycartContent">
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
									<td>수량</td>
									<td>상품구매금액</td>
									<td>합계</td>
									<td align="center">선택</td>
								</tr>
								<c:forEach var="c" items="${cart }"  varStatus="vs">
								<tr class="align-middle">
									<td><input type='checkbox' name='choice' value='choice' /></td>   <!--  메뉴 체크박스 클릭시 아래 모든 체크박스 표시  -->
									<td><img src="${pageContext.request.contextPath}/image/main/product/${c.product_image}.jpg" alt="${c.product_image}" width="77px"></td>
									<td>${c.product_name }<br>
									<button type="button" id="opt-change" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#optionModal">옵션변경</button>
									</td>
									<td><input type="text" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num" value="${c.cart_count}">                           
									<td>${c.product_price }</td>
									<td>${c.product_price }</td> <!-- 곱하기 수량 -->
									<td align="center">
									
							<!-- Button trigger modal -->
                              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#orderModal${vs.index }">
                              주문하기
                              </button>
                              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#moveModal${vs.index }">
                              관심상품으로
                              </button>
                              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#removeModal${vs.index }">
                              삭제
                              </button>

                              <!-- orderModal -->
                              <div class="modal fade" id="orderModal${vs.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                      <a href="purchaseAction.go?num=${ c.product_code}&p_num1=${c.cart_count}&color=${c.opt_color}&size=${c.opt_size}"></a>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <!-- moveModal  -->
                              <div class="modal fade" id="moveModal${vs.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                      <h5 class="modal-title" id="exampleModalLabel">관심상품으로</h5>
                                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                      관심상품으로 이동하시겠습니까?
                                    </div>
                                    <div class="modal-footer">
                                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">뒤로가기</button>
                                      <button type="button" class="btn btn-primary">계속하기</button>   <!-- 데이터를 관심상품으로 넘김 -->
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <!-- removeModal  -->
                              <div class="modal fade" id="removeModal${vs.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                      <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                      정말로 삭제하시겠습니까?
                                    </div>
                                    <div class="modal-footer">
                                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">뒤로가기</button>
                                      <a href="cartdelte.go?id=${id }&code=${c.cart_code}"><button type="button" class="btn btn-primary">삭제하기</button></a>    <!-- display none -->
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
                                    <form action="updatecart.do">
                                    <input type="hidden" name="id" value="${id }">
                                    <input type="hidden" name="cart_code" value="${c.cart_code }">
                                    <div class="modal-body">
                                      <p>상품명</p>
                                      <hr>
                                      <table class="select">
                                      <td><img src="../image/profile.png" width="150px"></td>
                                      <td><label for="select">필수 옵션&nbsp;</label></td>
                                      <td><select name="size" id="cloth-select">
                                         <option value="">--[필수] 옵션을 선택하세요--</option><!-- 두가지 적용이 힘듦 색상만 변경가능하게 하던가 사이즈만 가능하게 하든가 해야함 -->
                                         <option value="s">s</option>
                                         <option value="m">m</option>
                                         <option value="l">l</option>
                                     </select></td>
                                     
                                      </table>
                                    </div><%-- <a href="cartupdate.go?id=${id }&code=${c.cart_code}"> --%>
                                    <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">변경</button><!-- select로 정한 값을 가져가려면 form으로 처리되어야함  -->      <!-- 변경된 옵션을 적용 -->
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                    </div> 
                                                                    
                                    </form>
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
				   <button type="button" class="btn btn-orderAll" data-bs-dismiss="modal">전체 상품 주문</button>   
                   <button type="button" class="btn btn-deleteAll">장바구니 비우기</button>   <!-- display none -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>