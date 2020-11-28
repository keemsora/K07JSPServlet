<%@page import="model.BbsDAO"%>
<%@page import="model.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 글작성 완료 전 로그인 체크하기-->
<%@ include file="../common/isLogin.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

//폼값받기
String title = request.getParameter("title");//제목
String content = request.getParameter("content");//내용

//DTO객체에 폼값과 아이디 저장
BbsDTO dto = new BbsDTO();
dto.setTitle(title);
dto.setContent(content);
//세션영역에 저장된 회원인증정보를 가져와서 DTO에 삽입
dto.setId(session.getAttribute("USER_ID").toString());

//DAO객체 생성 시 application내장객체를 파라미터로 전달
BbsDAO dao = new BbsDAO(application);

//사용자의 입력값을 저장한 DTO객체를 DAO로 전달 후 insert처리
int affected = dao.insertWrite(dto);

if(affected==1){
	//글쓰기에 성공했을 때
	response.sendRedirect("BoardList.jsp");
}
else{
	//글쓰기에 실패했을 때
%>
	<script>
		alert("글쓰기에 실패하였습니다.");
		history.go(-1);
	</script>
<%
}
%>