<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.ArrayList"%>
<%@ page language="java" import="Model.BEAN.User"%>
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
        <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
        <style>
        	.user{
        		border: none;
  				min-width: 1px;  
        	}
        </style>
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
                            <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
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
                            <a class="active-menu" href="UserServlet?setting=1"><i class="fa fa-dashboard"></i>User Dashboard</a>
                        </li>  
                </div>
            </nav>
            <!-- /. NAV SIDE  -->

            <div id="page-wrapper" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="page-header">
                                ADMINISTRATOR<small> accounts </small>
                            </h1>
                        </div>
                    </div> 
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Advanced Tables -->
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                                <tr>
                                                    <th>User ID</th>
                                                    <th>User name</th>
                                                    <th>Password</th>
                                                    <th>Update</th>
                                                    <th>Remove</th>
                                                </tr>
                                            </thead>
                                            <tbody>
	<%
		
		if(request.getAttribute("users") != null)
		{
			ArrayList<User> users = (ArrayList<User>)request.getAttribute("users");
			for( int i = 0; i<users.size(); i++)
			{
	%>		
				<tr>
					<form action="UserServlet" method="post">
					<td><input type="text" class="user" name="id" value=<%out.print(users.get(i).getId() );%> readonly></td>
					<td><input type="text" class="user" name="userName" value=<%out.print(users.get(i).getUserName() );%>></td>
					<td><input type="text" class="user" name="passWord" value=<%out.print(users.get(i).getPassWord() );%>></td>
					<td><input type="submit" class ='btn btn-primary' name="update" value="Update" ></td>
					</form>
					<td><a href='UserServlet?iddelete=<%=users.get(i).getId()%>'> <button class='btn btn-danger'> <i class='fa fa-edit' ></i>Delete</button></a></td>
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
                            <!--End Advanced Tables -->
                            <div class="panel-body">
                                <button class="btn btn-primary btn" data-toggle="modal" data-target="#myModalins">
                                    Add New Admin
                                </button>
                                <div class="modal fade" id="myModalins" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title" id="myModalLabel">Add the User name and Password</h4>
                                            </div>
                                            <form action="UserServlet" method="post">
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <label>Add new User name</label>
                                                        <input name="newun"  class="form-control" placeholder="Enter User name">
                                                    </div>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <label>New Password</label>
                                                        <input name="newps"  class="form-control" placeholder="Enter Password">
                                                    </div>
                                                </div>

                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                                                    <input type="submit" name="add" value="Add" class="btn btn-primary">
                                                        </form>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                         
                            </div>
                        </div>
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