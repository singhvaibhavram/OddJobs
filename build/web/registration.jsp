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
<%@ page import ="java.sql.*" %>
<%
    String phone = request.getParameter("phone");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/oddjobs",
            "root", "mohit");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into user(name,email,password,phone,permission) values ('" + fname + "','" + email + "','" + pwd + "','"+phone+ "', '0')");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("login.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("index.jsp");
    }
%>