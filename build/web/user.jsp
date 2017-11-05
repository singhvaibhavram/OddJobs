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
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/oddjobs"
     user="root"  password="mohit"/>
 


<sql:query dataSource="${snapshot}" var="result">
SELECT * from job_add where user_id = '<%=session.getAttribute("id")%>';
</sql:query>

<sql:query dataSource="${snapshot}" var="result2">
SELECT job_select.job_id,job_add.name, job_add.price, job_add.category from job_select,job_add where job_taker = '<%=session.getAttribute("id")%>' and job_select.job_id = job_add.id;
</sql:query>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
        <script type="text/javascript" src="<c:url value="/js/jquery-3.1.1.min.js" />"></script>
        
        <style>
            .card {
                /* Add shadows to create the "card" effect */
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
                transition: 0.3s;

            }

            /* On mouse-over, add a deeper shadow */
            .card:hover {
                box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
            }

            /* Add some padding inside the card container */
            .container {
                padding: 2px 16px;
            }
        </style>    
    </head>
    <body>
        <%@include file="header.jsp"%>
        <%
    if ((session.getAttribute("id") == null) || (session.getAttribute("id") == "")) {
%>
You are not logged in<br/>
<a href="login.jsp">Please Login</a>
<%} else {
%>

<h4>Your Given Work</h4>
    <div class="container">
        <c:forEach var="row" items="${result.rows}">
            <div class="card col-md-3">
                <div class="container">
                    <div style="width: 40%; float:left">
                    <h4><b><c:out value="${row.name}"/></b></h4> 
                    <p>${row.category}</p> 
                    </div>
                    <div style="width: 30%; float: end">
                    <p>Rate: ₹ ${row.price}</p>
                </div>
                </div>
                
            </div>
        </c:forEach>
    </div>

<h4>To Do List</h4>
    <div class="container">
        <c:forEach var="row" items="${result2.rows}">
            <div class="card col-md-3">
                <div class="container">
                    <div style="width: 40%; float:left">
                    <h4><b><c:out value="${row.name}"/></b></h4> 
                    <p>${row.category}</p> 
                    </div>
                    <div style="width: 30%; float: end">
                    <p>Rate: ₹ ${row.price}</p>
                </div>
                </div>
                
            </div>
        </c:forEach>
    </div>
<%
    }
%>
        
        <%@include file="footer.jsp"%>
    </body>
</html>
