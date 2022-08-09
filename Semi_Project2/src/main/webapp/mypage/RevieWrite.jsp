<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>리뷰작성</title>
<jsp:include page="header.jsp"/>
</head>
<style>
table td {
  position: relative;
}
#upfile{display:none}

table td input {
  position: absolute;
  top:0;
  left:0;
  margin: 0;
  height: 100%;
  width: 100%;
  border: none;
}
img{width:20px}
</style>
<title>MVC 게시판</title>
</head>
<body>
	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-sm-9 ">
				<div>
					<b>리뷰 작성</b>
				</div>
				<hr
					style="height: 2px; opacity: 1; border-width: 0; background-color: black; margin: 0 auto">
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
						<td><label for="upfile"> <img src="../image/attach.png"
								alt="파일첨부">
						</label> <input type="file" id="upfile" name="board_file"> <span
							id="filevalue"></span></td>
					</tr>
				</table>
				<div style="text-align: center">
					<button type="button" class="btn btn-light float-right ml-1"
						data-mdb-ripple-color="dark " style="width: 90px">취소</button>
					<button type="button" class="btn btn-dark float-right ml-1">등록하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>