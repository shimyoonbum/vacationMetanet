<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>LOGIN PAGE</title>

<!-- typeWriter -->
<script
	src="https://www.cssscript.com/demo/simple-typewriter-effect-pure-javascript-typewriterjs/typewriter.js"></script>

<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- login css -->
<link href="/resources/css/submain.css" rel="stylesheet">


<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</head>

<body>
	<div id="header" class="home">
		<div class="container">
			<div class="header-content">
				<h1>
					<span id="app"></span>
				</h1>
				<p>Designer, Developer, DB Architecture</p>
				<br>
				<div>
					<h1 style="display: inline-block;">10</h1>
					<h1 style="font-size: 25px; display: inline-block;">Legacy
						People</h1>
				</div>
				<div class="main--devider main--devider__left"></div>
				<p style="font-weight: bold;">
					Metanet employees manage vacations, and the team leader <br>is
					a website that approves and rejects vacations.
				</p>

				<br>
				<div>
					<form method="get" action="/login">
						<button type="submit" id="btn_login" class="btn btn-secondary"
							style="font-weight: bold">Go to Login</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		//글자 이펙트.
	    var app = document.getElementById('app');
	    var typewriter = new Typewriter(app, {
	        loop: true
	    });
	
	    typewriter.typeString('레거시프로젝트 at 산학협력')
	        .pauseFor(2500)
	        .deleteAll()
	        .typeString('Coding Your Life in Metanet')
	        .pauseFor(2500)
	        .deleteChars(7)
	        .typeString('Metanet Agile!!')
	        .pauseFor(2500)
	        .start();

  	</script>

</body>