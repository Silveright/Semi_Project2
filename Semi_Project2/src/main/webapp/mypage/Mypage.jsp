<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTML 기본구조</title>
<jsp:include page="header.jsp"/>
<style>
.fakeimg {
	height: 200px;
	background: #aaa;
}

footer {
	position: fixed;
	bottom: 0px;
	height: 3rem;
	background: #ccc;
	width: 100%;
	text-align: center;
	line-height: 3rem;
}


body>div.container>div>div>div.container.custom>div:nth-child(2) {
	height: 120px
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Navbar</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#"><small>로그인</small></a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#"><small>회원가입</small></a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#"><small>장바구니</small></a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#"><small>관심상품</small></a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#"><small>마이페이지</small></a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<small>커뮤니티</small>
					</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link disabled">Disabled</a>
					</li>
				</ul>
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>
	<div class="container-fluid p-5 text-center">
		<h1>SHOP</h1>
		<p></p>
	</div>

	<div class="container-fluid border">
		<ul class="nav justify-content-center">
			<li class="nav-item"><a class="nav-link text-body" href="#">상의</a>
			</li>
			<li class="nav-item"><a class="nav-link text-body" href="#">하의</a>
			</li>
			<li class="nav-item"><a class="nav-link text-body" href="#">아우터</a>
			</li>
			<li class="nav-item"><a class="nav-link text-body" href="#">악세서리</a>
			</li>
			<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
			</li>
		</ul>
	</div>
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
							<img src="search.png" alt="Chicago"
								class="mx-auto rounded d-block" style="width: 65px"> <br>
							<h6 class="text-center">주문내역 조회</h6>
						</div>
					</div>

					<div class="col-lg-2 col-md-6" style="width: 20%">
						<div class="h-100 p-4 bg-light border rounded-3">
							<img src="profile.png" alt="Chicago"
								class="mx-auto rounded d-block" style="width: 90px">
							<h6 class="text-center">회원정보 수정</h6>
						</div>
					</div>

					<div class="col-lg-2 col-md-6" style="width: 20%">
						<div class="h-100 p-4 bg-light border rounded-3">
							<img src="star.png" alt="Chicago" class="mx-auto rounded d-block"
								style="width: 65px"> <br>
							<h6 class="text-center">관심상품</h6>
						</div>
					</div>

					<div class="col-lg-2 col-md-6" style="width: 20%">
						<div class="h-100 p-4 bg-light border rounded-3">
							<img src="files.png" alt="Chicago"
								class="mx-auto rounded d-block" style="width: 60px"> <br>
							<h6 class="text-center">게시물 관리</h6>
						</div>
					</div>

					<div class="col-lg-2 col-md-6" style="width: 20%">
						<div class="h-100 p-4 bg-light border rounded-3">
							<img src="delivery-truck.png" alt="Chicago"
								class="mx-auto rounded d-block" style="width: 65px"> <br>
							<h6 class="text-center">배송주소록 관리</h6>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="mt-5 p-4 bg-light text-center">
		<p>Footer</p>
	</div>
</body>
</html>