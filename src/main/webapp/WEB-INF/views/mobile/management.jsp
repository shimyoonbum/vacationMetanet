<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet">

<!-- 커스텀 CSS -->
<link href="${pageContext.request.contextPath}/resources/css/basic.css" rel="stylesheet">

</head>
<body>

<%@ include file="header.jsp" %>
				  	
<div id="main">
	<!-- 휴가 생성 내역 -->
	<div>
       	<h2>휴가 생성 내역</h2>            	
    </div>   
   
	<table class="table" style="font-size: 0.8rem;">
		  <thead>
		    <tr class = "table-primary">
		      <th scope="col">년도</th>
		      <th scope="col">휴가구분</th>
		      <th scope="col">발생일수</th>
		      <th scope="col">사용일수</th>
		      <th scope="col">잔여일수</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr class = "table-warning">
		      <td>${fn:substring(manageDTO.year,2,4)}</td>
		      <td>연차</td>	
		      <td>${manageDTO.acq_Days_Num}</td>
		      <td>${manageDTO.use_Days_Num}</td>
		      <td>${manageDTO.res_Days_Num}</td>
		    </tr>
		  </tbody>
		</table> 		
		<div>
           	<h2>휴가 신청 내역</h2>            	
        </div>       
		<div>
           	<h6>* 번호 클릭하면 자세한 내용 보기 가능</h6>            	
        </div>
	<div class="btn_class">
		<div id="va_submit">
			<button type = "button" class ="btn btn-secondary">
 				<font style="vertical-align : inherit;">휴가 신청 </font>
 			</button>
		</div>
		<div id="va_delete">
			<button type = "button"  class ="btn btn-secondary"><i class="fas fa-trash-alt"></i>삭제</button> 		
		</div>		
	</div>	    
        <!-- 휴가 신청 내역 -->	
    <form action="/list" method="post" id="form"> 
    <input type="hidden" name="index">   
	<table class="table"  id="manage_tab"  style="font-size: 0.8rem;">
		  <colgroup>
		  		<col width="5">
				<col width="35%">
				<col width="35%">
				<col width="15%">
				<col width="25%">
		  </colgroup>	
		  <thead>
		    <tr class = "table-primary">
		      <th scope="col"><input type="checkbox" id="checkall"></th>
		      <th scope="col">휴가유형</th>
		      <th scope="col">휴가기간</th>
		      <th scope="col">상태</th>
		      <th scope="col">수정</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach items="${applyDTO}" var="list">
		  	<tr class="table-warning evSelect">
		  	  <td><input type="checkbox" name="chk"></td>
		  	  <input type='hidden' value=${list.va_code}>
		      <td class = "sm"> ${list.vk_Code_Name}</td>		      
		       <td class = "sm">${fn:substring(list.va_start_date,5,10)}~${fn:substring(list.va_end_date,5,10)}</td>
		      <td class = "sm">${list.vs_Code_Name}</td>
		     <td> <c:if test="${list.vs_Code_Name eq '대기'}"><div style="padding:5px;" class="modify"><i class="fas fa-edit"></i></div></c:if></td>
		    </tr>
		  	</c:forEach>
		  </tbody>
	</table>	
	</form>
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

		/* check all */
	    $("#checkall").click(function(){
	          //클릭되었으면
	          if($("#checkall").prop("checked")){
	              //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	              $("input[name=chk]").prop("checked",true);
	              //클릭이 안되있으면
	          }else{
	              //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	              $("input[name=chk]").prop("checked",false);
	          }
	      });	      

		
		/* 휴가 신청 수정 */
		$(".modify").on("click",function(){
			var btn = $(this);
			var va_code = btn.parent().parent().children("input");
			$("#form").children('input').val(va_code.val());
			$("#form").attr("action", "/apply/modify");
			$("#form").submit();
			
		})
		
	    /* 휴가 신청 화면 버튼 */
		$("#va_submit").on("click",function(){
			window.location.href="/vacationSubmit";
		})
		
		/* 삭제 */
	$("#va_delete").click(function(){			
			var array = new Array();
			var checkbox = $("input[name=chk]:checked");


			var cnt=0;
			checkbox.each(function(i){
				var state = checkbox.eq(i).parent().next().next().next().next().text();
				console.log(state);
				if(state!=="대기")
					cnt++;
			})
			
			if(cnt==0){
				checkbox.each(function(i){
					var index = checkbox.eq(i).parent().next().val();
					array.push(index);
				})
				console.log(array);
				var obj = {"indexArray": array };
				console.log(obj);
				$.ajax({ 
					url: "/delete", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
					data: JSON.stringify(obj), // HTTP 요청과 함께 서버로 보낼 데이터
					method: "POST", // HTTP 요청 메소드(GET, POST 등) 
					contentType: "application/json",
					success: function(data) {
				        if(data>0){
							alert("삭제 완료되었습니다.");
							checkbox.parent().parent().remove();
						}
				        else{
				        	alert("삭제할 데이터가 존재하지 않습니다");
				        }
				    },
				    error: function(errorThrown) {
				        alert("네트워크 오류")
				    },			    
				})
			}

			else{
				alert("대기 상태가 아닙니다.")
			}			
		});

		/* 행 클릭시 리스트 화면으로 이동 */
	    $(".evSelect > .sm").click(function(){
			var td = $(this);
			var tr = td.parent('tr');
			var input = tr.children('input');
			var indexdata = input.val();
			console.log(indexdata);
			$("#form").children('input').val(indexdata);
			$("#form").submit();
		});

		
</script>
</body>
</html> 