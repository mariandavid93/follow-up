<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<head>
<title>Log in</title>
<script type="text/javascript">
	window.onload = function() {
		var boxHeight = 260;
		var height = window.innerHeight;
		var topBox = (height - boxHeight) / 2;
		document.getElementById('box').style.top = topBox;
	}
</script>
<style type="text/css">
body {
	background-color: rgb(238, 238, 238);
}

#content {
	margin: 0 auto;
	width: 500px;
	height: 260px;
}

#box {
	position: relative;
	width: 500px;
	margin-top: 10px;
	height: 230px;
	background-color: rgb(255, 255, 255);
	border: 1px solid rgb(214, 214, 214);
}

#header {
	position: absolute;
	top: 0px;
	left: 0px;
	width: 500px;
	height: 40px;
}

#header center b {
	position: relative;
	top: 10px;
	font-size: 16px;
}

#boxContent {
	position: absolute;
	top: 40px;
	left: 0px;
	width: 500px;
	height: 240px;
}

input {
	width: 365px;
	height: 30px;
}

#username {
	position: absolute;
	top: 20px;
	left: 120px;
}

#password {
	position: absolute;
	top: 55px;
	left: 120px;
}

#logIn {
	position: absolute;
	top: 95px;
	left: 120px;
	background-color: rgb(216, 73, 55);
	border: none;
	border-radius: 2px;
	color: white;
}

#create {
	position: absolute;
	top: 135px;
	left: 120px;
}

#back {
	position: absolute;
	top: 160px;
	left: 120px;
}
</style>
</head>
<body>
	<div id="content">
		<div id="box">
			<div id="header">
				<center>
					<b>Log In</b>
				</center>
				<c:if test="${not empty error}">
					<center>
						<b
							style="position: relative; top: 16px; font-size: 13px; color: red;">${error}</b>
					</center>
				</c:if>
				<c:if test="${not empty out}">
					<center>
						<b
							style="position: relative; top: 16px; font-size: 13px; color: rgb(104, 142, 212);">${out}</b>
					</center>
				</c:if>
			</div>
			<div id="boxContent">
				<form name='loginForm'
					action="<c:url value='j_spring_security_check' />" method='POST'>
					<b style="position: absolute; top: 24px; left: 23px;">Username:</b>
					<input type="text" value="" id="username" name="username" /> <b
						style="position: absolute; top: 59px; left: 26px;">Password:</b> <input
						type="password" value="" id="password" name="password" /> <input
						type="submit" value="Log In" id="logIn" /> <input type="hidden"
						name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
				<a href="user/create" id="create">Create account</a> <a
					href="http://localhost:8080/RestService/" id="back">Back</a>
			</div>
		</div>
	</div>
</body>
</html>