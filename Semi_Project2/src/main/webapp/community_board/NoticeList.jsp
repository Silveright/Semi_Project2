<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../mainpage/header.jsp"/>
<html>
<head>
<style>

.btn1 {display : inline-block; float:right; height:50px;}
.btn2 {display : inline-block; float:left;} 

</style>

 <body>
  
  <div class="container-fluid border text-center" >
 </div>
 <br>
 <div style="margin-left:150px"><b>공지사항</b></div>
  <hr style="height:2px; width:85%; opacity:1; border-width:0;  background-color:black; margin:0 auto">
  <br>
  <br>
  <br>
<div class="container -text-center">
	<table class="table table-hover text-center table-striped ">
		<tr class="table-active">
		<th>번호</th>
		<th>내용</th>
		<th>날짜</th>
		<th>작성자</th>
		</tr>
	<tbody>
	<c:set var="num" value="${listcount-(page-1)*limit}"/>
	<c:forEach var="b" items="${noticelist}">
		<tr>
		<td><c:out value="${num}"/> <%--num출력 --%>
			<c:set var="num" value="${num-1}"/>  <%--num-num-1; 의미 --%>
		</td>
		<td>공지사항입니다.</td>
		<td>2022.08.04</td>
		<td>작성자</td>
		</tr>
		
		<tr>
		<td>1</td>
		<td>공지사항입니다.</td>
		<td>2022.08.04</td>
		<td>작성자</td>
		</tr>
		
		<tr>
		<td>1</td>
		<td>공지사항입니다.</td>
		<td>2022.08.04</td>
		<td>작성자</td>
		</tr>
		
		<tr>
		<td>1</td>
		<td>공지사항입니다.</td>
		<td>2022.08.04</td>
		<td>작성자</td>
		</tr>
		
		<tr>
		<td>1</td>
		<td>공지사항입니다.</td>
		<td>2022.08.04</td>
		<td>작성자</td>
		</tr>
		
		<tr>
		<td>1</td>
		<td>공지사항입니다.</td>
		<td>2022.08.04</td>
		<td>작성자</td>
		</tr>
		
		<tr>
		<td>1</td>
		<td>공지사항입니다.</td>
		<td>2022.08.04</td>
		<td>작성자</td>
		</tr>
		
		<tr>
		<td>1</td>
		<td>공지사항입니다.</td>
		<td>2022.08.04</td>
		<td>작성자</td>
		</tr>
		</tbody>
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
					<button type="submit" class="btn1 btn-dark">공지 추가</button>
					<div class="input-group">
						<select id="viewcount" name="search_field">
							<option value="0" selected>제목</option>
							<option value="1">내용</option>
						</select> <input name="search_word" type="text" placeholder="제목을 입력하세요">
						<button class="btn2 btn-subprays" type="submit">검색</button>
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