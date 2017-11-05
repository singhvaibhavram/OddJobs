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
     url="jdbc:mysql://localhost/emp"
     user="root"  password="mohit"/>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Jobs</title>
        <link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">
        <script type="text/javascript" src="<c:url value="/js/jquery-3.1.1.min.js" />"></script>
    </head>
    
        <%@include file="header.jsp"%>

        <%
            
            if(session.getAttribute("id") == null) {
                response.sendRedirect(".");
            }
            
            if(request.getParameter("submit") != null) {
                
                Job job = new Job();
                job.setName(request.getParameter("job_title"));
                job.setCategory(request.getParameter("category"));
                job.setPrice(Integer.parseInt(request.getParameter("price")));
                job.setDescription(request.getParameter("description"));
                job.setStart_date(request.getParameter("start_date"));
                job.setEnd_date(request.getParameter("end_date"));
                
                //out.println(job.getDescription());
                
                Class.forName("com.mysql.jdbc.Driver");
            try {
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost/oddjobs","root","mohit");
               Statement statement = con.createStatement();
               String sql = "Insert into job_add(name,category,description,user_id,start_date,end_date,price) values('"
                       + job.getName() + "','"
                       + job.getCategory() + "','"
                       + job.getDescription() + "',"
                       + session.getAttribute("id") + ",'"
                       + job.getStart_date() + "','"
                       + job.getEnd_date() + "',"
                       + job.getPrice()
                       + ")";
               statement.executeUpdate(sql);
               
               response.sendRedirect("user.jsp");
               
            } catch (SQLException ex) {
                out.print(ex.toString());
            }
                
            }else{
               // out.println("Form Not Submited Yet");
            }
        
        %>

      
        
        <!-- Start Your Code From Here -->
        <div class="container" style="background-color: #745898;padding: 5px;margin-bottom: 10px">
                <center><h2>Add Job</h2></center>
                <br>
          <form class="form-horizontal" action="add_job.jsp" method="post">
            <div class="form-group">
              <label class="col-sm-2 control-label">Job Title</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="job_title"   placeholder="Job Title" style="width: 500px" required>
              </div>
            </div>
              
            <div class="form-group">
              <label class="col-sm-2 control-label">Price</label>
              <div class="col-sm-10">
                <input type="number" class="form-control" name="price"   placeholder="Price" style="width: 500px" required>
              </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" style="margin-right: 15px" >Select Category</label>
                <select class="form-control" name="category" style="width: 500px" required>
                  <option value="Not Available">Not Available</option>
                  <option value="plumbing">Plumbing</option>
                  <option value="electrician">Electrician</option>
                  <option value="mechanic">Mechanic</option>
                  <option value="painter">Painter</option>
                  <option value="transporter">Transporter</option>
                </select>
            </div>

            <div class="form-group">
              <label class="col-sm-2 control-label">Description</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="description" style="width: 500px"   placeholder="Description">
              </div>
            </div>
              
            <div class="form-group">
              <label class="col-sm-2 control-label">Start Date</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="start_date" style="width: 500px"   placeholder="Start Date(yyyy-mm-dd)">
              </div>
            </div>
              
            <div class="form-group">
              <label class="col-sm-2 control-label">End Date</label>
              <div class="col-sm-10">
                  <input type="text" class="form-control" name="end_date" style="width: 500px"   placeholder="End Date(yyyy-mm-dd)">
              </div>
            </div>

            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" name="submit" value="submit" class="btn btn-default">Add Job</button>
              </div>
            </div>
          </form>
        </div>
  
        
        <!--Scripts-->
        
        <%@include file="footer.jsp"%>
    
</html>
