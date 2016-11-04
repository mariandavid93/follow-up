<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<title>Delete user account</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var boxHeight = 150;
		var height = window.innerHeight;
		var topBox = (height - boxHeight) / 2;
		document.getElementById('box').style.top = topBox;
	}

	var userID =
<%Cookie cookie = null;
			Cookie[] cookies = null;
			cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie c : cookies) {
					if (c.getName().equals("userID")) {
						cookie = c;
						out.write(cookie.getValue());
					}
				}
			}%>
	;

	var app = angular.module('app', []);
	app.controller('DeleteController', function($scope, $http) {
		$scope.deleteUser = function() {
			$http.del(
					"http://localhost:8080/Hibernate/user/delete/" + userID
							+ "").then(function(response) {
				alert("Contul a fost sters cu succes.");
			})

		};

	});
</script>
<style type="text/css">
body {
	background-color: rgb(238, 238, 238);
}

#content {
	margin: 0 auto;
	width: 500px;
	height: 150px;
}

#box {
	position: absolute;
	width: 500px;
	height: 120px;
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
	height: 100px;
}

input {
	width: 365px;
	height: 30px;
}

#id {
	position: absolute;
	top: 0px;
	left: 120px;
}

#username {
	position: absolute;
	top: 35px;
	left: 120px;
}

#delete {
	position: absolute;
	top: 10px;
	left: 67px;
	background-color: rgb(216, 73, 55);
	border: none;
	border-radius: 2px;
	color: white;
}

#back {
	position: absolute;
	top: 50px;
	left: 67px;
}
</style>
</head>
<body>
	<sec:authorize access="hasRole('ROLE_USER')">
		<div ng-app="app" ng-controller="DeleteController" id="content">
			<div id="box">
				<div id="header">
					<center>
						<b>Are you sure?</b>
					</center>
				</div>
				<div id="boxContent">
					<input type="submit" value="Delete account" id="delete"
						ng-click="deleteUser()" /> <a
						href="http://localhost:8080/Hibernate/homepage" id="back">Back</a>
					</form>
				</div>
			</div>
		</div>
	</sec:authorize>
</body>
</html>