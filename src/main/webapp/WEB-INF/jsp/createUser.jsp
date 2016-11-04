<html>
<head>
<title>Create a new user account</title>
<script src = "http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<script type="text/javascript">
window.onload=function()
{
var boxHeight=355;
var height=window.innerHeight;
var topBox=(height-boxHeight)/2;
document.getElementById('box').style.top=topBox;
}

function redirect()
{
  window.location="http://localhost:8080/Hibernate/homepage";
}

var app = angular.module("app", []);
app.controller("CreateUser", function ($scope, $http) {
    $scope.createUser = function () {
        var data = {
            firstName: $scope.firstname,
            surName: $scope.surname,
            address: $scope.address,
            age: $scope.age,
            email: $scope.email,
            username: $scope.username,
            password: $scope.password
        };
            
        var config = {
            headers : {
                'Content-Type': 'application/JSON;'
            }
        }

        $http.post('http://localhost:8080/Hibernate/user/insert', data, config)
        .success(function (data, status, headers, config) {
            alert("User creat cu succes."); 
            redirect();
        })
    };

});
</script>
<style>
body{background-color:rgb(238,238,238);}
#content{margin:0 auto;width:500px;height:325px;}
#box{position:absolute;width:500px;height:355px;background-color:rgb(255,255,255);border:1px solid rgb(214,214,214);}
#header{position:absolute;top:0px;left:0px;width:500px;height:40px;}
#header center b{position:relative;top:10px;font-size:16px;}
#boxContent{position:absolute;top:40px;left:0px;width:500px;height:240px;}
input{width:365px;height:30px;}
#firstname{position:absolute;top:0px;left:120px;}
#surname{position:absolute;top:35px;left:120px;}
#address{position:absolute;top:70px;left:120px;}
#age{position:absolute;top:105px;left:120px;}
#email{position:absolute;top:140px;left:120px;}
#username{position:absolute;top:175px;left:120px;}
#password{position:absolute;top:210px;left:120px;}
#createAccount{position:absolute;top:250px;left:120px;background-color:rgb(216,73,55);border:none;border-radius:2px;color:white;}
#back{position:absolute;top:290px;left:120px;}
</style>
</head>
<body>
<div id="content">
 <div id="box">
  <div id="header"><center><b>Create an account</b></center></div>
  <div ng-app="app" ng-controller="CreateUser" id="boxContent">
  <form>
  <b style="position:absolute;top:4px;left:15px;">First name:</b> 
  <input type="text" value="" id="firstname" name="firstname" ng-model="firstname" />
  <b style="position:absolute;top:39px;left:26px;">Surname:</b>
  <input type="text" value="" id="surname" name="surname" ng-model="surname"  />
  <b style="position:absolute;top:76px;left:32px;">Address:</b>
  <input type="text" value="" id="address" name="address" ng-model="address"/>
  <b style="position:absolute;top:111px;left:60px;">Age:</b>
  <input type="text" value="" id="age" name="age" ng-model="age"/>
  <b style="position:absolute;top:146px;left:46px;">Email:</b>
  <input type="text" value="" id="email" name="email" ng-model="email"/>
  <b style="position:absolute;top:180px;left:18px;">Username:</b>
  <input type="text" value="" id="username" name="username" ng-model="username" />
  <b style="position:absolute;top:216px;left:22px;">Password:</b>
  <input type="text" value="" id="password" name="password" ng-model="password" />
  <input type="submit" value="Create Account" id="createAccount" ng-click="createUser()" />
  </form>
  <a href="http://localhost:8080/Hibernate/user" id="back">Back</a>
  </div>
 </div>
</div>
</body>
</html>