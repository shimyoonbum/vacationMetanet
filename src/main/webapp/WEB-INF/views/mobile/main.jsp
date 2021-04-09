<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ page session="true"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Metanet</title>

<!-- 폰트 적용 링크 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">

<!-- 아이콘 이미지 -->
<link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<!-- 모달 및 테이블 css 파일 -->
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">

<!-- CSS 요소 리셋 -->
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">

<!-- 커스텀 CSS -->
<link href="${pageContext.request.contextPath}/resources/css/basic.css" rel="stylesheet" type="text/css">

</head>
<body style = "background : #F2F2F2;">

<%@ include file="header.jsp" %>

					  	
<div id="main">

	<div>		
  		<ul class = "mainpic">  			
  			<li class="hello"><span style="color:darkgray;">${accountDTO.id}</span><span> 님 환영합니다!</span></li>
  			<li style="color:black; font-weight:400; padding-top:20px">로그인 일시 : <span><%= sf.format(nowTime) %></span></li>
  		</ul>
  		<ul class = "mainpic2">  			
  			<li class="helloprofile"><button type="button" class="btn btn-secondary" onclick = "location='profile'">프로필 보기</button></li>
  		</ul>
  	</div>
  	<div>  		
		<div class='maintag' onclick = "location='manage'">
    		<div id='tag-left'><i class="fas fa-edit"></i></span><span> 신청 대기</span></div>
    		<div id='tag-right'><span><i class="fas fa-check"></i></span><span> 휴가 승인</span></div>
		</div>
		<div class='maininfo' onclick = "location='manage'">
    		<div id='info-left'><span>${count}</span><span> 건</span></div>
    		<div id='info-right'><span>${count2}</span><span> 건</span></div>
		</div>
  	</div>
  	
  	<div>
  		<div class='maintag'>
    		<div id='tag-left' onclick = "location='manage'"><span><i class="fas fa-times"></i></span><span> 휴가 반려</span></div>
    		<c:if test="${authority.AG0002 eq 'Y'}">
    		<div id='tag-right' onclick = "location='approveVacation'"><span><i class="fas fa-list"></i></span><span> 승인 요청</span></div>
    		</c:if>
		</div>
  		<div class='maininfo'>
    		<div id='info-left' onclick = "location='manage'"><span>${count3}</span><span> 건</span></div>
    		<c:if test="${authority.AG0002 eq 'Y'}">
    		<div id='info-right' onclick = "location='approveVacation'"><span>${count4}</span><span> 건</span></div>
			</c:if>
		</div>		
  	</div> 		
</div>



<!-- jquery, 모달 및 테이블 js 파일-->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">

		/* 사이드 네비게이션 바 */
		function openNav() {
  			document.getElementById("mySidenav").style.width = "300px";
		}

		function closeNav() {
  			document.getElementById("mySidenav").style.width = "0";
		}
</script>
</body>
</html> 