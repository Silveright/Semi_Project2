<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>리뷰보기</title>
<jsp:include page="../mainpage/header.jsp"/>
</head>
<style>
#upfile{display:none}

table td {
  position: relative;
}

table td input {
  position: absolute;
  top:0;
  left:0;
  margin: 0;
  height: 100%;
  width: 100%;
  border: none;
}
</style>
<title>MVC 게시판</title>
</head>
<body>
	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-sm-9 ">
				<div>
					<b>리뷰 보기</b>
				</div>
				<hr style="height: 2px; opacity: 1; border-width: 0; background-color: black; margin: 0 auto">
				<br>
				<table class="table table-bordered ">
					<tr>
						<td class="table-active text-center" style="width: 20%">작성자</td>
						<td><input type="text" class="form-control" name="writer"></td>
					</tr>
					<tr>
						<td class="table-active text-center">제목</td>
						<td><input type="text" class="form-control" name="subject"></td>
					</tr>
					<tr>
						<td colspan="2"><textarea rows="10" cols="50" name="content"
								class="form-control"></textarea></td>
					</tr>
					<tr>
						<td class="table-active text-center">구매제품</td>
						<td><input type="text" class="form-control" name="subject"></td>
					</tr>
					<tr>
						<td class="table-active text-center">첨부파일</td>
						<td>첨부파일명</td>
					</tr>
				</table>
					<button type="button" class="btn btn-dark float-end">글목록</button>
			</div>
		</div>
	</div>
</body>
</html>