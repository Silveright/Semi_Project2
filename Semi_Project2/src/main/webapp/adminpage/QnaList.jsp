<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>
<title>문의처리 list</title>
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
 <div style="margin-left:150px"><b>문의처리</b></div>
  <hr style="height:2px; width:85%; opacity:1; border-width:0;  background-color:black; margin:0 auto">
  <br>
  <br>
  <br>
<div class="container -text-center">
	<table class="table table-hover text-center ">
		<tr class="table-active">
		<th>문의번호</th>
		<th>카테고리</th>
		<th>제목</th>
		<th>작성자</th>
		<th>처리상태</th>
		</tr>
		
		<tr>
		<td>100</td>
		<td>상품문의</td>
		<td>상품 문의 입니다.</td>
		<td>abc</td>
		<td>답변대기</td>
		
		<tr>
		<td>200</td>
		<td>배송문의</td>
		<td>배송 문의 입니다.</td>
		<td>def</td>
		<td>답변대기</td>
		
	</table>
	
		<div>
		<ul class="pagination justify-content-center">
		
			<li><a href = "#" style = "margin-right:5px;" class="text-secondary"> ◀ </a></li>
			<li><a href = "#" style = "margin-right:5px;" class="text-secondary"> 1 </a></li>
			<li><a href = "#" style = "margin-right:5px;" class="text-secondary"> 2 </a></li>
			<li><a href = "#" style = "margin-right:5px;" class="text-secondary"> 3 </a></li>
			<li><a href = "#" style = "margin-right:5px;" class="text-secondary"> 4 </a></li>
			<li><a href = "#" style = "margin-right:5px;" class="text-secondary"> 5 </a></li>
			<li><a href = "#" style = "margin-right:5px;" class="text-secondary"> ▶ </a></li>
			
		</ul>
		</div>
		
					<form action="#" method="post">
					<div class="input-group">
						<select id="viewcount" name="search_field">
							<option value="0" selected>제목</option>
							<option value="1">문의번호</option>
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