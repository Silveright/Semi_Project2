<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../mainpage/header.jsp"/>
<title>회원 정보 list</title>
<html>
<head>
<style>

.btn1 {display : inline-block; float:right;}
.btn2 {display : inline-block; float:left;} 

</style>

 <body>
  
  <div class="container-fluid border text-center" >
 </div>
 <br>
 <div style="margin-left:150px"><b>회원정보</b></div>
  <hr style="height:2px; width:85%; opacity:1; border-width:0;  background-color:black; margin:0 auto">
  <br>
  <br>
  <br>
<div class="container -text-center">
	<table class="table table-striped table-hover text-center ">
		<tr class="table">
		<th>회원 번호</th>
		<th>이름</th>
		<th>성별</th>
		<th>주소</th>
		<th>아이디</th>
		<th>등급</th>
		<th>회원 정보수정</th>
		</tr>
		
		<tr>
			<td>1</td>
			<td>홍길동</td>
			<td>남</td>
			<td>서울시 종로구</td>
			<td>abc</td>
			<td>S</td>
			<td><button type="submit">정보수정</button></td>
		</tr>
		
		<tr>
			<td>2</td>
			<td>김길동</td>
			<td>남</td>
			<td>서울시 종로구</td>
			<td>def</td>
			<td>A</td>
			<td><button type="submit">정보수정</button></td>
		</tr>
		
		
	</table>
	
		<div class="center-block">
					<div class="container">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>
		
					<form action="#" method="post">
					<div class="input-group">
						<select id="viewcount" name="search_field">
							<option value="0" selected>아이디</option>
							<option value="1">회원번호</option>
						</select> <input name="search_word" type="text" placeholder="검색 내용을 입력하세요">
						<button class="btn2 btn-secondary" type="submit">검색</button>
					</div>
					</form>
</div>

<div class="mt-5 p-4 bg-light text-center margin bottom">
  <p>Footer</p>
</div>
 </body>
</html>
</body>
</html>