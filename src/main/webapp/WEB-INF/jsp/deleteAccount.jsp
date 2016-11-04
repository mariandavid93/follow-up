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

	function redirect() {
		window.location = "http://localhost:8080/Hibernate/homepage/update/account";
	}

	var app = angular.module('app', []);
	app.controller('DeleteController', function($scope, $http) {
		$scope.deleteAccount = function() {
			$http.del(
					"http://localhost:8080/Hibernate/account/delete/"
							+ window.location.search.substring(4,
									window.location.search.length) + "").then(
					function(response) {
						alert("Contul a fost sters cu succes.");
						redirect();
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
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div ng-app="app" ng-controller="DeleteController" id="content">
			<div id="box">
				<div id="header">
					<center>
						<b>Are you sure?</b>
					</center>
				</div>
				<div id="boxContent">
					<input type="submit" value="Delete account" id="delete"
						ng-click="deleteAccount()" /> <a
						href="http://localhost:8080/Hibernate/homepage/update/account" id="back">Back</a>
					</form>
				</div>
			</div>
		</div>
	</sec:authorize>
</body>
</html>