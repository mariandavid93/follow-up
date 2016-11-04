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
	height: 220px;
}

#box {
	position: relative;
	width: 500px;
	margin-top: 10px;
	height: 200px;
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

#accountNo {
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
</style>
<script type="text/javascript">
	var app = angular.module('app', []);
	app.controller('AccountController', function($scope, $http) {
		$http.get(
				"http://localhost:8080/Hibernate/account/get/all/"
						+ window.location.search.substring(6,
								window.location.search.length) + "").then(
				function(response) {
					$scope.accounts = response.data;
				});
	});
</script>
</head>
<body>
	<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
		<div style="margin: 10 auto; width: 500px;">
			<div id="back">
				<center>
					<sec:authorize access="hasRole('ROLE_USER')">
						<a href="http://localhost:8080/Hibernate/homepage"
							style="position: relative; top: 10px;">Back</a>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<a href="http://localhost:8080/Hibernate/homepage/list/users"
							style="position: relative; top: 10px;">Back</a>
					</sec:authorize>
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
					<b style="position: absolute; top: 4px; left: 15px;">Account
						No:</b> <input type="text" value="{{account.accountNo}}"
						id="accountNo" readonly /> <b
						style="position: absolute; top: 39px; left: 15px;">Initial
						balance:</b> <input type="text" value="{{account.initialBalance}}"
						id="initial" readonly /> <b
						style="position: absolute; top: 76px; left: 15px;">Current
						balance:</b> <input type="text" value="{{account.currentBalance}}"
						id="current" readonly /> <b
						style="position: absolute; top: 111px; left: 15px;">Economy
						balance:</b> <input type="text" value="{{account.economyBalance}}"
						id="economy" readonly />
				</div>
			</div>
		</div>
		</div>
	</sec:authorize>
</body>
</html>