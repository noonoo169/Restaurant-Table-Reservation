<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page language="java" import="java.util.ArrayList"%>
<%
	if(request.getAttribute("tableAvaiList") == null)
	{
		RequestDispatcher rd = request.getRequestDispatcher("/ReservationServlet");
	    rd.forward(request, response);
	}
%>
<%
	String contextPath = request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<link href="assets/css/custom-styles.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
	<div id="wrapper">
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li><a href="home.jsp"><i class="fa fa-home"></i>Homepage</a>
					</li>
				</ul>
			</div>
		</nav>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h1 class="page-header">TABLE RESERVATION</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-5 col-sm-5">
						<div class="panel panel-primary">
							<div class="panel-heading">PERSONAL INFORMATION</div>
							<div class="panel-body">
								<form action="ReservationServlet" name="form" method="post">
									<div class="form-group">
										<label>Title*</label> 
										<select name="title" class="form-control" required>
											<option value selected></option>
											<option value="Miss.">Miss.</option>
											<option value="Mr.">Mr.</option>
											<option value="Mrs.">Mrs.</option>
										</select>
									</div>
									<div class="form-group">
										<label>First Name</label> <input type="text" name="fname"
											class="form-control" required>
									</div>
									<div class="form-group">
										<label>Last Name</label> <input type="text" name="lname"
											class="form-control" required>
									</div>
									<div class="form-group">
										<label>Email</label> <input type="text" name="email"
											class="form-control" required>
									</div>
									<div class="form-group">
										<label>Nationality*</label> <label class="radio-inline">
											<input type="radio" name="nation" value="Indian" checked="">Indian
										</label> <label class="radio-inline"> <input type="radio"
											name="nation" value="Foreigner">Foreigner
										</label>
									</div>
									<div class="form-group">
										<label>Country*</label> 
										<select name="country" class="form-control" required>
											<option value selected></option>
											<option value="Australia">Australia</option>
											<option value="California">California</option>
											<option value="Bengluru">Bengluru</option>
											<option value="New Delhi">New Delhi</option>
											<option value="Mumbai">Mumbai</option>
											<option value="Cape Town">Cape Town</option>
											<option value="San Francisco">San Francisco</option>
											<option value="Texas">Texas</option>
											<option value="Miami">Miami</option>
											<option value="Rio">Rio</option>
											<option value="Berlin">Berlin</option>
											<option value="France">France</option>
											<option value="New York">New York</option>
										</select>
									</div>
									<div class="form-group">
										<label>Phone Number</label> <input name="phone" type="text"
											class="form-control" required>
									</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-sm-6">
							<div class="panel panel-primary">
								<div class="panel-heading">RESERVATION INFORMATION</div>
								<div class="panel-body">
									<div class="form-group">
										<label>Type Of Table</label> <select name="table" class="form-control" required>
											<option value selected></option>
											<%
												if(request.getAttribute("tableAvaiList") != null)
												{
													ArrayList<String> tableAvaiList = (ArrayList<String>)request.getAttribute("tableAvaiList");
													for( int i = 0; i< tableAvaiList.size(); i++)
													{
														out.print("<option value='" + tableAvaiList.get(i) + "'>" + tableAvaiList.get(i) +"</option>");
													}
												}
											%>
										</select>
									</div>
									<div class="form-group">
										<label>Purpose</label> <select name="purpose"
											class="form-control" required>
											<option value selected></option>
											<option value="Meeting">Meeting</option>
											<option value="Casual">Casual</option>
											<option value="Celebration">Celebration</option>
										</select>
									</div>
									<div class="form-group">
										<label>Meal Plan</label> <select name="meal"
											class="form-control" required>
											<option value selected></option>
											<option value="Breakfast">Breakfast</option>
											<option value="Lunch">Lunch</option>
											<option value="Dinner">Dinner</option>
										</select>
									</div>
									<div class="form-group">
										<label>Time</label> <input name="tme" type="time"
											class="form-control">
									</div>
									<div class="form-group">
										<label>Date</label> <input name="dte" type="date"
											class="form-control">
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="well">
								<input type="submit" name="submit" class="btn btn-primary"
									value="Reserve">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>