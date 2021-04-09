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
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet">

<!-- 커스텀 CSS -->
<link href="${pageContext.request.contextPath}/resources/css/basic.css" rel="stylesheet">

</head>
<body>

<%@ include file="header.jsp" %>

<!-- 반려사유 모달 -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- 모달 내용-->
      <div class="modal-content">
          <div class="modal-header">
          	  <input type="hidden" value="" class="hidden-input">		         
	          <h4 class="modal-title">반려 사유 작성</h4>
          </div>
		    <div class="modal-body">
		          <p><textarea class="form-control" id="exampleFormControlTextarea2" rows="3"></textarea></p>
		    </div>
		    <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal" id="okBtn">반려</button>
		          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	        </div>
		</div>      
    </div>
</div> 


					  	
<div id="main">  
	<div>
 		<h2>휴가 신청 내역</h2>
	</div>
	<div>
 		<h6>* 행을 클릭하여 내역 상세정보 보기</h6>
	</div>
	<div class="btn_approve">
 		<button type = "button" id="selectBtn" class ="btn btn-secondary">
 			<font style="vertical-align : inherit;">승인 </font>
 		</button>
	</div>	
	<form action="/list" method="post" id="form">
		<input type="hidden" name="index">
		<table class="table table-hover" id="approve_tab" style="width:100%">
			    <thead>
				    <tr class="table-primary">
				      <th scope="col"><input type="checkbox" id="checkall"></th>
				      <th scope="col">이름</th>
				      <th scope="col">유형</th>
				      <th scope="col">상태</th>
				      <th scope="col"></th>
				    </tr>
			    </thead>
				  <tbody>
				     <c:forEach items="${applyDTO}" var="list">  
						<tr class="table-warning evSelect">
				      		<td><input type="checkbox" name="chk"></td>
				      	  	<input type='hidden' value=${list.va_code}>
					      	<td class="sm">${list.emp_Name}</td>
					      	<td class="sm">${list.vk_Code_Name}</td>
					      	<td class="sm">${list.vs_Code_Name}</td>
					      	<td><button type="button" style = "font-size:50%;" class = "btn btn-secondary" data-target="#myModal" data-toggle="modal">반려</button></td>
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

		$(document).ready(function(){			
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

			/* 승인 */
			$("#selectBtn").click(function(){
				

				
				var array = new Array();
				var checkbox = $("input[name=chk]:checked");
				
				if(checkbox.length>0){
				
					// 유효성 처리
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
							console.log("값 :"+index);
						})
						console.log(array);
						var obj = {"indexArray": array };
						console.log(obj);
						$.ajax({ 
							url: "/approve", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
							data: JSON.stringify(obj), // HTTP 요청과 함께 서버로 보낼 데이터
							method: "POST", // HTTP 요청 메소드(GET, POST 등) 
							contentType: "application/json",
							success: function(data) {
						        alert("승인 완료되었습니다.");
									var checkbox = $("input[name=chk]:checked");					
									checkbox.each(function(i) {
								 		var tr = checkbox.parent().parent().eq(i);
										var td = tr.children();
										var state = td.eq(4).text("승인");	
									});
						    },
						    error: function(errorThrown) {
						        alert(errorThrown.statusText);
						    }
						})
					}
					
					else{
						alert("대기 상태가 아닙니다.")
					}
					
				}
				else{
					alert("승인 건을 선택해주세요");
				}
				
				
				
				
				
			});
			
			/* 반려 모당찰 확인 버튼 후 */
			$(".btn,.btn-danger").click(function(){  			
					 var checkButton = $(this);
			     	 var tr = checkButton.parent().parent();
			     	 var td = tr.children();
			     	 var index = td.eq(0).next().val();
			     	 $("#exampleFormControlTextarea2").val("");
			     	 $("#okBtn").off().on('click',function(){
						 var text = $(this).parent().prev().children().children().val();
						 var obj = {"va_code": index, "rej_reason": text  };
						 console.log(obj);
				     	 //유효성 처리
				     	 var valid = td.eq(4).text();
				     	 if(valid!=="대기"){
				     		 alert("대기 상태가 아닙니다.");
				     	 }	 				   
			     	 	else{
							 $.ajax({ 
									url: "/reject", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
									data: JSON.stringify(obj), // HTTP 요청과 함께 서버로 보낼 데이터
									method: "POST", // HTTP 요청 메소드(GET, POST 등) 
									contentType: "application/json",
									success: function(data) {
										if(data==1){
											console.log("반려 완료되었습니다.");
											td.eq(4).text("반려");
										}
										else{
											console.log("반려 실패했습니다.");
										}
										
								        //var state = td.eq(3).text("승인거절");
								     	//alert("승인 거절 완료!"+data); 
										 
								    },
								    error: function(errorThrown) {
								        alert(errorThrown.statusText);
								    }
								})
			     	 	}
						 

						 
					 });
					 

			});
			
		    
		    /* 셀 선택하면 자세한 리스트 내역 뷰 */
		    
		    $(".evSelect > .sm").click(function(){
				var td = $(this);
				var tr = td.parent('tr');
				var input = tr.children('input');
				var indexdata = input.val();
				console.log(indexdata);
				$("#form").children('input').val(indexdata);
				$("#form").submit();

			});
			
	});	

</script>
</body>
</html> 