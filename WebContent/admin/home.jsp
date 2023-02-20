<%
	if(session.getAttribute("user") == null)
	{
		RequestDispatcher rd = request.getRequestDispatcher("/admin/login.jsp");
	    rd.forward(request, response);
	}

	if(request.getAttribute("tableBookList") == null)
	{
		RequestDispatcher rd = request.getRequestDispatcher("/TableBookServlet");
	    rd.forward(request, response);
	}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.ArrayList"%>
<%@ page language="java" import="Model.BEAN.TableBook"%>
<%
	String contextPath = request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta charset="ISO-8859-1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Administrator</title>
<!-- Bootstrap Styles-->
<link href="<%=contextPath%>assets/css/bootstrap.css" rel="stylesheet" />
<!-- FontAwesome Styles-->
<link href="<%=contextPath%>assets/css/font-awesome.css" rel="stylesheet" />
<!-- Morris Chart Styles-->
<link href="<%=contextPath%>assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<!-- Custom Styles-->
<link href="<%=contextPath%>assets/css/custom-styles.css" rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
</head>
<body>
	<div id="wrapper">
		<nav class="navbar navbar-default top-navbar" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="TableBookServlet">admin</a>
			</div>

			<ul class="nav navbar-top-links navbar-right">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#" aria-expanded="false"> <i
						class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="UserServlet"><i
								class="fa fa-user fa-fw"></i> User Profile</a></li>
						<li><a href="TableServlet?setting=1"><i class="fa fa-gear fa-fw"></i>
								Settings</a></li>
						<li class="divider"></li>
						<li><a href="AdminLoginServlet"><i class="fa fa-sign-out fa-fw"></i>
								Logout</a></li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
		</nav>
		<!--/. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">

					<li><a class="active-menu" href="TableBookServlet"><i
							class="fa fa-dashboard"></i> Status</a></li>
					
					<li><a href="AdminLoginServlet"><i class="fa fa-sign-out fa-fw"></i>
							Logout</a></li>
				</ul>
			</div>
		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">


				<div class="row">
					<div class="col-md-12">
						<h1 class="page-header">
							Status <small>Table Booking </small>
						</h1>
					</div>
				</div>
				<!-- /. ROW  -->
				

				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading"></div>
							<div class="panel-body">
								<div class="panel-group" id="accordion">

									<div class="panel panel-primary">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#accordion"
													href="#collapseTwo">
													<button class="btn btn-default" type="button">
														New Table Bookings <span class="badge">
															<%
																out.print(request.getAttribute("countNewBook"));
															%>
														</span>
													</button>
												</a>
											</h4>
										</div>
										<div id="collapseTwo" class="panel-collapse in"
											style="height: auto;">
											<div class="panel-body">
												<div class="panel panel-default">

													<div class="panel-body">
														<div class="table-responsive">
															<table class="table">
																<thead>
																	<tr>
																		<th>Name</th>
																		<th>Email</th>
																		<th>Phone</th>
																		<th>Country</th>
																		<th>Table</th>
																		<th>Purpose</th>
																		<th>Meal</th>
																		<th>Time</th>
																		<th>Date</th>
																		<th>Status</th>
																		<th>More</th>
																	</tr>
																</thead>
																<tbody>
                <%
                	
                   		 	ArrayList<TableBook> tableBookList = (ArrayList<TableBook>)request.getAttribute("tableBookList");
                			for( int i = 0; i < tableBookList.size() ; i++)
                			{
                				if(tableBookList.get(i).getStatus().equalsIgnoreCase("NOT CONFIRM"))
                				{
                %>
							<tr>
								<td><%
									out.print(tableBookList.get(i).getFName() + " " + tableBookList.get(i).getLName());
								%></td>
								<td><%
									out.print(tableBookList.get(i).getEmail() );
								%></td>
								<td><%
									out.print(tableBookList.get(i).getPhone() );
								%></td>
								<td><%
									out.print(tableBookList.get(i).getCountry() );
								%></td>
								<td><%
									out.print(tableBookList.get(i).getTableType() );
								%></td>
								<td><%
									out.print(tableBookList.get(i).getPurpose() );
								%></td>
								<td><%
									out.print(tableBookList.get(i).getMeal() );
								%></td>
								<td><%
									out.print(tableBookList.get(i).getTime() );
								%></td>
								<td><%
									out.print(tableBookList.get(i).getDate() );
								%></td>
								<td><%
									out.print(tableBookList.get(i).getStatus() );
								%></td>
								<td><a href='TableBookServlet?idConfirm=<%out.print(tableBookList.get(i).getId());%>' class='btn btn-primary'>Confirm</a></td>
							</tr>
				<%
					}
							}
				               	
				%>
																</tbody>
															</table>

														</div>
													</div>
												</div>
												<!-- End  Basic Table  -->
											</div>
										</div>
									</div>
									
									<div class="panel panel-info">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#accordion"
													href="#collapseOne" class="collapsed">
													<button class="btn btn-primary" type="button">
														Booked Tables <span class="badge">
															<%
																out.print(request.getAttribute("countBooked"));
															%>
														</span>
													</button>

												</a>
											</h4>
										</div>
										<div id="collapseOne" class="panel-collapse collapse"
											style="height: 0px;">
											<div class="panel-body">
												<div class="table-responsive">
															<table class="table">
																<thead>
																	<tr>
																		<th>Name</th>
																		<th>Email</th>
																		<th>Phone</th>
																		<th>Country</th>
																		<th>Table</th>
																		<th>Purpose</th>
																		<th>Meal</th>
																		<th>Time</th>
																		<th>Date</th>
																		<th>Status</th>
																		<th>More</th>
																	</tr>
																</thead>
																<tbody>
                <%
                if(request.getAttribute("tableBookList") == null)
            	{
            		RequestDispatcher rd = request.getRequestDispatcher("/TableBookServlet");
            	    rd.forward(request, response);
            	}
                			for( int i = 0; i < tableBookList.size() ; i++)
                			{
                				if(tableBookList.get(i).getStatus().equalsIgnoreCase("Confirm"))
                				{
                %>
							<tr>
								<td><%out.print(tableBookList.get(i).getFName() + " " + tableBookList.get(i).getLName());%></td>
								<td><%out.print(tableBookList.get(i).getEmail() );%></td>
								<td><%out.print(tableBookList.get(i).getPhone() );%></td>
								<td><%out.print(tableBookList.get(i).getCountry() );%></td>
								<td><%out.print(tableBookList.get(i).getTableType() );%></td>
								<td><%out.print(tableBookList.get(i).getPurpose() );%></td>
								<td><%out.print(tableBookList.get(i).getMeal() );%></td>
								<td><%out.print(tableBookList.get(i).getTime() );%></td>
								<td><%out.print(tableBookList.get(i).getDate() );%></td>
								<td><%out.print(tableBookList.get(i).getStatus() );%></td>
								<td><a href='TableBookServlet?idDelete=<% out.print(tableBookList.get(i).getId()); %>' class='btn btn-primary'>Delete</a></td>
							</tr>
				<%
						}
					}
				%>
																</tbody>
															</table>

														</div>
											</div>

										</div>

									</div>
									
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<!-- DEOMO-->
			<div class='panel-body'>
				<button class='btn btn-primary btn' data-toggle='modal'
					data-target='#myModal'>Update</button>
				<div class='modal fade' id='myModal' tabindex='-1' role='dialog'
					aria-labelledby='myModalLabel' aria-hidden='true'>
					<div class='modal-dialog'>
						<div class='modal-content'>
							<div class='modal-header'>
								<button type='button' class='close' data-dismiss='modal'
									aria-hidden='true'>&times;</button>
								<h4 class='modal-title' id='myModalLabel'>Change the User
									name and Password</h4>
							</div>
							<form method='post'>
								<div class='modal-body'>
									<div class='form-group'>
										<label>Change User name</label> <input name='usname'
											value='<?php echo $fname; ?>' class='form-control'
											placeholder='Enter User name'>
									</div>
								</div>
								<div class='modal-body'>
									<div class='form-group'>
										<label>Change Password</label> <input name='pasd'
											value='<?php echo $ps; ?>' class='form-control'
											placeholder='Enter Password'>
									</div>
								</div>

								<div class='modal-footer'>
									<button type='button' class='btn btn-default'
										data-dismiss='modal'>Close</button>

									<input type='submit' name='up' value='Update'
										class='btn btn-primary'>
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>

		<!--DEMO END-->




		<!-- /. ROW  -->

	</div>
	<!-- /. PAGE INNER  -->
	</div>
	<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->
	<!-- JS Scripts-->
	<!-- jQuery Js -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- Bootstrap Js -->
	<script src="assets/js/bootstrap.min.js"></script>
	<!-- Metis Menu Js -->
	<script src="assets/js/jquery.metisMenu.js"></script>
	<!-- Morris Chart Js -->
	<script src="assets/js/morris/raphael-2.1.0.min.js"></script>
	<script src="assets/js/morris/morris.js"></script>
	<!-- Custom Js -->
	<script src="assets/js/custom-scripts.js"></script>


</body>

</html>
