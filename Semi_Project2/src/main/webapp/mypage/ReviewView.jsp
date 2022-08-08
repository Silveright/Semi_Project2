<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<input type="hidden" id="loginid" value="${id }" name="loginid">
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
						<td><input value="${reviewdata.review_name}" type="text" class="form-control" name="writer"></td>
					</tr>
					<tr>
						<td class="table-active text-center">제목</td>
						<td><input type="text" value="${reviewdata.review_subject}" class="form-control" name="subject"></td>
					</tr>
					<tr>
						<td colspan="2"><textarea rows="10" cols="50" name="content"
								class="form-control">${reviewdata.review_content}</textarea></td>
					</tr>
					<tr>
						<td class="table-active text-center">구매제품</td>
						<td><input type="text" class="form-control" name="subject"></td>
					</tr>
					<tr>
					<c:if test="${reviewdata.review_re_lev==0}">
						<td class="table-active text-center">첨부파일</td>
						<c:if test="${!empty reviewdata.review_file }">
						<td><img src="image/down.png" width="10px">
						<a href="BoardFileDown.bo?filename=${reviewdata.review_file}">${reviewdata.review_file}</a></td>
						</c:if>
					</c:if>
					</tr>
				</table>
					<button type="button" class="btn btn-dark float-end">글목록</button>
			</div>
		</div>
	</div>
</body>
</html>