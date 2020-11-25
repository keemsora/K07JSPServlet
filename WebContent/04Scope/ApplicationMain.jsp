<%@page import="java.sql.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
/*
application영역에 속성 저장하기
- 어플리케이션 영역에 저장된 속성은 모든 JSP(Servlet)페이지에서 공유된다.
- 링크를 통해 새로운 페이지에 대한 요청이나, 포워드, 인클루드 등
	모든 페이지에서 영역이 공유된다. 이런 페이지들은 하나의 웹어플리케이션 내에 
	존재하기 때문이다.
*/
//현재날짜 가져오기
java.util.Date myUtilDate = new java.util.Date();
System.out.println("myUtilDate="+myUtilDate);

java.sql.Date mySqlDate = new Date(myUtilDate.getTime());
System.out.println("mySqlDate="+mySqlDate);

//DTO객체생성
MemberDTO first = new MemberDTO("kim", "1111", "김길동", mySqlDate);
MemberDTO second = new MemberDTO("Park", "2222", "박길동", null);
MemberDTO third = new MemberDTO("Lee", "3333", "이길동", null);

//List계열의 컬렉션 생성 후 DTO객체를 저장한다.
List<MemberDTO> lists = new Vector<MemberDTO>();
//AraayList<MemberDTO> lists = new ArrayList<MemberDTO>();
lists.add(first);
lists.add(second);
lists.add(third);

//Map계열의 컬렉션에 DTO객체 저장
Map<String, MemberDTO> maps = new HashMap<String, MemberDTO>();
maps.put("member1", first);
maps.put("member2", second);
maps.put("member3", third);

//어플리케이션 영역에 리스트와 맵 저장
application.setAttribute("lists", lists);
application.setAttribute("maps", maps);

//페이지영역, 리퀘스트영역에 각각 속성 저장
pageContext.setAttribute("pageMember", first);
request.setAttribute("requestMember", first);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ApplicationMain.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>어플리케이션영역의 공유</h2>
	
	<!-- 
		a태그를 통한 링크는 새로운 페이지에 대한 요청이므로
		page, request영역은 공유되지 않는다.
	-->
	<h3>사용자 클릭에 의한 이동</h3>
	<a href="ApplicationResult.jsp">
		사용자클릭
	</a>
	
	<!-- 
		포워드의 경우 page영역은 공유되지 않으나 request영역은 공유된다.
	-->
	<h3>포워드로 페이지 전달하기</h3>
	<%
		request.getRequestDispatcher("ApplicationResult.jsp")
			.forward(request, response);
	%>
	
	<!-- 외부파일 인클루드 : include지시어를 통해 페이지를 삽입하면
	같은 페이지로 간주되므로 page, request영역이 둘다 공유된다. -->
	<%@ include file = "ApplicationInclude.jsp" %>
</body>
</html>