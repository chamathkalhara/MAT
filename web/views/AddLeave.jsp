

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div class="grid_container">
            <div class="row" id="heading_sub">
                <h2>Add Leave Details</h2>
            </div>
            <div class="row">
                <div class="column_four">
                    <div class="row">
                        <div class="column_one label_input"></div>
                        <div class="column_three label_input">
                            <label for="enumb">Employee Number <span class="asterix">*</span>  </label>
                        </div>


                        <div class="column_four">
                            <input type="text" name="enumb" id="enumb" value="EMP" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="column_one label_input"></div>
                        <div class="column_three label_input">
                            <label for="fullname">Name <span class="asterix">*</span> </label>
                        </div>

                        <div class="column_four">
                            <input  type="text" name="fullname" id="fullname"  pattern="[a-zA-Z]+" placeholder="Enter First Name here">        
                        </div>
                    </div>

                    
                    <div class="row">
                        <div class="column_one label_input"></div>
                        <div class="column_three label_input">
                            <label for="idate"> Informed Date <span class="asterix">*</span> </label>
                        </div>
                        <div class="column_four">
                             <input type="date" name="idate" id="idate" required width="80" class="combo_date">
                        </div>
                    </div>
                    <div class="row">
                        <div class="column_one label_input"></div>
                        <div class="column_three label_input">
                            <label for="rdate"> Requested Date <span class="asterix">*</span> </label>
                        </div>
                        <div class="column_four">
                             <input type="date" name="rdate" id="rdate" required width="80" class="combo_date">
                        </div>
                    </div>
                    <div class="row">
                        <div class="column_one label_input"></div>
                        <div class="column_three label_input">
                            <label for="ltype"> Leave Type <span class="asterix">*</span> </label>
                        </div>
                        <div class="column_four">
                            <input type="radio" name="ltype" id="ltype" value="Half Day"  checked> Half Day
                            <input type="radio" name="ltype" id="ltype" value="Full Day"> Full Day
                        </div>
                    </div>
                    <div class="row">
                        <div class="column_one label_input"></div>
                        <div class="column_three label_input">
                            <label for="reason"> Reason <span class="asterix">*</span> </label>
                        </div>
                        <div class="column_four">
                            <input  type="text" name="reason" id="reason" >
                        </div>
                    </div><br>
                    <div class="row"> 
                        <div class="column_one label_input"></div>
                        <div class="column_three">
                            <p> <b> <span class="asterix">*</span> indicates required fields</b></p>
                        </div>
                        <div class="column_two"><input type="submit" value="Submit"></div>
                        <div class="column_three"></div>

                    </div>

                </div>
            </div> 
        </div>

    </body>
</html>
