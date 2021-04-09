<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

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
<body>

<%@ include file="header.jsp" %>
					  	
<div id="main" style="position:relative;">  
	<div style="text-align = left; position:absolute; top:20px; left:20px;">
   		<button type="button" class="btn btn-secondary btn-sm" onclick = "goBack();">뒤로 가기</button>
    </div>
	<div>
 		<h2 style="">상세 내역</h2>
	</div>	
	
	<table class="table table-hover">
		  <thead class = "table-light">
		    <tr>
		      <th scope="col">이름</th>
		      <th scope="col">${detailDTO.emp_Name}</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr class="table-active">
		      <th scope="row">직급</th>
		      <td>${detailDTO.emp_rank}</td>
		    </tr>
		    <tr class="table-light">
		      <th scope="row">부서</th>
		      <td>${detailDTO.org_Name}</td>
		    </tr>
		    <tr class="table-active">
		      <th scope="row">상급자</th>
		      <td>${detailDTO.upper_Emp_Name}</td>
		    </tr>		    
		    <tr class="table-light">
		      <th scope="row">휴가 신청일</th>
		      <td>${detailDTO.va_reg_date}</td>      
		    </tr>		    
		    <tr class="table-active">
		      <th scope="row">휴가 시작일</th>
		      <td>${detailDTO.va_start_date}</td>     
		    </tr>
		    <tr class="table-light">
		      <th scope="row">휴가 종료일</th>
		      <td>${detailDTO.va_end_date}</td>      
		    </tr>
		    <tr class="table-active">
		      <th scope="row">휴가 종류</th>
		      <td>${detailDTO.vk_Code_Name}</td>      
		    </tr>
		    <tr class="table-light">
		      <th scope="row">휴가 사유</th>
		      <td>${detailDTO.va_reason}</td>     
		    </tr> 	    
		    <tr class="table-active">
		      <th scope="row">확인날짜</th>
		      <td>${detailDTO.confirm_date}</td>
		    </tr>
	      	<tr class="table-light">
		      <th scope="row">승인 상태</th>
		      <td>${detailDTO.vs_Code_Name}</td>      
		    </tr>	
		    <tr class="table-active">
		      <th scope="row">거절 사유</th>
		      <td>${detailDTO.rej_reason}</td>      
		    </tr>      
		      
		  </tbody>
		</table> 
</div>

<!-- jquery, 모달 및 테이블 js 파일-->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
		function goBack(){
			window.history.back();
		}
		
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

