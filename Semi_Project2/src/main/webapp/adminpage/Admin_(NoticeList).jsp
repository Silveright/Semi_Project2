<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>
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
	<table class="table table-hover text-center ">
		<tr class="table-active">
		<th>번호</th>
		<th>내용</th>
		<th>날짜</th>
		<th>작성자</th>
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
		
		<tr>
		<td>1</td>
		<td>공지사항입니다.</td>
		<td>2022.08.04</td>
		<td>작성자</td>
		</tr>
		
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