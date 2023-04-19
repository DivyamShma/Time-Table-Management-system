<?php
	session_start();
	include_once 'connection.php';

?>


<html>
<head>
<style>

nav {
  /* background-color: #ADD8E6; */
  overflow: hidden;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
/* buff */
nav {
    display: flex;
    flex-wrap: wrap;
    margin: 0;
    padding: 0;
    text-align: center;
    list-style-type: none;

    /* From https://css.glass */
background: rgba(25, 49, 210, 0.5);
border-radius: 16px;
box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
backdrop-filter: blur(3.6px);
-webkit-backdrop-filter: blur(3.6px);
border: 1px solid rgba(25, 49, 210, 0.52);
  }

ul {
  margin: 0;
  padding: 0;
  list-style: none;
  display: flex;
}

li {
  margin-right: 20px;
}

li:last-child {
  margin-right: 0;
}

li :hover {
  
  /* From https://css.glass */
background: rgba(255, 255, 255, 0.29);
border-radius: 16px;
box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
backdrop-filter: blur(3.6px);
-webkit-backdrop-filter: blur(3.6px);
}


a {
  display: block;
  color: #00008b;
  color: #ffffff;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.logo a {
  font-weight: normal;
  font-size: 1.2em;
}

.topnav-right {
  float: right;
  background: rgba(25, 49, 210, 0.5);
  border-radius: 16px;
  box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
  backdrop-filter: blur(3.6px);
  -webkit-backdrop-filter: blur(3.6px);
  border: 1px solid rgba(25, 49, 210, 0.52);
}

topnav-right :hover{border-bottom: 2px solid darkblue;}

body {
  /* background-color: #FFFFFF; */
  background: linear-gradient(320deg,#f27121,#e94057,#8a2387);
}


input[type=text] {
  outline: none;
  color: #00008b;
  background: transparent; 
  border: none;
  border-bottom: 2px solid darkblue;
}

input[type=submit] {
  outline: none;
  color: #FFFFFF;
  background: transparent; 
  border: none;
  border-bottom: 2px solid lightblue;
}

input:hover[type=submit] {
  color: #00008b;
  border-bottom: 2px solid darkblue;
}


label{
color : #ffffff;
}

table, th, td{    
border: 0px solid black;  
margin-left: auto;  
margin-right: auto;  
/* border-collapse: collapse; */
text-align: center;  
font-size: 20px;
font-family: 'Nanum Gothic', sans-serif;
color : #FFFFFF;
padding: 8px;

}  
td {
/* From https://css.glass */
background: rgba(255, 255, 255, 0.13);
border-radius: 16px;
box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
backdrop-filter: blur(3.6px);
-webkit-backdrop-filter: blur(3.6px);
}

.container{
display : flex;
margin: 1rem auto;
justify-content: space-around;
align-items: center;
}
strong{
  color:#ffffff;
}
b {
  font-weight:400;
  color: #ffffff;
}
h2{
	text-align: center;
}
</style>
</head>
<body>


<?php


$section = $_SESSION['row']['Section'];
$batch =  $_SESSION['row']['Batch'];

?>


<nav>
  <ul class = "logo ">
    <li><a href="monday.php">Monday</a></li>
    <li><a href="tuesday.php">Tuesday</a></li>
    <li><a href="wednesday.php">Wednesday</a></li>
    <li><a href="thursday.php">Thursday</a></li>
    <li><a href="friday.php">Friday</a></li>
  </ul>
  <div>
	
	<?php
		
  		echo ucwords($_SESSION['row']['Name'])."<br>";
		echo "<strong>Department</strong> : ".$_SESSION['row']['Dept']." ";
		echo "<strong>Section</strong> : ".$_SESSION['row']['Section']." ";
		echo "<strong>Semester</strong> : ".$_SESSION['row']['Semester']." ";
		echo "<strong>Batch</strong> : ".$batch;
	?>
    
  </div>
  <div class="topnav-right">
    <a href="main.php">Home</a>
  </div>
  </div>
</nav>


<?php
$sql = "select * from student_friday where Section=\"$section\";";
$result = mysqli_query($conn,$sql);
$resultCheck = mysqli_num_rows($result);

if ($resultCheck > 0)
{
	while ($row1 = mysqli_fetch_assoc($result))
	{	
		echo "<table>";	
			echo "<tr>";
				echo "<th>".$row1['Timing']."</th>";
			echo "</tr>";
			echo "<tr>";
				echo "<br>"."<td>".$row1['Class_Room']."<br>".$row1['Name']."<br>".$row1['Course_name']."</td>";
			echo "</tr>";
		echo "</table>";
	}
}

$sql_f= $sql = "select Name,Email from faculty,friday,teach where friday.Course_code = teach.Course_code and teach.F_code = faculty.F_code and teach.Section=\"$section\";";
$result_f = mysqli_query($conn,$sql_f);
$resultCheck_f = mysqli_num_rows($result_f);


if ($resultCheck_f >0){
		echo "<table>";
		echo "<th>Contact concerned Faculty in case of query</th>";
		while($row_f = mysqli_fetch_assoc($result_f)){
			echo "<tr>";
				echo "<td>".$row_f['Name']." : ".$row_f['Email']."</td>"."<br>";
			echo "</tr>";
		}
	} 
	echo "</table>";
?>

<h2>LAB</h2>

<?php
$sql_lab = "select * from student_friday_lab where Section=\"$section\" and Batch=$batch;;";
$result_lab = mysqli_query($conn,$sql_lab);
$resultCheck_lab = mysqli_num_rows($result_lab);


if ($resultCheck_lab > 0)
{
	while ($row2 = mysqli_fetch_assoc($result_lab))
	{	
		echo "<table>";	
			echo "<tr>";
				echo "<th>".$row2['Timing']."</th>";
			echo "</tr>";
			echo "<tr>";
				echo "<br>"."<td>".$row2['Class_Room']."<br>".$row2['Name']."<br>".$row2['Course_name']."<br>"."Batch - ".$row2['Batch']."</td>";
			echo "</tr>";
		echo "</table>";
	}
}

$sql_lab_f = "select distinct Name,Email from faculty,teach,lab where lab.Course_code = teach.Course_code and teach.F_code = faculty.F_code and day=\"Friday\" and Batch=$batch;";
$result_lab_f = mysqli_query($conn,$sql_lab_f);
$resultCheck_lab_f = mysqli_num_rows($result_lab_f);


if ($resultCheck_lab_f >0){
		echo "<table>";
		echo "<th>Contact concerned Faculty in case of query</th>";
		while($row2_f = mysqli_fetch_assoc($result_lab_f)){
			echo "<tr>";
				echo "<td>".$row2_f['Name']." : ".$row2_f['Email']."</td>"."<br>";
			echo "</tr>";
		}
	} 
	echo "</table>";

?>


