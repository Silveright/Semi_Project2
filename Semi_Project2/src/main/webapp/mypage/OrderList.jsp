<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../mainpage/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<title>주문내역</title>
<style>
</style>
</head>
<body>

	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-sm-9 ">
				<br>
				<div>
					<b>내 주문 내역</b>
				</div>
				<hr
					style="height: 2px; opacity: 1; background-color: black; margin: 0 auto">
				<br>

				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="userinfo-tab"
							data-bs-toggle="tab" data-bs-target="#userinfo" type="button"
							role="tab" aria-controls="userinfo" aria-selected="true">주문내역조회</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="myreview-tab" data-bs-toggle="tab"
							data-bs-target="#myreview" type="button" role="tab"
							aria-controls="myreview" aria-selected="false">주문취소내역</button>
					</li>
				</ul>

				<!-- 내용 -->
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="userinfo"
						role="tabpanel" aria-labelledby="userinfo-tab">
						<div class="container custom">
							<br>
							<div>
								<b>주문 상품 정보</b>
							</div>
							<hr
								style="height: 2px; opacity: 1; background-color: black; margin: 0 auto">
							<br>

							<table class="table">
								<tr class="table-active">
									<td>주문일자</td>
									<td>이미지</td>
									<td>상품명</td>
									<td>수량</td>
									<td>상품구매금액</td>
									<td>주문상태</td>
									<td align="center">취소/교환/반품</td>
								</tr>
								<tr class="align-middle">
									<td>주문일자</td>
									<td><img src="../image/profile.png" width="77px"></td>
									<td>상품명 예시</td>
									<td>수량</td>
									<td>상품구매금액</td>
									<td>주문상태</td>
									<td align="center">

										<div class="container justify-content-center">

											<button type="button" class="ms-3 btn btn-small btn-danger my-1"
												data-bs-toggle="modal" data-bs-target="#myModal">
												주문취소</button><br>
											<button type="button" class="ms-3 btn btn-small btn-primary"
												data-bs-toggle="modal" data-bs-target="#myModal">
												리뷰쓰기</button>
										</div> <!-- The Modal -->
										<div class="modal" id="myModal">
											<div class="modal-dialog">
												<div class="modal-content">

													<!-- Modal Header -->
													<div class="modal-header">
														<h4 class="modal-title">주문취소</h4>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal"></button>
													</div>

													<!-- Modal body -->
													<div class="modal-body">주문을 취소하시겠습니까?</div>

													<!-- Modal footer -->
													<div class="modal-footer">
														<button type="button" class="btn btn-sm btn-danger"
															data-bs-dismiss="modal">주문취소</button>
														<button type="button" class="btn btn-sm btn-primary"
															data-bs-dismiss="modal">뒤로가기</button>
													</div>

												</div>
											</div>
										</div>
									</td>
							</table>
						</div>
					</div>
					<div class="tab-pane fade" id="myreview" role="tabpanel"
						aria-labelledby="myreview-tab">
						<div class="tab-pane fade show active" id="userinfo"
							role="tabpanel" aria-labelledby="userinfo-tab">
							<div class="container custom">
								<br>
								<div>
									<b>주문 상품 정보</b>
								</div>
								<hr
									style="height: 2px; opacity: 1; background-color: black; margin: 0 auto">
								<br>

								<table class="table">
									<tr class="table-active">
										<td>주문일자</td>
										<td>이미지</td>
										<td>상품명</td>
										<td>수량</td>
										<td>상품구매금액</td>
										<td>주문상태</td>
										<td>취소/교환/반품</td>
									</tr>
									<tr class="align-middle">
										<td>주문일자</td>
										<td><img src="../image/profile.png" width="77px"></td>
										<td>상품명 예시</td>
										<td>수량</td>
										<td>상품구매금액</td>
										<td>주문상태</td>
										<td>

											취소완료
										</td>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>