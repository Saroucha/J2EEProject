<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Java MVC Add, Edit, Delete Using JSP & Servlet With MySQL</title>
        <link href="css/main.css" rel="stylesheet" type="text/css">
        <script type="text/javascript"> 
        function validate()
        {
          
            var name = document.getElementById("nom"); //get textbox id "name" and store in "name" variable
            var prenom = document.getElementById("prenom"); //get textbox id "name" and store in "name" variable
            var email = document.getElementById("email"); //get textbox id "name" and store in "name" variable
            var password = document.getElementById("password"); //get textbox id "name" and store in "name" variable
            var role = document.getElementById("role"); //get textbox id "name" and store in "name" variable
            
            
        }
       </script> 

    </head>
    <body>
        <div class="main">
            <center>
             <h1>Update Record</h1>
            </center>
  
        <form method="post" action="EditUser" onsubmit="return validate();">
                
            <table>         
            <%
            if(request.getParameter("edit_id")!=null) //get edit_id from index.jsp page with href link and check not null after continue
            {
                int id=Integer.parseInt(request.getParameter("edit_id")); //get edit_id store in "id" variable
                
                String url="jdbc:mysql://localhost:3306/gestionsalle"; //database connection url string
                String username="root"; //database connection username
                String password=""; //database password
                
                try
                {
                    Class.forName("org.mariadb.jdbc.Driver"); //load driver
                    Connection con=DriverManager.getConnection(url,username,password); //create connection
                    
                    PreparedStatement pstmt=null; //create statement
                    
                    pstmt=con.prepareStatement("select * from utilisateur where id_U=?"); //sql select query 
                    pstmt.setInt(1,id);
                    ResultSet rs=pstmt.executeQuery(); //execute query and set in Resultset object rs.
                    
                    while(rs.next())
                    {
            %>    
                <tr>
                    <td>Nom</td>
                    <td><input type="text" name="txt_name" id="name" value="<%=rs.getString("nom")%>"></td>
                </tr>
    
                <tr>
                    <td>Prenom</td>
                    <td><input type="text" name="txt_prenom" id="prenom" value="<%=rs.getString("prenom")%>"></td>
                    
                </tr> 
                
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="txt_email" id="email" value="<%=rs.getString("email")%>"></td>
                    
                </tr> 
                
                <tr>
                    <td>password</td>
                    <td><input type="password" name="txt_password" id="password" value="<%=rs.getString("password")%>"></td>
                    
                </tr> 
                
                <tr>
                    <td>Role</td>
                    <td><input type="text" name="txt_Role" id="role" value="<%=rs.getString("role")%>"></td>
                    
                </tr> 
    
                <tr>
                    <td><input type="submit" name="btn_edit" value="Update"></td> 
                </tr>
                
                    <input type="hidden" name="hidden_id" value="<%=rs.getInt("id")%>">
            <%
                    }
                    
                    pstmt.close(); //close statement

                    con.close(); //close connection
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            %>
            </table>
             
            <center>
                <h3 style="color:red;">
                    <%
                        if(request.getAttribute("UpdateErrorMsg")!=null)
                        {
                            out.print(request.getAttribute("UpdateErrorMsg")); //get update record fail error message from EditController.java
                        }
                    %>
                </h3>
                
                <h1><a href="index.jsp">Back</a></h1>
            </center>
    
        </form>
  
 </div>

    </body>
</html>
