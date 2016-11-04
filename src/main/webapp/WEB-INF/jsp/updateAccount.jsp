<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<title>List users</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<script type="text/javascript">
	
</script>
<style type="text/css">
body {
	background-color: rgb(238, 238, 238);
}

#back {
	position: relative;
	width: 500px;
	height: 40px;
	background-color: rgb(255, 255, 255);
	border: 1px solid rgb(214, 214, 214);
}

#content {
	margin: 0 auto;
	width: 500px;
	height: 230px;
}

#box {
	position: relative;
	width: 500px;
	margin-top: 10px;
	height: 233px;
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
	height: 200px;
}

input {
	width: 335px;
	height: 30px;
}

#id {
	position: absolute;
	top: 0px;
	left: 155px;
}

#initial {
	position: absolute;
	top: 35px;
	left: 155px;
}

#current {
	position: absolute;
	top: 70px;
	left: 155px;
}

#economy {
	position: absolute;
	top: 105px;
	left: 155px;
}

#updateData {
	position: absolute;
	top: 145px;
	right: 10px;
}

#deleteData {
	position: absolute;
	top: 165px;
	right: 10px;
}
</style>
<script type="text/javascript">
	var app = angular.module('app', []);
	app.controller('AccountController', function($scope, $http) {
		$http.get("http://localhost:8080/Hibernate/account/get/all").then(
				function(response) {
					$scope.accounts = response.data;
				});
	});
</script>
</head>
<body>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div style="margin: 10 auto; width: 500px;">
			<div id="back">
				<center>
					<a href="http://localhost:8080/Hibernate/homepage"
						style="position: relative; top: 10px;">Back</a>
				</center>
			</div>
		</div>
		<div ng-app="app" ng-controller="AccountController" id="content">
			<div id="box" ng-repeat="account in accounts">
				<div id="header">
					<center>
						<b>Account</b>
					</center>
				</div>
				<div id="boxContent">
					<b style="position: absolute; top: 4px; left: 116px;">ID:</b> <input
						type="text" value="{{account.id}}" id="id" /> <b
						style="position: absolute; top: 39px; left: 36px;">Initial
						balance:</b> <input type="text" value="{{account.initialBalance}}"
						id="initial" /> <b
						style="position: absolute; top: 76px; left: 22px;">Current
						balance:</b> <input type="text" value="{{account.currentBalance}}"
						id="current" /> <b
						style="position: absolute; top: 111px; left: 15px;">Economy
						balance:</b> <input type="text" value="{{account.economyBalance}}"
						id="economy" /> <a href="account/data?id={{account.id}}"
						id="updateData">Actualizeaza contul </a> <a
						href="../delete/account?id={{account.id}}" id="deleteData">Sterge
						contul</a>
				</div>
			</div>
		</div>
		</div>
	</sec:authorize>
</body>
</html>