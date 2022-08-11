<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>리뷰보기</title>
<jsp:include page="../mainpage/header.jsp"/>
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

[readonly]{
  background-color:#fff !important;
}
</style>
</head>
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
						<td><input value="${reviewdata.review_name}" type="text" class="form-control" ReadOnly></td>
					</tr>
					<tr>
						<td class="table-active text-center">제목</td>
						<td><input type="text" value="${reviewdata.review_subject}" class="form-control" ReadOnly></td>
					</tr>
					<tr>
						<td colspan="2"><textarea rows="10" cols="50" name="content"
								class="form-control" ReadOnly>${reviewdata.review_content}</textarea></td>
					</tr>
					<c:if test="${reviewdata.review_re_lev==0}">
					<tr>
						<td class="table-active text-center">구매제품</td>
						<td><input type="text" class="form-control" value=${reviewdata.product_name } name="subject" ReadOnly></td>
					</tr>
					</c:if>
					<tr>
					<c:if test="${reviewdata.review_re_lev==0}">
						<td class="table-active text-center">첨부파일</td>
						<c:if test="${!empty reviewdata.review_file }">
						<td><img src="${pageContext.request.contextPath}/image/mypage/down.png" width="10px">
						<a href="filename=${reviewdata.review_file}">${reviewdata.review_file}</a></td>
						</c:if>
					</c:if>
					</tr>
				</table>
				<c:if test="${reviewdata.review_name == id || id == 'admin' }">
					<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#myModal">삭제하기</button>
					<a href="reviewmodify.pg?num=${reviewdata.review_num}"><button type="button" class="btn btn-dark">수정하기</button></a>
				</c:if>
					<a href="reviewreplyview.pg?num=${reviewdata.review_num }">
					<button type="button" class="btn btn-dark float-sm-end ms-1">답변달기</button>
					</a>
					<a href="reviewlist.pg"><button type="button" class="btn btn-dark float-sm-end">글목록</button></a>
					<div class="modal" id="myModal">
											<div class="modal-dialog">
												<div class="modal-content">

													<!-- Modal Header -->
													<div class="modal-header">
														<h4 class="modal-title">리뷰가 삭제됩니다.</h4>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal"></button>
													</div>
													<form name="deleteForm" action="reviewdeleteaction.pg" method="post">
													<!-- Modal body -->
													<div class="modal-body"><input type="hidden" name="num" value="${param.num}" id="comment_board_num">
											     	  <div class="form-group">
											           <label for="pwd">비밀번호</label>
									           			<input type="password" 
									           					class="form-control" id=" review_pass" 
									                  placeholder="Enter password" name="review_pass">
									       			  </div></div>
																						
													<!-- Modal footer -->
													<div class="modal-footer">
														<button type="submit" class="btn btn-sm btn-danger"
															>삭제하기</button>
														<button type="button" class="btn btn-sm btn-primary"
															data-bs-dismiss="modal">뒤로가기</button>
													</div>
													</form>
												</div>
											</div>
										</div>
			</div>
		</div>
	</div>
</body>
</html>