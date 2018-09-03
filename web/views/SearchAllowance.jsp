<%-- 
    Document   : SearchAllowance
    Created on : 04-Sep-2016, 16:50:31
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../includes/header1.jsp"%>
    <script src="/MAT/js/main.js"></script>
    <body>
        
        <div class="body">

            <form action="" method="POST" border="0">

                <h2><center>Search Allowances</center></h2>
                <div class="grid_container">

                    <div class="row">
                        <div class="column_one label_input">
                            <label for="alw_id"> By Allowance ID </label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="alwid" id="alwid">
                        </div>
                    </div>
                    <div class="row">
                        <div class="column_one label_input">
                            <label for="alw_name"> By Allowance Name </label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="alwname" id="alwname" >
                        </div>
                    </div>
                    <div class="row">
                        <div class="column_one"></div>
                        <div class="column_two label_input">
                            <input type="submit" value="Search"><br>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <br>
        <hr>
        <br><br>

        <div class="search-body">

            <form action="" method="POST" border="0" >
                <div class="grid_container">


                    <div class="row">
                        <div class="column_one label_input">
                            <label for="alw_idr">Allowance ID</label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="alwidr" id="alwidr" disabled="true"> 
                        </div>
                    </div>   


                    <div class="row">
                        <div class="column_one label_input">
                            <label for="alw_namer">Allowance name</label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="alwnamer" id="alwnamer" disabled="true">
                        </div>
                    </div>

                    <div class="row">
                        <div class="column_one label_input">
                            <label for="desc">Description</label>
                        </div>
                        <div class="column_four">
                            <input type="text" name="descr" id="descr" disabled="true">
                        </div>
                    </div


                    <div class="row">

                        <div class="column_one label_input">
                            <label for="alw_amnt">Amount</label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="alw_amntr" id="alw_amntr" disabled="true">
                        </div>
                    </div>


                    <br>
                    <div class="row">
                        <div class="column_one"></div>
                        <div class="column_two">
                            <input type="button" value="Update" id="updatebtn" onclick="changeValue()">
                        </div>

                        <div class="column_two">
                            <input type="submit" value="Delete">
                        </div>

                    </div>
                </div>

                <hr width="100%">
                <br>

            </form>
        </div>
    </body>
</html>
