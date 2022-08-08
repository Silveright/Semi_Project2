<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" > <!-- 순서 중요 -->
<style>
.d-flex {margin : 0;}
.nav-item {font-size : 13pt; style:bold;}
.navbar {padding : 10px 20px;}
a{text-decoration : none; color:black;}
.navbar-brand img {position : relative; left: 30px }
.container-fluid  img {height : 230px; width: 400px; object-fit: none; position : relative; top : 5px}

</style> 
<nav class="navbar navbar-expand-lg navbar-dark bg-dark justify-content-end">
	<a class="navbar-brand" href="#!"><img src="../image/home.png" width="45px"></a>
	<div class="collapse navbar-collapse flex-row-reverse">
      <ul class="navbar-nav mb-2 mb-lg-0 ">
      	<c:if test="${!empty id}">      	
			<li class="nav-item"><a class="nav-link" href="#"><small>로그아웃</small></a></li>
			<c:if test="${id=='admin'}">	  				
	        	<li class="nav-item"><a class="nav-link" href="#"><small>공지사항</small></a></li>
	        	<li class="nav-item"><a class="nav-link" href="#"><small>회원정보</small></a></li>
	        	<li class="nav-item"><a class="nav-link" href="#"><small>문의처리</small></a></li>
	        	<li class="nav-item"><a class="nav-link" href="#"><small>FAQ</small></a></li>
	        	<li class="nav-item"><a class="nav-link" href="#"><small>커뮤니티</small></a></li>
  			</c:if>
  			<c:if test="${!empty id && id != 'admin'}">  			
  			<li class="nav-item"><a class="nav-link" href="#"><small>정보수정</small></a></li>  
  			</c:if>			
  		</c:if>  			
		<c:if test="${empty id}">
			<li class="nav-item"><a class="nav-link" href="#"><small>로그인</small></a></li>
		</c:if>  			
			<li class="nav-item"><a class="nav-link" href="#"><small>장바구니</small></a></li>
			<li class="nav-item"><a class="nav-link" href="#"><small>관심상품</small></a></li>
			<li class="nav-item"><a class="nav-link" href="#"><small>마이페이지</small></a></li>
			<li class="nav-item"><a class="nav-link" href="#"><small>커뮤니티</small></a></li>        
      </ul>
    </div>      
    <form class="d-flex">
      <input class="form-control me-2" type="search" placeholder="Search">
      <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
</nav>


<div class="container-fluid p-2 text-center">
	<a href="#"><img src="../image/logo2.png"></a>
</div>
 
<div class="container-fluid border">
	<ul class="nav justify-content-center">
    	<li class="nav-item">
      		<a class="nav-link text-body" href="#">상의</a>
    	</li>
    	<li class="nav-item">
      		<a class="nav-link text-body" href="#">하의</a>
    	</li>
    	<li class="nav-item">
     		 <a class="nav-link text-body" href="#">아우터</a>
    	</li>
    	<li class="nav-item">
      		<a class="nav-link text-body" href="#">악세서리</a>
    	</li>
   	</ul>
</div>

     