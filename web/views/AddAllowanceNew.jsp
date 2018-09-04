

<%@page import="service.AllowanceService"%>
<%@page import="dto.AllowanceDTO"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
    </head>
    <body>
    
        <div class="body">

            
            
            <form action="../AllowanceController?type=add" method="POST">
                <div class="row" id="heading_sub">
                    <h2>Add New Allowance</h2></div>

                <div class="grid_container">
                    <div class="row">
                        
                        <%  Connection connection = new DBConnection().getConnection();
                            AllowanceService allowanceService = new AllowanceService();
                            String newId = allowanceService.getNewId(connection);
                        %>
                        <div class="column_two label_input">
                            <label for="ano">Allowance ID<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                           <input type="text" value='<%=newId%>' name="ano" id="ano" readonly>
                        </div>
                        <div class="column_five"></div>
                    </div>
                    <div class="row">
                        <div class="column_two label_input">
                            <label for="name">Name<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="name" id="name" required placeholder="Enter allowance name">
                        </div>
                            <div class="column_five"></div>
                    </div>
                        
                    <div class="row">
                        <div class="column_two label_input">
                            <label for="des">Description<span class="asterix">*</span> </label>
                        </div>
                        <div class="column_four">
                            <textarea rows="6" cols="50" type="text" name="des" id="des" placeholder="Description"></textarea>
                        </div>
                        <div class="column_three"></div>
                    </div>
                        
                    <div class="row">
                        <div class="column_two label_input">
                            <label for="amount">Amount<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="amount" id="amount" placeholder="Enter amount">
                        </div>
                            <div class="column_five"></div>
                    </div>
                        <br>
                    <div class="row">
                        <div class="column_two">
                            <p> <b> <span class="asterix">*</span> indicates required fields</b></p>
                        </div>
                        <div class="column_six"></div>   
                    </div>
                
                    <input type="hidden" name="type" value="add">
                    <div class="row">
                        <div class="column_two"></div>
                        <div class="column_two">
                            <input type="submit" value="Add Details">
                        </div>
                        <div class="column_five"></div>
                    </div>
                </div>
                
            </form>
        </div>
    </body>
</html>
