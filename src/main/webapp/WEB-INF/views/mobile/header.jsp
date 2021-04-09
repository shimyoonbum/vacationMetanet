<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
	<div id='container'>
	    <div id='box-left'><a href="/main"><i class="fas fa-home"></i></a></div>
	    <div id='box-center'><span style="font-size:30px;">Metanet</span></div>
	    <div id='box-right'><span style="font-size:30px	; cursor:pointer;" onclick="openNav()">&#9776;</span></div>
	</div>
</header>


<div id="mySidenav" class="sidenav">
  <div class="cancel" style="background : #0C4DA2">
  		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()" style="color:white !important">&times;</a>
  </div>
  <div class="profile" style="background : #0C4DA2">
  	<ul>
  		<li class="imgli3"><img class="imgtag3" src="/resources/img/logo.PNG"></li>
  	</ul>
  </div>
  <ul class = "menu">
  	<c:if test="${authority.AG0001 eq 'Y'}">
  	<li>
  		<a href="/vacationSubmit">
    		<i class="far fa-file"></i>
  			<span>휴가신청</span>
  		</a>
    </li>
    <li>
  		<a href="/manage">
    		<i class="far fa-calendar-alt"></i>
  			<span>휴가관리</span>
  		</a>
    </li>
    </c:if>
    <c:if test="${authority.AG0002 eq 'Y'}">
    <li>
  		<a href="/approveVacation">
    		<i class="far fa-calendar-check"></i>
  			<span>휴가승인관리</span>
  		</a>
    </li>
    </c:if>
    <li>
  		<a href="/logout">
  			<i class="fas fa-sign-out-alt"></i>
  			<span>로그아웃</span>
  		</a>
    </li>
  </ul>
</div>
					
</body>
</html>