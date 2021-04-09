<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>LOGIN PAGE</title>
 
	<!-- 폰트 적용 링크 -->
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
	
	<!-- 아이콘 이미지 -->
	<link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	
	<!-- 모달 및 테이블 css 파일 -->
	<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
	
	<!-- CSS 요소 리셋 -->
	<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet">
	
	<!-- 커스텀 CSS -->
	<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">

</head>

<body style="background:lightgray">
	<div class="loginform">	
  		<div class="title">
    		<h4>Metanet 휴가관리시스템</h4>
  		</div>
  		<form method="post" action="/login" class="user">
    		<div class="form-group">
      			<input type="text" name="id" class="form-control form-control-user" placeholder="아이디">
    		</div>
    		<div class="form-group">
      			<input type="password" name="password" class="form-control form-control-user" placeholder="비밀번호">
    		</div>
    		<input type="submit" value="로그인" class="ubtn btn-secondary btn-lg btn-block" style="border:0"></input>
    		<hr>                  
  		</form>
  		  
  		<div class="text-center">
				<p class="small" style="color: #f00;">${msg}</p>
        </div>
	
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
