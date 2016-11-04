<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<title>Update account</title>
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
		window.location = "http://localhost:8080/Hibernate/homepage/update/account";
	}

	var app = angular.module('app', []);
	app.controller('UpdateAccount', function($scope, $http) {
		$http.get(
				"http://localhost:8080/Hibernate/account/get/"
						+ window.location.search.substring(4,
								window.location.search.length) + "").then(
				function(response) {
					$scope.id = response.data.id;
					$scope.accountNo = response.data.accountNo;
					$scope.currentBalance = response.data.currentBalance;
					$scope.economyBalance = response.data.economyBalance;
					$scope.initialBalance = response.data.initialBalance;
					$scope.username = response.data.username;
				});

		$scope.updateAccount = function() {
			var data = {
				id : $scope.id,
				accountNo : $scope.accountNo,
				currentBalance : $scope.currentBalance,
				economyBalance : $scope.economyBalance,
				initialBalance : $scope.initialBalance,
				username : $scope.username
			};

			var config = {
				headers : {
					'Content-Type' : 'application/JSON;',
					'X-CSRFToken' : '5df7ebcf-20d1-41d4-8ea4-a07e75636668'
				}
			}

			$http.put('http://localhost:8080/Hibernate/account/update', data,
					config).success(function(data, status, headers, config) {
				alert("Contul a fost actualizat cu succes.");
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
	height: 255px;
}

#box {
	position: absolute;
	width: 500px;
	height: 285px;
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
	width: 325px;
	height: 30px;
}

#accountNo {
	position: absolute;
	top: 0px;
	left: 160px;
}

#currentBalance {
	position: absolute;
	top: 35px;
	left: 160px;
}

#economyBalance {
	position: absolute;
	top: 70px;
	left: 160px;
}

#initialBalance {
	position: absolute;
	top: 105px;
	left: 160px;
}

#username {
	position: absolute;
	top: 140px;
	left: 160px;
}

#updateAccount {
	position: absolute;
	top: 175px;
	left: 160px;
	background-color: rgb(216, 73, 55);
	border: none;
	border-radius: 2px;
	color: white;
}

#back {
	position: absolute;
	top: 215px;
	left: 160px;
}
</style>
</head>
<body>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div id="content">
			<div id="box">
				<div id="header">
					<center>
						<b>Update account</b>
					</center>
				</div>
				<div ng-app="app" ng-controller="UpdateAccount" id="boxContent">
					<form>
						<input type="hidden" ng-model="id" /> <b
							style="position: absolute; top: 4px; left: 15px;">Account no:</b>
						<input type="text" id="accountNo" ng-model="accountNo" readonly />
						<b style="position: absolute; top: 39px; left: 15px;">Current
							balance:</b> <input type="text" id="currentBalance"
							ng-model="currentBalance" /> <b
							style="position: absolute; top: 76px; left: 15px;">Economy
							balance:</b> <input type="text" id="economyBalance"
							ng-model="economyBalance" /> <b
							style="position: absolute; top: 111px; left: 15px;">Initial
							balance:</b> <input type="text" id="initialBalance"
							ng-model="initialBalance" readonly /> <b
							style="position: absolute; top: 146px; left: 15px;">User id:</b>
						<input type="text" id="username" ng-model="username" readonly /> <input
							type="submit" value="Update account" id="updateAccount"
							ng-click="updateAccount()" /> <input type="hidden"
							name="${_csrf.parameterName}" value="${_csrf.token}"  ng-model="_csrf"/>
					</form>
					<a href="http://localhost:8080/Hibernate/homepage/update/account"
						id="back">Back</a>
				</div>
			</div>
		</div>
	</sec:authorize>
</body>
</html>