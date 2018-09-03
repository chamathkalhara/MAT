<%-- 
    Document   : AddLoan
    Created on : Sep 3, 2016, 9:58:21 AM
    Author     : Tajini
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <script src="/MAT/js/main.js"></script>
    <body>

        <div class="body">

            <form action="" method="POST" border="0">

                <h2><center>Search Loan Availability</center></h2>
                <div class="grid_container">
                    <div class="row">
                        <div class="column_one label_input">
                            <label for="search"> Search by <span class="asterix">*</span> </label>
                        </div>
                        <div class="column_two combo_date">
                            <select  id="search" name="search" required>
                                <option>Employee Number</option>
                                <option>Employee Name</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="column_one label_input">
                            <label for="search"> Input <span class="asterix">*</span> </label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="input" id="input" required>
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
        <br><br>
        <hr>
        <br><br>

        <div class="search-body">
            <div class="grid_container">
                <div class="row">
                    <div class="column_one"></div>
                    <div class="column_three label_input">
                        <label for="status"><b>Status of eligibility for taking a new loan</b></label>
                    </div>
                    <div class="column_two">
                        <input type="text" name="status" id="status" disabled="true">
                    </div>
                    <div class="column_two"></div>   
                </div>
            </div><hr align="center" width="90%"><br>


            <form action="" method="POST" border="0" >
                <div class="grid_container">
                    <div class="row">
                        <h3>If not eligible, current loan details</h3>
                    </div>
                    <div class="row">
                        <div class="column_four">
                            <div class="row">
                                <div class="column_two label_input">
                                    <label for="eno">Employee Number</label>
                                </div>
                                <div class="column_three">
                                    <input type="text" name="eno" id="eno" disabled="true"> 
                                </div>
                            </div>

                            <div class="row">
                                <div class="column_two label_input">
                                    <label for="fname">First Name</label>
                                </div>
                                <div class="column_three">
                                    <input type="text" name="fname" id="fname" disabled="true"> 
                                </div>
                            </div>

                            <div class="row">
                                <div class="column_two label_input">
                                    <label for="lname">Last Name</label>
                                </div>
                                <div class="column_three">
                                    <input type="text" name="lname" id="lname" disabled="true"> 
                                </div>
                            </div>

                            <div class="row">
                                <div class="column_two label_input">
                                    <label for="time">Time Period</label>
                                </div>
                                <div class="column_three">
                                    <input type="text" name="time" id="time" disabled="true">
                                </div>
                            </div>

                        </div>




                        <div class="column_three">
                            <div class="row">
                                <div class="column_three label_input">
                                    <label for="lno">Loan Id</label>
                                </div>
                                <div class="column_four">
                                    <input type="text" name="lno" id="lno" disabled="true">
                                </div>
                            </div>

                            <div class="row">
                                <div class="column_three label_input">
                                    <label for="date"> Issued Date</label>
                                </div>
                                <div class="column_four">
                                    <input type="text" name="date" id="date" disabled="true">
                                </div>
                            </div>

                            <div class="row">
                                <div class="column_three label_input">
                                    <label for="amount">Amount</label>
                                </div>
                                <div class="column_four">
                                    <input type="text" name="amount" id="amount" disabled="true">
                                </div>
                            </div>

                            <div class="row">
                                <div class="column_three label_input">
                                    <label for="payment">Payment</label>
                                </div>
                                <div class="column_four">
                                    <input type="text" name="payment" id="payment" disabled="true">
                                </div>
                            </div>

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
