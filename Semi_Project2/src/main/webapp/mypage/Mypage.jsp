<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTML 기본구조</title>
<jsp:include page="header2.jsp"/>
<style>
.fakeimg {
	height: 200px;
	background: #aaa;
}

body>div.container>div>div>div.container.custom>div:nth-child(2) {
	height: 120px
}
</style>
</head>
<body>
	<br>
	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-sm-9 ">
				<div>
					<b>마이페이지</b>
				</div>
				<hr style="height: 2px; opacity: 1; border-width: 0; background-color: black; margin: 0 auto">

				<br>

				<div class="container custom">
					<div class="container-fluid bg-light my-custom-container border">
						<small>주문처리현황</small>
					</div>

					<div class="container-fluid border p-3 my-custom-container">
						<small class="p-3 text-center">배송 완료</small> <small
							class="p-4 text-center">배송 준비중</small> <small
							class="p-4 text-center">배송 중</small> <br>
						<br> <small class="p-5 text-center">0</small> <small
							class="p-5 text-center">0</small> <small class="p-5 text-center">0</small>
					</div>
					<br>
				</div>
				<br>

				<div class="row d-flex justify-content-center">
					<div class="col-lg-2 col-md-6" style="width: 20%">
						<div class="h-100 p-4 bg-light border rounded-3">
							<img src="../image/search.png" alt="Chicago"
								class="mx-auto rounded d-block" style="width: 65px"> <br>
							<h6 class="text-center">주문내역 조회</h6>
						</div>
					</div>

					<div class="col-lg-2 col-md-6" style="width: 20%">
						<div class="h-100 p-4 bg-light border rounded-3">
							<img src="../image/profile.png" alt="Chicago"
								class="mx-auto rounded d-block" style="width: 90px">
							<h6 class="text-center">회원정보 수정</h6>
						</div>
					</div>

					<div class="col-lg-2 col-md-6" style="width: 20%">
						<div class="h-100 p-4 bg-light border rounded-3">
							<img src="../image/star.png" alt="Chicago" class="mx-auto rounded d-block"
								style="width: 65px"> <br>
							<h6 class="text-center">관심상품</h6>
						</div>
					</div>

					<div class="col-lg-2 col-md-6" style="width: 20%">
						<div class="h-100 p-4 bg-light border rounded-3">
							<img src="../image/files.png" alt="Chicago"
								class="mx-auto rounded d-block" style="width: 60px"> <br>
							<h6 class="text-center">게시물 관리</h6>
						</div>
					</div>

					<div class="col-lg-2 col-md-6" style="width: 20%">
						<div class="h-100 p-4 bg-light border rounded-3">
							<img src="../image/delivery-truck.png" alt="Chicago"
								class="mx-auto rounded d-block" style="width: 65px"> <br>
							<h6 class="text-center">배송주소록 관리</h6>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>