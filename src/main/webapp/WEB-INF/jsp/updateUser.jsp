<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<title>Update user account</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<style type="text/css">
body {
	background-color: rgb(238, 238, 238);
}

#content {
	margin: 0 auto;
	width: 500px;
	height: 330px;
}

#box {
	position: absolute;
	width: 500px;
	height: 360px;
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
	height: 260px;
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

#password {
	position: absolute;
	top: 210px;
	left: 120px;
}

#updateInfo {
	position: absolute;
	top: 245px;
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
<script type="text/javascript">
	window.onload = function() {
		ID = parser.search.substring(4, parser.search.length);
		var boxHeight = 360;
		var height = window.innerHeight;
		var topBox = (height - boxHeight) / 2;
		document.getElementById('box').style.top = topBox;
	}

	function redirect() {
		window.location = "http://localhost:8080/Hibernate/homepage";
	}

	var app = angular.module('app', []);
	app.controller(
					'UserController',
					function($scope, $http) {
						$http.get(
								"http://localhost:8080/Hibernate/user/get/"
										+ window.location.search.substring(6,
												window.location.search.length)
										+ "").then(function(response) {
							var user = response.data;
							$scope.id = user.id;
							$scope.firstname = user.firstName;
							$scope.surname = user.surName;
							$scope.address = user.address;
							$scope.age = user.age;
							$scope.email = user.email;
							$scope.username = user.username;
							$scope.password = user.password;
						});

						$scope.updateUser = function() {
							var data = {
								id : $scope.id,
								firstName : $scope.firstname,
								surName : $scope.surname,
								address : $scope.address,
								age : $scope.age,
								email : $scope.email,
								username : $scope.username,
								password : $scope.password
							};

							var config = {
								headers : {
									'Content-Type' : 'application/JSON;'
								}
							}

							$http
									.put(
											'http://localhost:8080/Hibernate/user/update',
											data, config)
									.success(
											function(data, status, headers,
													config) {
												if (data != "") {
													alert("Informatiile au fost actualizate cu succes.");
													redirect();
												} else {
													alert("A aparut o eroare. Informatiile nu s-au putut actualiza.");
												}
											})
						};

					});
</script>
</head>
<body>
	<sec:authorize access="hasRole('ROLE_USER')">
		<div ng-app="app" ng-controller="UserController" id="content">
			<div id="box">
				<div id="header">
					<center>
						<b>Update user information</b>
					</center>
				</div>
				<div id="boxContent">
					<input type="hidden" ng-model="id" /> <b
						style="position: absolute; top: 4px; left: 15px;">First name:</b>
					<input type="text" id="firstname" name="firstname"
						ng-model="firstname" /> <b
						style="position: absolute; top: 39px; left: 26px;">Surname:</b> <input
						type="text" id="surname" name="surname" ng-model="surname" /> <b
						style="position: absolute; top: 76px; left: 32px;">Address:</b> <input
						type="text" id="address" name="address" ng-model="address" /> <b
						style="position: absolute; top: 111px; left: 60px;">Age:</b> <input
						type="text" id="age" name="age" ng-model="age" /> <b
						style="position: absolute; top: 146px; left: 46px;">Email:</b> <input
						type="text" id="email" name="email" ng-model="email" /> <b
						style="position: absolute; top: 180px; left: 18px;">Username:</b>
					<input type="text" id="username" name="username"
						ng-model="username" /> <b
						style="position: absolute; top: 216px; left: 22px;">Password:</b>
					<input type="password" id="password" name="password"
						ng-model="password" /> <input type="submit"
						value="Update Information" id="updateInfo" ng-click="updateUser()" />
					<a href="http://localhost:8080/Hibernate/homepage" id="back">Back</a>
				</div>
			</div>
		</div>
	</sec:authorize>
</body>
</html>