<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	include지시어 : 공통으로 사용할 jsp파일을 생성한 후 
		현재 문서에 포함시킬 때 사용한다. 각각의 jsp파일 상단에는
		반드시 page지시어가 삽입되어야 한다.
		단, 하나의 jsp파일에서는 page지시어가 중복선언되면 안 된다.
--%>
<%@ include file = "IncludePage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- CSS코드는 양이 많으므로 외부파일로 선언하여 현재 문서에 링크시킨다. -->
<link rel="stylesheet" href="./css/div_layout.css" />
</head>
<body>
<div class="Allwrap">
	<div class="header">
	<!-- GNB(Global Navigation Bar)영역 - 전체공통메뉴  -->
	<%@ include file = "../common/Top.jsp" %>
	</div>
	<div class="body">
		<div class="left_menu">
			<!-- LNB영역(Local Navigation Bar) - 로컬메뉴 -->
			<%@ include file = "../common/Left.jsp" %>
		</div>
		<div class="contents">
			<!-- Contents 영역 -->
			<%-- 
			해당 변수는 외부파일에 선언하여 본 문서에 include처리되었다.
			include는 문서자체를 포함시키는 개념이므로 에러가 발생하지 않는다.
			--%>
			<h2>오늘의 날짜 : <%=todayStr %></h2>
			<br /><br />
			
			문화체육관광부와 교육부, 한복진흥센터는 올해 5월부터 6월까지 '한복교복 보급 시범사업'에 참여할 중·고등학교를 공모했고, 최종적으로 16개 학교, 학생 2,308명에게 한복교복을 보급하기로 확정했다.
		
			<br /><br />
		</div>
	</div>
	<div class="copyright">
	<!-- Copyright -->
		<%@ include file = "../common/Copyright.jsp" %>
	</div>
</div>
</body>
</html>