<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<title>Make a payment</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var boxHeight = 210;
		var height = window.innerHeight;
		var topBox = (height - boxHeight) / 2;
		document.getElementById('box').style.top = topBox;
	}

	function redirect() {
		window.location = "http://localhost:8080/AngularClient/homepage";
	}

	var app = angular.module("app", []);
	app.controller("Payment", function($scope, $http) {
		$scope.pay = function() {
			var data = {};

			var config = {
				headers : {
					'Content-Type' : 'application/JSON;'
				}
			}

			$http.post(
					"http://localhost:8080/Hibernate/account/payment/"
							+ window.location.search.substring(6,
									window.location.search.length) + "/"
							+ $scope.to + "/" + $scope.amount + "/"
							+ $scope.from + "", data, config).success(
					function(data, status, headers, config) {
						alert("Plata efectuata cu succes.");
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
	height: 215px;
}

#box {
	position: absolute;
	width: 500px;
	height: 215px;
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

#to {
	position: absolute;
	top: 0px;
	left: 160px;
}

#amount {
	position: absolute;
	top: 35px;
	left: 160px;
}

#accountNo {
	position: absolute;
	top: 70px;
	left: 160px;
}

#pay {
	position: absolute;
	top: 105px;
	left: 160px;
	background-color: rgb(216, 73, 55);
	border: none;
	border-radius: 2px;
	color: white;
}

#back {
	position: absolute;
	top: 145px;
	left: 160px;
}
</style>
</head>
<body>
	<sec:authorize access="hasRole('ROLE_USER')">
		<div id="content">
			<div id="box">
				<div id="header">
					<center>
						<b>Make a payment</b>
					</center>
				</div>
				<div ng-app="app" ng-controller="Payment" id="boxContent">
					<form>
						<b style="position: absolute; top: 4px; left: 15px;">Account
							no. (to):</b> <input type="text" value="" id="to" name="id"
							ng-model="to" /> <b
							style="position: absolute; top: 39px; left: 15px;">Amount:</b> <input
							type="text" value="" id="amount" name="amount" ng-model="amount" />
						<b style="position: absolute; top: 74px; left: 15px;">Account
							no (from):</b> <input type="text" value="" id="accountNo"
							name="accountNo" ng-model="from" /> <input type="submit"
							value="Pay" id="pay" ng-click="pay()" />
					</form>
					<a href="http://localhost:8080/Hibernate/homepage" id="back">Back</a>
				</div>
			</div>
		</div>
	</sec:authorize>
</body>
</html>