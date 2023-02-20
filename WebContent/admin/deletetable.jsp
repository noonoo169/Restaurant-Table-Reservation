<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.ArrayList"%>
<%@ page language="java" import="Model.BEAN.Table"%>
<%
	if(session.getAttribute("user") == null)
	{
		RequestDispatcher rd = request.getRequestDispatcher("/admin/login.jsp");
	    rd.forward(request, response);
	}
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="ISO-8859-1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>The Kitchen</title>
        <!-- Bootstrap Styles-->
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FontAwesome Styles-->
        <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- Custom Styles-->
        <link href="assets/css/custom-styles.css" rel="stylesheet" />
        <!-- Google Fonts-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    </head>
    <body>
        <div id="wrapper">
            <nav class="navbar navbar-default top-navbar" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="TableBookServlet">MAIN MENU </a>
                </div>

                <ul class="nav navbar-top-links navbar-right">

                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                            <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="UserServlet"><i class="fa fa-user fa-fw"></i> User Profile</a>
                            </li>
                            <li><a href="TableServlet?setting=1"><i class="fa fa-gear fa-fw"></i> Settings</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="AdminLoginServlet"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                            </li>
                        </ul>

                        <!-- /.dropdown-user -->
                    </li>
                    <!-- /.dropdown -->
                </ul>
            </nav>
            <!--/. NAV TOP  -->
            <nav class="navbar-default navbar-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav" id="main-menu">

                        <li>
                            <a  href="TableServlet?setting=1"><i class="fa fa-dashboard"></i>Table Status</a>
                        </li>
                        <li>
                            <a  href="TableServlet?update=1"><i class="fa fa-edit"></i>Update</a>
                        </li>
                        <li>
                            <a   href="TableServlet?add=1"><i class="fa fa-plus-circle"></i>Add Table</a>
                        </li>
                        <li>
                            <a  class="active-menu" href="#"><i class="fa fa-trash-o"></i>Delete Table</a>
                        </li>
                </div>
            </nav>
            <!-- /. NAV SIDE  -->
            <div id="page-wrapper" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="page-header">
                                DELETE Table <small></small>
                            </h1>
                        </div>
                    </div> 


                    <div class="row">

                        <div class="col-md-12 col-sm-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    Delete Table
                                </div>
                                <div class="panel-body">
                                    <form name="form" action="TableServlet" method="post">
                                        <div class="table-responsive">
					                        <table class="table">
					                            <thead>
					                                <tr>
					                                    <th>Type</th>
					                                    <th>Price</th>
					                                    <th>Booked</th>
					                                    <th>Delete</th>
					                                </tr>
					                            </thead>
					                            <tbody>
					                            <%
						                            if(request.getAttribute("tables") != null)
	                                            	{
	                                            		ArrayList<Table> tables = (ArrayList<Table>)request.getAttribute("tables");
	                                                	for( int i = 0; i< tables.size(); i++)
	                                                	{
					                            %>
					                            			<tr>
															    <td><%=tables.get(i).getId()%></td>
															    <td><%=tables.get(i).getPrice()%></td>
															    <td><%=tables.get(i).getBooked()%></td>
															    <td><a href='TableServlet?typeDelete=<%=tables.get(i).getId()%>' class='btn btn-primary'>Delete</a></td>
															</tr>
                                    			<%
	                                                	}
                                                	}
                                    			%>
					                            </tbody>
					                        </table>
				                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                        </div>
                    </div>
                    <!-- /. PAGE INNER  -->
                </div>
                <!-- /. PAGE WRAPPER  -->
            </div>
            <!-- /. WRAPPER  -->
            <!-- JS Scripts--
            <!-- jQuery Js -->
            <script src="assets/js/jquery-1.10.2.js"></script>
            <!-- Bootstrap Js -->
            <script src="assets/js/bootstrap.min.js"></script>
            <!-- Metis Menu Js -->
            <script src="assets/js/jquery.metisMenu.js"></script>
            <!-- Custom Js -->
            <script src="assets/js/custom-scripts.js"></script>


    </body>
</html>