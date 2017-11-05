<%-- 
    Document   : template
    Created on : 11 Nov, 2016, 1:15:41 PM
    Author     : MOhit Sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="oddjobs.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
        <script type="text/javascript" src="<c:url value="/js/jquery-3.1.1.min.js" />"></script>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <!-- Start Your Code From Here -->
        <div class="container" style="background-color: #745898;padding: 5px;margin-bottom: 10px">
        <form method="post" action="registration.jsp">
            <center>
                
            <div class="form-group">
              <label class="col-sm-2 control-label">Name</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="fname"   placeholder="name" style="width: 500px" required>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label">Email</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="email"   placeholder="Email" style="width: 500px" required>
              </div>
            </div>
                
            <div class="form-group">
              <label class="col-sm-2 control-label">Password</label>
              <div class="col-sm-10">
                <input type="password" class="form-control" name="pass"   style="width: 500px" required>
              </div>
            </div>
                
            <div class="form-group">
              <label class="col-sm-2 control-label">Phone</label>
              <div class="col-sm-10">
                <input type="number" class="form-control" name="phone"   placeholder="Phone" style="width: 500px" required>
              </div>
            </div>
                
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10" style="margin-top: 50px;">
                <button type="submit" name="submit" value="Submit" class="btn btn-default">Submit</button>
                <button type="reset" class="btn btn-default">Reset</button>
              </div>
            </div>
                
           
            
            </center>
        </form>
        </div>
    <center><p>Already registered!! <a href="login.jsp">Login Here</a></p></center>
        
        <!--Scripts-->
        
        <%@include file="footer.jsp"%>
    </body>
</html>





