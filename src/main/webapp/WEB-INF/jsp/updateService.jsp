<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<title>List services</title>
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
	height: 300px;
}

#box {
	position: relative;
	width: 500px;
	margin-top: 10px;
	height: 305px;
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
	height: 300px;
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

#address {
	position: absolute;
	top: 35px;
	left: 155px;
}

#email {
	position: absolute;
	top: 70px;
	left: 155px;
}

#phone {
	position: absolute;
	top: 105px;
	left: 155px;
}

#account {
	position: absolute;
	top: 140px;
	left: 155px;
}

#service {
	position: absolute;
	top: 175px;
	left: 155px;
}

#updateData {
	position: absolute;
	top: 215px;
	right: 10px;
}

#deleteData {
	position: absolute;
	top: 235px;
	right: 10px;
}
</style>
<script type="text/javascript">
	var app = angular.module('app', []);
	app.controller('AccountController', function($scope, $http) {
		$http.get("http://localhost:8080/Hibernate/institution/get/all")
				.then(function(response) {
					$scope.services = response.data;
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
			<div id="box" ng-repeat="service in services">
				<div id="header">
					<center>
						<b>{{service.name}}</b>
					</center>
				</div>
				<div id="boxContent">
					<b style="position: absolute; top: 4px; left: 15px;">ID:</b> <input
						type="text" value="{{service.id}}" id="id" readonly /> <b
						style="position: absolute; top: 39px; left: 15px;">Address:</b> <input
						type="text" value="{{service.address}}" id="address" /> <b
						style="position: absolute; top: 76px; left: 15px;">Contact
						email:</b> <input type="text" value="{{service.email}}" id="email" />
					<b style="position: absolute; top: 111px; left: 15px;">Phone:</b> <input
						type="text" value="{{service.phone}}" id="phone" /> <b
						style="position: absolute; top: 146px; left: 15px;">Account
						no:</b> <input type="text" value="{{service.accountNo}}" id="account" />
					<b style="position: absolute; top: 181px; left: 15px;">Service:</b>
					<input type="text" value="{{service.service}}" id="service" /> <a
						href="service/data?id={{service.id}}" id="updateData">Actualizeaza
						serviciul</a> <a href="../delete/service?id={{service.id}}"
						id="deleteData">Sterge serviciul</a>
				</div>
			</div>
		</div>
		</div>
	</sec:authorize>
</body>
</html>