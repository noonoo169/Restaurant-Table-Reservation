<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>   
<html>   
<head>  
<meta charset="ISO-8859-1">  
<title> Login Page </title>  
<style>   
    Body {  
    font-family: Calibri, Helvetica, sans-serif;  
    background-color: pink;  
    }  
    button {   
        background-color: #4CAF50;   
        width: 100%;  
        color: orange;   
        padding: 15px;   
        margin: 10px 0px;   
        border: none;   
        cursor: pointer;   
        }   
    form {   
            border: 3px solid #f1f1f1;   
        }   
    input[type=text], input[type=password] {   
            width: 100%;   
            margin: 8px 0;  
            padding: 12px 20px;   
            display: inline-block;   
            border: 2px solid green;   
            box-sizing: border-box;   
        } 
    input[type=submit], input[type=button]{
        background-color: #4CAF50;   
        width: 45%;  
        color: black;   
        padding: 15px;   
        margin: 10px 0px;   
        border: none;   
        cursor: pointer; 
    } 
    input[type=button]{
        float: right;
    }
    input[type=submit]:hover, input[type=button]:hover {   
            opacity: 0.7;   
        }   
    .container {   
            padding: 25px;   
            background-color: lightblue;  
        }   
</style>   
<script>

    function reset(){
            document.f1.user.value = "";
            document.f1.pass.value = "";
        }
</script>
</head>    
<body>    
    <center> <h1>Restaurant Reservation Admin</h1> </center>   
    <form action="../AdminLoginServlet" method="post">  
        <div class="container">   
            <label>Username: </label>   
            <input type="text" placeholder="Enter Username" name="userName" required>  
            <label>Password : </label>   
            <input type="password" placeholder="Enter Password" name="passWord" required>  
            <input type="submit" name="s1" value="OK" >
            <input type="button" name="r1" value="Reset" onclick="reset()">
        </div>   
    </form>     
</body>     
</html>  