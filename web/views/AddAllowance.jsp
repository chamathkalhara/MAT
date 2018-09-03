<!--This form adds a new allowance for the system-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <div class="body">
            <form action="CadreController?type=add" method="POST" border="0">
                <h2><center>Add New Allowance</center></h2>
                <div class="grid_container">
                    <div class="row">
                        <div class="column_one label_input"></div>
                        <div class="column_one label_input">
                            <label for="alwid">Allowance ID<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="alwid" id="alwid" required placeholder="Enter Allowance Id here" >
                        </div>
                        <div class="column_five"></div>
                    </div>
                    <div class="row">
                        <div class="column_one label_input"></div>
                        <div class="column_one label_input">
                            <label for="alwname">Allowance Name<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="alwname" id="alwname" required placeholder="Enter Allowance name">
                        </div>
                        <div class="column_five"></div>
                    </div>


                    <div class="row">
                        <div class="column_one label_input"></div>
                        <div class="column_one label_input">
                            <label for="alwid">Description</label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="alwdesc" id="alwdesc"  placeholder="Enter Description here" >
                        </div>
                        <div class="column_five"></div>
                    </div>
                    <div class="row">
                        <div class="column_one label_input"></div>
                        <div class="column_one label_input">
                            <label for="alwname">Allowance Name<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <input type="number" name="alwname" min="0" id="alwname" required placeholder="Enter Amount here">
                        </div>
                        <div class="column_five"></div>
                    </div>

                    <div class="row">
                        <div class="column_one label_input"></div>
                        <div class="column_two">
                            <p> <b> <span class="asterix">*</span> indicates required fields</b></p>
                        </div>
                        <div class="column_six"></div>   
                    </div>


                    <div class="row">
                        <div class="column_one"></div>
                        <div class="column_two">
                            <input type="submit" value="Add Allowance Details">
                        </div>
                        <div class="column_five"></div>
                    </div>
                </div>

            </form>
        </div>
    </body>
</html>
