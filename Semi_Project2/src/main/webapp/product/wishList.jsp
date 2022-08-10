<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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

				<ul class="nav nav-tabs" id="wishTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active">관심 상품 정보</button>
					</li>
					
				</ul>

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
								<tr class="align-middle">
									<td><input type='checkbox' name='choice' value='choice' /></td>
									<td>${product.product_image }</td>
									<td>${product.product_name }<br>
									<button type="button" id="opt-change" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#optionModal">옵션변경</button>
									</td>
									<td>${product.product_price }</td>
									<td>${product.product_price }</td>
									<td align="center">
									
							<!-- Button trigger modal -->
                              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#orderModal">
                              주문하기
                              </button>
                              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#moveModal">
                              장바구니로
                              </button>
                              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#removeModal">
                              삭제
                              </button>

                              <!-- orderModal -->
                              <div class="modal fade" id="orderModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                      <button type="button" class="btn btn-primary" >계속하기</button>  <!-- 결제창 링크로 이동 -->
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <!-- moveModal  -->
                              <div class="modal fade" id="moveModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                      <button type="button" class="btn btn-primary">계속하기</button>  <!-- 장바구니로 데이터를 넘겨줌 -->
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <!-- removeModal  -->
                              <div class="modal fade" id="removeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                      <button type="button" class="btn btn-primary">삭제하기</button>   <!-- 장바구니에서 display none  -->
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
                                         <option value="dog">red, M</option>
                                         <option value="cat">black, L</option>
                                         <option value="hamster">white, XL</option>
                                     </select></td>
                                      </table>
                                    </div>
                                    <div class="modal-footer">
                                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">변경</button>  <!-- 변경된 옵션을 저장 -->
                                      <button type="button" class="btn btn-primary">취소</button>
                                    </div>
                                  </div>	
                                </div>
                              </div>
							 </td>
							</table>
						</div>
					</div>
					
				</div>
				<div class="select-btn">
				   <button type="button" class="btn btn-orderAll" data-bs-dismiss="modal">전체 상품 주문</button> <!--  체크된 상품들을 모두 결제창으로 -->
                   <button type="button" class="btn btn-deleteAll">관심상품 비우기</button> <!--  체크된 상품들을 display none -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>