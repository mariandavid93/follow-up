<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<title>Homepage</title>
<script type="text/javascript">
	window.onload = function() {
		var boxHeight = 250;
		var height = window.innerHeight;
		var topBox = (height - boxHeight) / 2;
		document.getElementById('box').style.top = topBox;
	}
	function logOut() {
		document.getElementById("logoutForm").submit();
	}
</script>
<style type="text/css">
body {
	background-color: rgb(238, 238, 238);
}

#content {
	margin: 0 auto;
	width: 300px;
	height: 250px;
}

#box {
	position: relative;
	width: 300px;
	margin-top: 10px;
	height: 220px;
	background-color: rgb(255, 255, 255);
	border: 1px solid rgb(214, 214, 214);
}

#header {
	position: absolute;
	top: 0px;
	left: 0px;
	width: 300px;
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

#editUserAccount {
	position: absolute;
	top: 5px;
	left: 50px;
}

#myAccounts {
	position: absolute;
	top: 35px;
	left: 50px;
}

#services {
	position: absolute;
	top: 65px;
	left: 50px;
}

#bill {
	position: absolute;
	top: 95px;
	left: 50px;
}

#delete {
	position: absolute;
	top: 125px;
	left: 50px;
}
</style>
</head>
<body>
	<c:url value="/j_spring_security_logout" var="logoutUrl" />

	<!-- csrt for log out-->
	<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
	<sec:authorize access="hasRole('ROLE_USER')">
		<div id="content">
			<div id="box">
				<div id="header">
					<center>
						<b>Manager</b>
					</center>
				</div>
				<div id="boxContent">
					<a href="homepage/update?user=${userID}" id="editUserAccount">Editeaza profilul</a> <a
						href="homepage/list/accounts?user=${userID}" id="myAccounts">Conturile curente</a> <a
						href="homepage/services" id="services">Lista serviciilor</a> 
						<a href="homepage/bill?user=${userID}" id="bill">Executa o plata</a> 
				        <a href="homepage/delete" id="delete">Sterge contul</a> 
				        <a href="javascript:logOut()" style="position: absolute; top: 150px; left: 50px;">Log out</a>
				</div>
			</div>
		</div>
		</div>
	</sec:authorize>

	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div id="content">
			<div id="box">
				<div id="header">
					<center>
						<b>Manager</b>
					</center>
				</div>
				<div id="boxContent">
					<a href="homepage/list/users"
						style="position: absolute; top: 15px; left: 50px;">Vizualizare
						utilizatori</a> <a href="homepage/add/account"
						style="position: absolute; top: 40px; left: 50px;">Adauga cont</a>
					<a href="homepage/update/account"
						style="position: absolute; top: 65px; left: 50px;">Editeaza
						conturile</a> <a href="homepage/add/service"
						style="position: absolute; top: 90px; left: 50px;">Adaugare
						serviciu</a> <a href="homepage/update/service"
						style="position: absolute; top: 115px; left: 50px;">Editeaza
						serviciile</a> <a href="javascript:logOut()"
						style="position: absolute; top: 140px; left: 50px;">Log out</a>
				</div>
			</div>
		</div>
		</div>
	</sec:authorize>
</body>
</html>