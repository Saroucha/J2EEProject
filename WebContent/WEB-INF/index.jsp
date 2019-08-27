<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><title>
        <link href="css/main.css" rel="stylesheet" type="text/css">
    </head>
    
    <body>
        
        <div class="main"> 
            <center>
                <h1><a href="add.jsp"></a></h1> 
            </center>
  
            <table>    
                
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Prenom</th>
                    <th>email</th>
                    <th>password</th>
                    <th>role</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <%
                    String url="jdbc:mysql://localhost:3306/gestionsalle"; //database connection url string
                    String username="root"; //database connection username
                    String password=""; //database password
                  
                try
                {
                    Class.forName("org.mariadb.jdbc.Driver"); //load driver
                    Connection con=DriverManager.getConnection(url,username,password); //create connection
                  
                    PreparedStatement pstmt=null; //create statement
                  
                    pstmt=con.prepareStatement("select * from utilisateur"); //sql select query
                    ResultSet rs=pstmt.executeQuery(); //execute query and set in ResultSet object rs.
                    
                    while(rs.next())
                    {
                %>
                <tr>
                    <td><%=rs.getInt("id_U")%></td>
                    <td><%=rs.getString("Nom")%></td>
                    <td><%=rs.getString("Prenom")%></td>
                    <td><%=rs.getString("email")%></td>
                    <td><%=rs.getString("password")%></td>
                    <td><%=rs.getString("role")%></td>
                    
                    <td><a href="EditUser.jsp?edit_id=<%=rs.getInt("id_U")%>">Edit</a></td>
                    <td><a href="deleteUser.jsp?delete_id=<%=rs.getInt("id_U")%>">Delete</a></td>
                    
               </tr>
                <%
                    }
                    
                    pstmt.close(); //close statement

                    con.close(); //close connection
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
                %>
            </table>
  
            <center>
                <h3 style="color:green;">
                <%
                    if(request.getAttribute("InsertSuccessMsg")!=null)
                    {
                        out.println(request.getAttribute("InsertSuccessMsg")); //get record insert success message from AddController.java
                    }
                %>
                
                <%
                    if(request.getAttribute("UpdateSuccessMsg")!=null)
                    {
                        out.println(request.getAttribute("UpdateSuccessMsg")); //get record update success message from EditController.java
                    }
                %>
                </h3>
            </center>
            
 </div>
            
    </body>
   
</html>