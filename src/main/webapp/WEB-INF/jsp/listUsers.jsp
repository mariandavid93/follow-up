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
	height: 275px;
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

#firstname {
	position: absolute;
	top: 0px;
	left: 120px;
}

#surname {
	position: absolute;
	top: 35px;
	left: 120px;
}

#address {
	position: absolute;
	top: 70px;
	left: 120px;
}

#age {
	position: absolute;
	top: 105px;
	left: 120px;
}

#email {
	position: absolute;
	top: 140px;
	left: 120px;
}

#username {
	position: absolute;
	top: 175px;
	left: 120px;
}
</style>
<script type="text/javascript">
	var app = angular.module('app', []);
	app.controller('UserController', function($scope, $http) {
		$http.get("http://localhost:8080/Hibernate/user/get/all").then(
				function(response) {
					$scope.users = response.data;
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
		<div ng-app="app" ng-controller="UserController" id="content">
			<div id="box" ng-repeat="user in users">
				<div id="header">
					<center>
						<b>{{user.firstName+" "+user.surName}} (ID: {{user.id}})</b>
					</center>
				</div>
				<div id="boxContent">
					<b style="position: absolute; top: 4px; left: 15px;">First
						name:</b> <input type="text" value="{{user.firstName}}" id="firstname"
						name="firstname" readonly /> <b
						style="position: absolute; top: 39px; left: 26px;">Surname:</b> <input
						type="text" value="{{user.surName}}" id="surname" name="surname"
						readonly /> <b style="position: absolute; top: 76px; left: 32px;">Address:</b>
					<input type="text" value="{{user.address}}" id="address"
						name="address" readonly /> <b
						style="position: absolute; top: 111px; left: 60px;">Age:</b> <input
						type="text" value="{{user.age}}" id="age" name="age" readonly /> <b
						style="position: absolute; top: 146px; left: 46px;">Email:</b> <input
						type="text" value="{{user.email}}" id="email" name="email"
						readonly /> <b style="position: absolute; top: 180px; left: 18px;">Username:</b>
					<input type="text" value="{{user.username}}" id="username"
						name="username" readonly />
						<a href="../../homepage/list/accounts?user={{user.id}}" style="position:absolute;bottom:10px;right:10px;">View accounts</a>
				</div>
			</div>
		</div>
	</sec:authorize>
</body>
</html>