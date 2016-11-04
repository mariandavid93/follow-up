<html>
<head>
<title>List users</title>
<script type="text/javascript">
window.onload=function()
{
var boxHeight=190;
var height=window.innerHeight;
var topBox=(height-boxHeight)/2;
document.getElementById('box').style.top=topBox;
}
</script>
<style type="text/css">
body{background-color:rgb(238,238,238);}
#content{margin:0 auto;width:500px;height:190px;}
#box{position:relative;width:500px;margin-top:10px;height:160px;background-color:rgb(255,255,255);border:1px solid rgb(214,214,214);}
#header{position:absolute;top:0px;left:0px;width:500px;height:40px;}
#header center b{position:relative;top:10px;font-size:16px;}
#boxContent{position:absolute;top:40px;left:0px;width:500px;height:240px;}
a{font-size:16px;}
#user{position:absolute;top:20px;left:20px;}
#admin{position:absolute;top:60px;left:20px;}
</style>
</head>
<body>
<div ng-app="app" ng-controller="UserController" id="content">
 <div id="box">
  <div id="header"><center><b>Welcome</b></center></div>
  <div id="boxContent">
     <a href="login" id="user"><b>Log in as user</b></a>
	 <a href="login" id="admin"><b>Log in as administrator</b></a>
  </div>
 </div>
</div>
</body>
</html>