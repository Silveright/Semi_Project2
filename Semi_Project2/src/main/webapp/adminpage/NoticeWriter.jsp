<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<jsp:include page="header.jsp"/>
<html>
<title>공지 글 작성</title>
<head>
<style>
h1 {
	font-size: 1.5rem;
	text-align: center;
	color: black
}

.container {
	width: 50%
}

#upfile {
	display: none
}

.btn1{float:right;}
.btn2{float:left;}
</style>
</head>
<body>
	<%--게시판 수정 --%>
			<div class="container-fluid border text-center" >
			</div>
 			<br>
	<div class="container">
		 <div>
			<b>공지 글 작성</b>
		</div>
			<hr style="height: 2px; opacity: 1; border-width: 0; background-color: black; margin: 0 auto">
			<br>
			
		<form action="#" method="post"
			enctype="multipart/form-data" name="Modify">
			<input type="hidden" name="board_num">
			
			
			<div class="form-group">
				<label for="board_subject">제목</label>
				<textarea name="board_subject" id="board_subject" rows="1"
					class="form-control" maxlength="100"></textarea>
			</div>
			
			<div class="form-group">
				<label for="board_name">작성자</label> <input type="text"
					class="form-control">
			</div>

			<div class="form-group">
				<label for="board_content">내용</label>
				<textarea name="board_content" id="board_content"
					class="form-control" rows="10"></textarea>
			</div>
			<%--원문글인 경우에만 파일 첨부 수정 가능합니다. --%>
				<div class="form-group">
					<label for="board_file">파일 첨부</label> <label for="upfile">
						<img src="#" alt="파일 첨부" width="20px">
					</label> <input type="file" id="upfile" name="board_file"> <span
						id="filevalue"></span> 
					<img src="image/remove.png" alt="파일삭제" width="10px" class="remove">
				</div>
			
			<br>
			<div class="form-group">
				<button type=submit class="btn1 btn-secondary">등록</button>
				<button type=reset class="btn2 btn-secondary" onClick="history.go(-1)">취소</button>
			</div>
		</form>
	</div>
	
	<div class="mt-5 p-4 bg-light text-center margin bottom">
  	<p>Footer</p>
	</div>
</body>
</html>