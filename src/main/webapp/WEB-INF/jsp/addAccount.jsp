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
	app.controller("CreateAccount", function($scope, $http) {
		$scope.createAccount = function() {
			var data = {
				accountNo : $scope.accountNo,
				initialBalance : $scope.balance,
				currentBalance : $scope.balance,
				economyBalance : 0,
				username : $scope.username
			};

			var config = {
				headers : {
					'Content-Type' : 'application/JSON;'
				}
			}

			$http.post('http://localhost:8080/Hibernate/account/insert', data,
					config).success(function(data, status, headers, config) {
				if (data != null) {
					alert("Cont creat cu succes.");
					redirect();
				}
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
	height: 220px;
}

#box {
	position: absolute;
	width: 500px;
	height: 250px;
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

#accountNo {
	position: absolute;
	top: 0px;
	left: 120px;
}

#initialBalance {
	position: absolute;
	top: 35px;
	left: 120px;
}

#username {
	position: absolute;
	top: 70px;
	left: 120px;
}

#createAccount {
	position: absolute;
	top: 110px;
	left: 120px;
	background-color: rgb(216, 73, 55);
	border: none;
	border-radius: 2px;
	color: white;
}

#usersList {
	position: absolute;
	top: 150px;
	left: 120px;
}

#back {
	position: absolute;
	top: 175px;
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
						<b>Create an account</b>
					</center>
				</div>
				<div ng-app="app" ng-controller="CreateAccount" id="boxContent">
					<form>
						<b style="position: absolute; top: 4px; left: 15px;">Account
							no:</b> <input type="text" value="" id="accountNo"
							ng-model="accountNo" /> <b
							style="position: absolute; top: 39px; left: 15px;">Initial
							balance:</b> <input type="text" value="" id="initialBalance"
							ng-model="balance" /> <b
							style="position: absolute; top: 76px; left: 15px;">Username:</b>
						<input type="text" value="" id="username" ng-model="username" />
						<input type="submit" value="Create account" id="createAccount"
							ng-click="createAccount()" />
					</form>
					<a href="http://localhost:8080/Hibernate/list/users" id="usersList">Users
						list</a> <a href="http://localhost:8080/Hibernate/homepage" id="back">Back</a>
				</div>
			</div>
		</div>
	</sec:authorize>
</body>
</html>