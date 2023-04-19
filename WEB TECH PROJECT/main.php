<?php
	session_start();
?>


<?php

include_once 'connection.php';

?>

<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

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
margin-left: 0 px;  
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

</style>

</head>

<body>

<form action="" method="post" >
    <label for="val1">Registration Number: </label> 
    <input type="text" name="val1" id="val1"></input>
    <input type="submit" name="submit" value="Submit"></input>
</form>

<?php

if(isset($_POST['submit']))
{
    $val1 = htmlentities($_POST['val1']);
}
$start = fetch($val1);

?>

<?php
function fetch($val1 = 219311033)
{	

	global $conn;
	$sql = "select Name,Dept,Section,Semester,Batch from student where RegNo=$val1;";
	$result = mysqli_query($conn,$sql);
	$resultCheck = mysqli_num_rows($result);
	$_SESSION['row'] = mysqli_fetch_assoc($result);

}
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
		
  	echo "<b>".ucwords($_SESSION['row']['Name'])."</b>"."<br>";
		echo "<strong>Department :</strong> "."<b>".$_SESSION['row']['Dept']."</b>"." ";
		echo "<strong>Section :</strong> "."<b>".$_SESSION['row']['Section']."</b>"." ";
		echo "<strong>Semester :</strong> "."<b>".$_SESSION['row']['Semester']."</b>"." ";
		echo "<strong>Batch :</strong> "."<b>".$batch."</b> ";
	?>
    
  </div>
  <div class="topnav-right">
    <a href="main.php">Home</a>
  </div>
  </div>
</nav>
<div> </div>
<?php 

$sql_monday = "select * from student_monday where Section=\"$section\";";
$result_monday = mysqli_query($conn,$sql_monday);
$resultCheck_monday = mysqli_num_rows($result_monday);

$sql_tuesday = "select * from student_tuesday where Section=\"$section\";";
$result_tuesday = mysqli_query($conn,$sql_tuesday);
$resultCheck_tuesday = mysqli_num_rows($result_tuesday);

$sql_wednesday = "select * from student_wednesday where Section=\"$section\";";
$result_wednesday = mysqli_query($conn,$sql_wednesday);
$resultCheck_wednesday = mysqli_num_rows($result_wednesday);

$sql_wednesday_lab = "select * from student_wednesday_lab where Section=\"$section\" and Batch=$batch;;";
$result_wednesday_lab = mysqli_query($conn,$sql_wednesday_lab);
$resultCheck_wednesday_lab = mysqli_num_rows($result_wednesday_lab);

$sql_thursday = "select * from student_thursday where Section=\"$section\";";
$result_thursday = mysqli_query($conn,$sql_thursday);
$resultCheck_thursday = mysqli_num_rows($result_thursday);

$sql_thursday_lab = "select * from student_thurday_lab where Section=\"$section\" and Batch=$batch;;";
$result_thursday_lab = mysqli_query($conn,$sql_thursday_lab);
$resultCheck_thursday_lab = mysqli_num_rows($result_thursday_lab);

$sql_friday = "select * from student_friday where Section=\"$section\";";
$result_friday = mysqli_query($conn,$sql_friday);
$resultCheck_friday = mysqli_num_rows($result_friday);

$sql_friday_lab = "select * from student_friday_lab where Section=\"$section\" and Batch=$batch;;";
$result_friday_lab = mysqli_query($conn,$sql_friday_lab);
$resultCheck_friday_lab = mysqli_num_rows($result_friday_lab);

?>

<div class = "container">

<?php

echo "<br><table>
<tr>
	<th>Number of classes this week</th>
</tr>
<tr>
	<td>Monday : ".$resultCheck_monday."</td>
</tr>
<tr>
	<td>Tuesday : ".$resultCheck_tuesday."</td>
</tr>
<tr>
	<td>Wednesday : ".$resultCheck_wednesday + $resultCheck_wednesday_lab."</td>
</tr>
<tr>
	<td>Thursday : ".$resultCheck_thursday + $resultCheck_thursday_lab."</td>
</tr>
<tr>
	<td>Friday : ".$resultCheck_friday + $resultCheck_friday_lab."</td>
</tr>
</table>";

?>

<?php

$teach = "select distinct Course_name,faculty.Name from course,teach,student,faculty where course.Course_code = teach.Course_code and teach.F_code = faculty.F_code and student.Section = teach.Section and student.Semester = teach.Semester;";

$result_teach = mysqli_query($conn,$teach);
$resultCheck_teach = mysqli_num_rows($result_teach);
if ($resultCheck_teach > 0)
	{
		echo "<br><table>";	
		echo "<th>Courses currently enrolled in, and respective Faculty</th>";
		while ($row_teach = mysqli_fetch_assoc($result_teach))
		{	
				echo "<tr>";
					echo "<td>".$row_teach['Name']." : ".$row_teach['Course_name']."</td>";
				echo "</tr>";
			
		}
		echo "</table>";
	}
?>

</div>

</body>


</html>