<%-- 
    Document   : login
    Created on : 10 Nov, 2016, 6:26:37 PM
    Author     : MOhit Sharma
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="oddjobs.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="oddjobs.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
        <script type="text/javascript" src="<c:url value="/js/jquery-3.1.1.min.js" />"></script>

    </head>
    <body>
        <%@include file="header.jsp" %>
        <br>
        <br>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/oddjobs"
     user="root"  password="mohit"/>
<div class="container" style="background-color: #745898;padding: 5px;margin-bottom: 10px">
<form method="post" action="login1.jsp">
            <center>
            <div class="form-group">
              <label class="col-sm-2 control-label">Email</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="uname"   placeholder="Email" style="width: 500px" required>
              </div>
            </div>
                
             <div class="form-group">
              <label class="col-sm-2 control-label">Password</label>
              <div class="col-sm-10">
                <input type="password" class="form-control" name="pass"   style="width: 500px" required>
              </div>
            </div>
                <br>
                <br>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10" style="margin-top: 50px;">
                <button type="submit" name="submit" value="Login" class="btn btn-default">Submit</button>
                &nbsp;&nbsp;
                <button type="reset" class="btn btn-default">Reset</button>
              </div>
            </div>
            
            
            </center>
    
        </form>
</div>
    <center><p><a href="<c:url value="/register.jsp" />">Not A Member ?</a></p></center>
<% String name= request.getParameter("submit");
   if(name != null){
        if(name.equals("Submit")){
             
             String email1 = request.getParameter("email");
             String password1 = request.getParameter("password");
             out.print(email1); 
             
        }
    }
%>
<c:if test="${email1}">
<sql:query dataSource="${snapshot}" var="result">
SELECT * from user where email = ${email1} and password = ${password1};
</sql:query>

</c:if>

<c:forEach var="row" items="${result.rows}">
<tr>
   .
   
   <td><c:out value="${row.name}"/></td>
   <td><c:out value="${row.permission}"/></td>
</tr>
</c:forEach>
        <%@include file="footer.jsp"%>
    </body>
</html>
