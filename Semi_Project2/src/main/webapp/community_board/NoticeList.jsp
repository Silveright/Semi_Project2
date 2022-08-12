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
		<thead>
		<tr class="table-active">
		<th>번호</th>
		<th>내용</th>
		<th>날짜</th>
		<th>작성자</th>
		</tr>
		</thead>
	<tbody>
	<c:set var="num" value="${listcount-(page-1)*limit}"/>
	<c:forEach var="n" items="${noticelist}">
		<tr>
		<td><c:out value="${num}"/> <%--num출력 --%>
			<c:set var="num" value="${num-1}"/>  <%--num-num-1; 의미 --%>
		</td>
		<td><a href="noticeview.co?num=${n.notice_num}">
			<c:if test="${n.notice_title.length()>=30}">
				<c:out value="${n.notice_title.substring(0,20)}..."/>
			</c:if>
			<c:if test="${n.notice_title.length()<30}">
				<c:out value="${n.notice_title}"/>
			</c:if>
		</a>
		</td>
		<td>${n.notice_date}</td>
		<td>${n.notice_id}</td>
		</tr>
	</c:forEach>
		
		</tbody>
	</table>
	
					<div class="center-block">
					<div class="container">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<c:if test="${page <= 1 }">
								<li class="page-item">
								<a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a>
								</li>
								</c:if>
								<c:if test="${page > 1 }">
									<li class="page-item"><a class="page-link" href="#"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>

							<c:forEach var="a" begin="${startpage}" end="${endpage}">
								<c:if test="${a == page }">
									<li class="page-item active">
										<a class="page-link">${a}</a>
									</li>
								</c:if>
								<c:if test="${a!=page}">
								<li class="page-item">
									<a href="noticelist.co?page=${a}"
									class="page-link">${a}</a>
								</li>
								</c:if>
							</c:forEach>
							
								<c:if test="${page < maxpage}">
								<li class="page-item">
								<a class="page-link" href="noticelist.co?page=${page+1}"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
								</c:if>
							</ul>
						</nav>
					</div>
				</div>
		
					<form action="noticelist.co" method="post">
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

<%-- 게시글이 없는 경우--%>
 <c:if test="${listcount == 0 }">
	<font size=5>등록된 글이 없습니다.</font>
 </c:if>

 </body>
</html>
</body>
</html>