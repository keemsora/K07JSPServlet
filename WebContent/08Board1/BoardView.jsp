<%@page import="model.BbsDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<!--  
	회원제 게시판이라 할지라도 상세보기는 로그인없이 확인할 수 있어야 한다.
	특수한 경우(비밀게시판, 1:1문의 등)에만 상세보기에 제한을 걸게 된다.
-->
<%
//파라미터로 전송된 게시물의 일련번호를 받음
String num = request.getParameter("num");
BbsDAO dao = new BbsDAO(application);

//조회수를 업데이트하여 visitcount칼럼을 1 증가시킴
dao.updateVisitCount(num);

//일련번호에 해당하는 게시물을 DTO객체로 반환함
BbsDTO dto = dao.selectView(num);

dao.close();
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/boardHead.jsp" />
<body>
	<div class="container">
		<div class="row">
			<jsp:include page="../common/boardTop.jsp" />
		</div>
		<div class="row">
			<jsp:include page="../common/boardLeft.jsp" />
			<div class="col-9 pt-3">
				<!-- ###게시판의 body부분 start###  -->
				<h3>게시판 - <small>View(상세보기)</small></h3>
				<div class="row mt-3 mr-1">
				<table class="table table-bordered">
				<colgroup>
					<col width="20%"/>
					<col width="30%"/>
					<col width="20%"/>
					<col width="*"/>
				</colgroup>
				<tbody>
					<tr>
						<td class="text-center table-active align-middle">아이디</td>
						<td><%=dto.getId() %></td>
						<td class="text-center table-active align-middle">작성일</td>
						<td><%=dto.getPostdate() %></td>
					</tr>
					<tr>
						<td class="text-center table-active align-middle">작성자</td>
						<td><%=dto.getName() %></td>
						<td class="text-center table-active align-middle">조회수</td>
						<td><%=dto.getVisitcount() %></td>
					</tr>
					<tr>
						<td class="text-center table-active align-middle">제목</td>
						<td colspan="3">
							<%=dto.getTitle() %>
						</td>
					</tr>
					<tr>
						<td class="text-center table-active align-middle">내용</td>
						<td colspan="3" height="200">
							<!-- textarea에 입력 시 엔터키를 사용하면
							\r\n으로 저장된다. 이를 브라우저상에 출력할 땐
							<br/>태그로 변경한 후 출력한다. -->
							<%=dto.getContent().replace("\r\n", "<br/>") %>
						</td>
					</tr>
								 
				</tbody>
				</table>
			</div>
			<div class="row mb-3">
				<div class="col-6">
					<button type="button" class="btn btn-secondary"
						onclick="';">수정하기</button>
					<button type="button" class="btn btn-success"
						onclick="">삭제하기</button>
				</div>
				<div class="col-6 text-right pr-5">					
					<button type="button" class="btn btn-warning" onclick="location.href='BoardList.jsp';">리스트보기</button>
				</div>	
			</div>
				<!-- ###게시판의 body부분 end###  -->
			</div>
		</div>
		<div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
		<jsp:include page="../common/boardBottom.jsp" />

	</div>
</body>
</html>