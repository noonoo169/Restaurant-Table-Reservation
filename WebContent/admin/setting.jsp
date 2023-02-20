
<%
	if(session.getAttribute("user") == null)
	{
		RequestDispatcher rd = request.getRequestDispatcher("/admin/login.jsp");
	    rd.forward(request, response);
	}
    if(request.getAttribute("tables") == null)
	{
    	RequestDispatcher rd = request.getRequestDispatcher("/TableServlet");
	    rd.forward(request, response);
	}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.ArrayList"%>
<%@ page language="java" import="Model.BEAN.Table"%>
<%
	String contextPath = request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="ISO-8859-1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>The Kitchen</title>
        <!-- Bootstrap Styles-->
        <link href="<%=contextPath%>assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FontAwesome Styles-->
        <link href="<%=contextPath%>assets/css/font-awesome.css" rel="stylesheet" />
        <!-- Custom Styles-->
        <link href="<%=contextPath%>assets/css/custom-styles.css" rel="stylesheet" />
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
                            <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
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
                            <a class="active-menu" href="#"><i class="fa fa-dashboard"></i>Table Status</a>
                        </li>
                        <li>
                            <a  href="TableServlet?update=1"><i class="fa fa-edit"></i>Update</a>
                        </li>
                        <li>
                            <a  href="TableServlet?add=1"><i class="fa fa-plus-circle"></i>Add Table</a>
                        </li>
                        <li>
                            <a   href="TableServlet?delete=1"><i class="fa fa-trash-o"></i>Delete Table</a>
                        </li>
                </div>

            </nav>
            <!-- /. NAV SIDE  -->

            <div id="page-wrapper" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="page-header">
                                Available <small> Tables</small>
                            </h1>
                        </div>
                    </div> 
                    <div class="row">
                    <%
                    	ArrayList<Table> tables = (ArrayList<Table>)request.getAttribute("tables");
                    	for( int i = 0; i< tables.size(); i++)
                    	{
                    %>
		                    
		                        <div class='col-md-3 col-sm-12 col-xs-12'>
								    <div class='panel panel-primary text-center no-boder bg-color-blue'>
								        <div class='panel-body'>
								            <i class='fa fa-users fa-5x'></i>
								            <h3>Table <%=tables.get(i).getId()%></h3>
								        </div>
								        <div class='panel-footer back-footer-blue'>
								            Price <%=tables.get(i).getPrice()%>
								        </div>
								        <div class='panel-footer back-footer-blue'>
								            <%=tables.get(i).getBooked() %> Booked
								        </div>
								    </div>
								</div>
		                    
		             <%
                    	}
		             %>
		             </div>
                    <!-- /. ROW  -->




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
            <!-- Custom Js -->
            <script src="assets/js/custom-scripts.js"></script>


    </body>
</html>
