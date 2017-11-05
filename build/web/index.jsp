<%-- 
    Document   : index
    Created on : 10 Nov, 2016, 4:18:20 PM
    Author     : MOhit Sharma
--%>

<%@page import="oddjobs.DatabaseHelper"%>
<%@page import="oddjobs.User"%>
<%@page import="oddjobs.UserHandler"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="oddjobs.Test" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${pageContext.request.contextPath}">
<!-- Le styles -->
<link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/js/jquery-3.1.1.min.js" />"></script>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/oddjobs"
     user="root"  password="mohit"/>
 
<sql:query dataSource="${snapshot}" var="result">
SELECT * from job_add;
</sql:query>
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
    
    <!--Start Your Code From Here-->
    
    <div class="container">
        <c:forEach var="row" items="${result.rows}">
            <div class="card col-md-3">
              <div class="container">
                <h4><b><c:out value="${row.name}"/></b></h4> 
                <div>
                    <p>${row.category}</p> 
                    <p>Rate: ₹ ${row.price}</p>
                </div>
                
              </div>
            </div>
        </c:forEach>
    </div>
    
    <%@include file="footer.jsp"%>
</body>
</html>
