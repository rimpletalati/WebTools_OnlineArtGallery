<html>
<head>
<title>Art Gallery</title>
<style>

body{
color:white;
}

.header {
	padding:35px;
	position: absolute;
	top: 15%;
	left: 1%;
}
.header a{
text-decoration:none;
}
 .header a:hover{
	text-decoration:none;
} 
.header p:first-child {
	font-size: 40px;
	color: white;
	font-family:"lucida calligraphy",arial,'sans serif'; 
	
}
.headerP{
	font-size: 25px;
	color: white;
}

.header p:first-child:first-letter {
	float: left;
	font-size: 200px;
	margin-right: 6px;
	line-height: 50%; 
	text-shadow: 0.05em 0.05em #C0C0C0;
}

.btn{
background-color:#FF9933;
height:30px;
}
</style>
</head>
<body background="resources/images/backgroundImg.jpg">
			<div class="header">
			<a href="goToSupplierHome.do">
			<p>ART GALLERY</p>
			<p class="headerP">bove & Beyond</p>
			</a>

		</div>
			<form action="logout.go" method="get" align="right">
					<input type="submit"  class="btn" value="Logout" />
			</form>
<h1 align="center"> Painting is added successfully </h1>
</body>

</html>