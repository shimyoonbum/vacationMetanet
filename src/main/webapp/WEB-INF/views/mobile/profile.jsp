<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true"%>
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
	<h2 style="padding-bottom : 30px;">프로필 상세보기</h2>  	
  	<table class="table table-hover">
		  <thead>
		    <tr class="table-light">
		      <th scope="col">이름</th>
		      <th scope="col">${EmployeeDTO.emp_name}</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<tr class="table-active">
		      <th scope="row">사원코드</th>
		      <td>${EmployeeDTO.emp_code}</td>
		    </tr>
		    <tr class="table-light">
		      <th scope="row">직급</th>
		      <td>${EmployeeDTO.emp_rank}</td>
		    </tr>
		    <tr class="table-active">
		      <th scope="row">부서</th>
		      <td>${EmployeeDTO.org_name}</td>
		    </tr>
		    <tr class="table-light">
		      <th scope="row">성별</th>
		      <c:set var = "gender" value = "M"/>
		      <c:if test="${gender eq 'M'}">
		      	<td>남성</td>
		      </c:if>
		      <c:if test="${gender eq 'Y'}">
		      	<td>여성</td>
		      </c:if>
		    </tr>
		    <tr class="table-active">
		      <th scope="row">전화번호</th>
		      <td>${fn:substring(EmployeeDTO.phone,0,3)}-${fn:substring(EmployeeDTO.phone,3,7)}-${fn:substring(EmployeeDTO.phone,7,11)}</td>      
		    </tr>
		    <tr class="table-light">
		      <th scope="row">상급자</th>
		      <td>${EmployeeDTO.emp_upper}</td>      
		    </tr>
		    <tr class="table-active">
		      <th scope="row">입사일자</th>      
		      <td>${EmployeeDTO.join_date}</td>     
		    </tr>		      
		  </tbody>
	</table> 
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