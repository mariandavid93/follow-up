<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<title>Create a new service</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var boxHeight = 355;
		var height = window.innerHeight;
		var topBox = (height - boxHeight) / 2;
		document.getElementById('box').style.top = topBox;
	}

	function redirect() {
		window.location = "http://localhost:8080/Hibernate/homepage";
	}

	var app = angular.module("app", []);
	app.controller("CreateService", function($scope, $http) {
		$scope.createService = function() {
			var data = {
				name : $scope.name,
				address : $scope.address,
				owner : $scope.owner,
				email : $scope.email,
				phone : $scope.phone,
				accountNo : $scope.accountNo,
				service : $scope.service
			};

			var config = {
				headers : {
					'Content-Type' : 'application/JSON;'
				}
			}

			$http.post('http://localhost:8080/Hibernate/institution/insert',
					data, config).success(
					function(data, status, headers, config) {
						alert("Serviciu creat cu succes.");
						redirect();
					})
		};

	});
</script>
<style>
body {
	background-color: rgb(238, 238, 238);
}

#content {
	margin: 0 auto;
	width: 500px;
	height: 325px;
}

#box {
	position: absolute;
	width: 500px;
	height: 355px;
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

#name {
	position: absolute;
	top: 0px;
	left: 120px;
}

#address {
	position: absolute;
	top: 35px;
	left: 120px;
}

#owner {
	position: absolute;
	top: 70px;
	left: 120px;
}

#email {
	position: absolute;
	top: 105px;
	left: 120px;
}

#phone {
	position: absolute;
	top: 140px;
	left: 120px;
}

#accountNo {
	position: absolute;
	top: 175px;
	left: 120px;
}

#service {
	position: absolute;
	top: 210px;
	left: 120px;
}

#createService {
	position: absolute;
	top: 250px;
	left: 120px;
	background-color: rgb(216, 73, 55);
	border: none;
	border-radius: 2px;
	color: white;
}

#back {
	position: absolute;
	top: 290px;
	left: 120px;
}
</style>
</head>
<body>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div id="content">
			<div id="box">
				<div id="header">
					<center>
						<b>Create a service</b>
					</center>
				</div>
				<div ng-app="app" ng-controller="CreateService" id="boxContent">
					<form>
						<b style="position: absolute; top: 4px; left: 15px;">Name:</b> <input
							type="text" value="" id="name" ng-model="name" /> <b
							style="position: absolute; top: 39px; left: 15px;">Address:</b> <input
							type="text" value="" id="address" ng-model="address" /> <b
							style="position: absolute; top: 76px; left: 15px;">Owner:</b> <input
							type="text" value="" id="owner" ng-model="owner" /> <b
							style="position: absolute; top: 111px; left: 15px;">Email:</b> <input
							type="text" value="" id="email" ng-model="email" /> <b
							style="position: absolute; top: 146px; left: 15px;">Phone:</b> <input
							type="text" value="" id="phone" ng-model="phone" /> <b
							style="position: absolute; top: 180px; left: 15px;">Account
							no:</b> <input type="text" value="" id="accountNo"
							ng-model="accountNo" /> <b
							style="position: absolute; top: 216px; left: 15px;">Service:</b>
						<input type="text" value="" id="service" ng-model="service" /> <input
							type="submit" value="Create service" id="createService"
							ng-click="createService()" />
					</form>
					<a href="http://localhost:8080/Hibernate/homepage" id="back">Back</a>
				</div>
			</div>
		</div>
	</sec:authorize>
</body>
</html>