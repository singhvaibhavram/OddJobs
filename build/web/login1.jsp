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
        <%@ page import ="java.sql.*" %>
<%
    String email = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/oddjobs",
            "root", "mohit");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from user where email='"+ email + "' and password='" + pwd + "'");
    if (rs.next()) {
        int id = rs.getInt(1);
        String name = rs.getString("name");
        session.setAttribute("id",id );
        session.setAttribute("name",name);
        //out.println("welcome " + email);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("user.jsp");
    } else {
        out.println("Invalid password <a href='login.jsp'>try again</a>");
    }
%>
        
        <%@include file="footer.jsp"%>
    </body>
</html>
