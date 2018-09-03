

<%@page import="dto.UserDTO"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="dto.UserProfileInfoDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>

        <script src="/MAT/js/jquery.min.js"></script>
        <script src="../js/LoadContent.js"></script>
    </head>
    <body class="body_font nav_font">
        <div class="grid_container">
            <ul class="nav_bar">
                <div class="row user_information">
                    <div class="column_four">


                        <%
                            HttpSession session1 = request.getSession();
                            UserProfileInfoDTO userProfileInfoDTO = (UserProfileInfoDTO) session1.getAttribute("profile");
                            UserDTO user = (UserDTO) session1.getAttribute("user");
                            Blob img = userProfileInfoDTO.getPhoto();
                            byte[] imgData = img.getBytes(1, (int) img.length());
                            String imgDataBase64 = new String(Base64.getEncoder().encode(imgData));
                        %>
                        <img src="data:image/gif;base64,<%= imgDataBase64%>" alt="images Here" class="nav_bar_image">



                    </div>

                    <div class="column_four user_position">

                        <%= user.getUserID()%> <br>
                        Director

                    </div>
                </div>
                <div class="row home_li">
                    <div class="column_eight">
                        <li id="home"><a href="Work_Area_Administrator.jsp">
                                <i class="fa fa-home fa-fw" ></i>Home</a></li>
                    </div>
                </div> 
                <div class="row li_alignment">
                    <div class="column_eight">
                        <li><a href="" id="sys_settings"><i class="fa fa-cogs fa-fw" ></i>	System Settings</a></li>
                    </div>
                </div>
                <div class="row li_alignment">
                    <div class="column_eight">
                        <li><a href="" id="sys_users"><i class="fa fa-users  fa-fw" ></i>     System Users</a></li>
                    </div>
                </div>
            </ul>
        </div>





    </body>
</html>