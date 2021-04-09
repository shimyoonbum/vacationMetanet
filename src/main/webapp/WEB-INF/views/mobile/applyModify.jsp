<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Metanet</title>


<!-- 제이쿼리 모바일 CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/jquerymobile/jquery.mobile-1.4.5.min.css" rel="stylesheet">

<!-- 폰트 적용 링크 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">

<!-- 모달 및 테이블 css 파일 -->
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">

<!-- 아이콘 이미지 -->
<link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">


<!-- CSS 요소 리셋 -->
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet">

<!-- 커스텀 CSS -->
<link href="${pageContext.request.contextPath}/resources/css/basic.css" rel="stylesheet">


<style>

.formcontainer{ margin:20px; }
.form-custom{margin-bottom: 10px;}
</style>  

</head>
<body>

<%@ include file="header.jsp" %>
				  	
<div id="main">
	<!-- 휴가 신청 -->
	<div>
       	<h2>휴가 수정</h2>            	
    </div>       
	<div class='formcontainer'>  
		  <input type='hidden' id="va_code" value="${apply.va_code}">
		  <div class="form-group form-custom">	
			<label for="vacationkind" class="select" style="font-weight: 350; display:inline-block;">휴가종류</label>
			<span id="val_kind" style="color:red; font-size: 13px; display:none; display:none;" >*휴가 종류를 입력해 주세요.</span>
			<select name="vk_code" id="select-native-1" class='form-control' onChange="vk_check()">
			    <option value="VK1" <c:if test="${apply.vk_code eq 'VK1'}">selected</c:if>>연차</option>
			    <option value="VK2" <c:if test="${apply.vk_code eq 'VK2'}">selected</c:if>>반차</option>
			    <option value="VK3" <c:if test="${apply.vk_code eq 'VK3'}">selected</c:if>>출산전후휴가</option>
			    <option value="VK4" <c:if test="${apply.vk_code eq 'VK4'}">selected</c:if>>배우자출산휴가</option>
			    <option value="VK5" <c:if test="${apply.vk_code eq 'VK5'}">selected</c:if>>경조사휴가</option>
			    <option value="VK6" <c:if test="${apply.vk_code eq 'VK6'}">selected</c:if>>생리휴가</option>
			    <option value="VK7" <c:if test="${apply.vk_code eq 'VK7'}">selected</c:if>>병가</option>
			</select>
		  </div>  	
		  <div class="form-group form-custom">
		    <label for="dateStart" style="font-weight: 350; display:inline-block;">시작일</label>
		    <span id="val_date_st" style="color:red; font-size: 13px; display:none;">*시작 일자를 입력해주세요.</span>
		    <input type="date"  class="form-control" name="va_start_date" id="va_start_date" onChange="calcDate()" value="${apply.va_start_date}">
		   </div>
		   <div id="date_end_valid" class="form-group form-custom">
		    <label for="dateEnd" style="font-weight: 350; display:inline-block;">종료일</label>
		    <span id="val_date_end" style="color:red; font-size: 13px; display:none;" >*종료 일자를 입력해주세요.</span>
		    <input type="date"  class="form-control" name="va_end_date" id="va_end_date" onChange="calcDate()" value="${apply.va_end_date}">
		   </div>
		    <div class="form-group form-custom">
		    <label for="day" style="font-weight: 350; display:inline-block;">휴가일수</label>
		    <span id="val_day" style="color:red; font-size: 13px; display:none; display:none;" >*휴가 일수가 현재 잔여 일수보다 많습니다.</span>
		    <input type="text"  class="form-control" name="va_day" id="va_days_num" value="${apply.va_days_num}" readonly>
		   </div>
		   <div class="form-group form-custom">
		    <label for="day" style="font-weight: 350; display:inline-block;">포함 공휴일</label>
		    <input type="text"  class="form-control" name="va_day" id="va_national" value="" readonly>
		   </div>
		  <div class="form-group form-custom">
		    <label for="reason" style="font-weight:350; display:inline-block;">휴가 사유</label>
		    <span id="val_reason" style="color:red; font-size: 13px; display:none; display:none;" >*휴가 사유를 입력해주세요.</span>
		    <textarea name="va_reason" class="form-control" id="textarea-1" placeholder='휴가 사유를 입력하세요.' >${apply.va_reason}</textarea>
		  </div>
		  <div class="form-group form-custom" style="text-align:center;">
		  	<button type="button" id="vs_submit" class="btn btn-secondary">수정 하기</button>
		  </div>
		</div>
</div>


<!-- jquery, 모달 및 테이블 js 파일-->
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>



<script type="text/javascript">
		$(document).ready(function(){
			calcDate();
			
		})
		
		/* 사이드 네비게이션 바 */
		function openNav() {
  			document.getElementById("mySidenav").style.width = "300px";
		}

		function closeNav() {
  			document.getElementById("mySidenav").style.width = "0";
		}	

	    function vk_check(){
	    	if($("#select-native-1").val()=="VK2"){
	    		$("#date_end_valid").css("display","none")
	    	}
	    	else{
	    		$("#date_end_valid").css("display","block")
	    	}
	    }
	    
	    // 공휴일 변수
	    var natDays = [ 
	           [ 2019, 12, 25, 'ko', '크리스마스' ],
	          [ 2020, 01, 01, 'ko', '신정' ], 
	          [ 2020, 01, 24, 'ko', '설날' ],
	          [ 2020, 01, 27, 'ko', '대체휴일' ] 
	    ];
	 // 휴가 날짜수 구하기
	    function getDateRange(startDate, endDate, listDate) {
	       var dateMove = new Date(startDate);
	       var strDate = startDate;

	       if (startDate == endDate) {
	          var strDate = dateMove.toISOString().slice(0, 10);
	          listDate.push(strDate);
	       } else {
	          while (strDate < endDate) {
	             var strDate = dateMove.toISOString().slice(0, 10);
	             listDate.push(strDate);
	             dateMove.setDate(dateMove.getDate() + 1);
	          }
	       }
	       return listDate;
	    }
	    
	   // 휴가일수 계산
	   function calcDate() {
		  
		  if($("#select-native-1").val()=="VK2"){
				$("#va_end_date").val($("#va_start_date").val())
		  } 
	      var start = document.getElementById("va_start_date").value;
	      var end = document.getElementById("va_end_date").value;
	      var ar1 = start.split('-');
	      var ar2 = end.split('-');
	      var day1 = new Date(ar1[0], ar1[1]-1, ar1[2]);
	      var day2 = new Date(ar2[0], ar2[1]-1, ar2[2]);
	      var diff = day2 - day1 + 1;
	      var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨

	      var days = Math.ceil(diff / cDay);
	      // Subtract two weekend days for every week in between
	      var weeks = Math.floor(days / 7);
	      var days = days - (weeks * 2);
	      // Handle special cases 
	      var startDay = day1.getDay();
	      var endDay = day2.getDay();

	      // Remove weekend not previously removed. 
	      if (startDay - endDay > 1)
	         var days = days - 2;

	      // Remove start day if span starts on Sunday but ends before Saturday 
	      if (startDay == 0 && endDay != 6)
	         var days = days - 1

	         // Remove end day if span ends on Saturday but starts after Sunday 
	      if (endDay == 6 && startDay != 0)
	         var days = days - 1
		  
	         var listDate = [];
	         getDateRange(start, end, listDate);

	         // 공휴일 포함여부 계산
	         var cnt = 0;
	         var holi = [];

	         for (i = 0; i < listDate.length; i++) {
	            for (j = 0; j < natDays.length; j++) {
	               if (new Date(listDate[i]).getFullYear() == natDays[j][0]
	                     && new Date(listDate[i]).getMonth() == natDays[j][1] - 1
	                     && new Date(listDate[i]).getDate() == natDays[j][2]) {
	                  holi.push(natDays[j][4]);
	                  cnt++;
	               }
	            }
	         }
	         
	      if (start && end) {
			 if($("#select-native-1").val()=="VK2"){
				 document.getElementById('va_days_num').value = 0.5;
			 }
			 else
	         	document.getElementById('va_days_num').value = days - cnt;
			 	document.getElementById('va_national').value = holi;
	      }

	   }
	
	   
	   $("#vs_submit").on("click",function(){
		    
		    var cnt = 0;
		    if(!$("#va_start_date").val()){
		   		$("#val_date_st").css("display","inline")
		   	}
		   	else{
		   		$("#val_date_st").css("display","none")
		   		cnt++;
		   	}
		   	if(!$("#va_end_date").val()){
		   		$("#val_date_end").css("display","inline")
		   	}
		   	else{
		   		$("#val_date_end").css("display","none")
		   		cnt++;
		   	}
		   	if(!$("#textarea-1").val()){
		   		$("#val_reason").css("display","inline")
		   	}
		   	else{
		   		$("#val_reason").css("display","none")
		   		cnt++;
		   	}
		   	
		if(cnt == 3){
			var va_code = $("#va_code").val();
			var va_start_date = $("#va_start_date").val();
			var va_end_date = $("#va_end_date").val();
			var va_days_num = $("#va_days_num").val();
			var vk_code = $("#select-native-1").val();
			var va_reason = $("#textarea-1").val();
			
			var json = {
							"va_code" 		: va_code,
							"va_start_date" : va_start_date,
							"va_end_date"	: va_end_date,
							"va_days_num"	: va_days_num,
							"vk_code"		: vk_code,
							"va_reason"		: va_reason
						};
			console.log(json);	
			$.ajax({ 
				url: "/apply/moifying", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data: JSON.stringify(json), // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등) 
				contentType: "application/json",
				success: function(data) {
					if(data==1){
			        	window.location.href="/manage"
					}
					else{
						$("#val_day").css("display","inline")
					}
			    },
			    error: function(errorThrown) {
			        alert(errorThrown.statusText);
			    }
			})
			}
	   })
	   
	   

</script>
</body>
</html> 