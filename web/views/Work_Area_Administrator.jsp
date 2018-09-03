<%-- 
    Document   : Work_Area
    Created on : 27-Oct-2016, 08:57:03
    Author     : Asus
--%>

<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <title></title>
    <link rel="stylesheet" href="/MAT/fonts/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/MAT/css/stylesheet.css" />
    <script src="/MAT/js/jquery.min.js" type="text/javascript"></script>
    <script src="/MAT/js/jquery-migrate-3.0.0.min.js"></script>
    <script src="../js/main.js"></script>

</head>


<body class="body_font body_structure">

    <%
        HttpSession session1 = request.getSession();
        String curForm = (String) session1.getAttribute("curForm");

        UserDTO user = (UserDTO) session1.getAttribute("user");
        String s[] = user.getUser_Level().split(" ");
        if (s.length == 2) {
            session1.setAttribute("curForm", "Dashboard_" + s[0] + "_" + s[1] + ".jsp");
        } else {
            session1.setAttribute("curForm", "Dashboard_" + user.getUser_Level() + ".jsp");
        }
    %>

    <div class="grid_container" >
        <div class="row header_row" id="header">
        </div>
        <div class="row">
            <div class="column_one" id="Navigation_Bar">

            </div>
            <div class="column_seven page_navigation_heading" >

                <div class="row " id="work_arena">
                    <script>

                        jQuery(function () {
                            $("#work_arena").load('<%=curForm%>');
                        });

                    </script>
                </div>

            </div>
        </div>
    </div>
</body>
</html>