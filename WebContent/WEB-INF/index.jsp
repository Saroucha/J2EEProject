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
                    String url="jdbc:mysql://localhost:3306/gestionsalle"; 
                    String username="root"; 
                    String password=""; 
                  
                try
                {
                    Class.forName("org.mariadb.jdbc.Driver"); 
                    Connection con=DriverManager.getConnection(url,username,password); 
                  
                    PreparedStatement pstmt=null;
                  
                    pstmt=con.prepareStatement("select * from utilisateur"); 
                    ResultSet rs=pstmt.executeQuery(); 
                    
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
                    
                    pstmt.close(); 

                    con.close(); 
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
                        out.println(request.getAttribute("InsertSuccessMsg"));     }
                %>
                
                <%
                    if(request.getAttribute("UpdateSuccessMsg")!=null)
                    {
                        out.println(request.getAttribute("UpdateSuccessMsg"));  }
                %>
                </h3>
            </center>
            
 </div>
            
    </body>
   
</html>