<%-- 
    Document   : ReceptionistLoanAvailability
    Created on : 20-Sep-2016, 04:22:56
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../includes/header1.jsp"%>
    <script src="/MAT/js/main.js"></script>
    <body>
        <%@include file="../includes/navigations/ReceptionistNavigation.jsp"%><br><br>
        <div class="body">

            <form action="" method="POST" border="0">

                <div class="grid_container">
                    <div class="row"><h3>Search from Employee Number or Name</h3>
                    </div>
                    <div class="row">
                        <div class="column_two label_input">
                            <label for="eno">Employee Number</label>
                        </div>
                        <div class="column_three">
                            <input type="text" name="eno" id="eno">
                        </div>
                        <div class="column_two"></div>   
                    </div>
                    
                    <div class="row"><p>OR</p></div>
                    
                    <div class="row">
                        <div class="column_two label_input">
                            <label for="name">Employee Name</label>
                        </div>
                        <div class="column_three">
                            <input type="text" name="name" id="name">
                        </div>
                        <div class="column_three"></div>   
                    </div><br>
                    <div class="row">
                        <div class="column_two"></div>
                        <div class="column_two">
                            <input type="submit" value="Search" class="delete">
                        </div>
                        <div class="column_four"></div>
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

            <span class="heading">If not eligible, current loan details</span><br><br>
            <form action="" method="POST" border="0" >
                <div class="grid_container">
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
                                <div class="column_four combo_date">
                                    <input type="date" name="date" id="date" disabled="true">
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
                        <div class="column_two">
                            <input type="button" value="Update" id="updatebtn" onclick="changeValue()">
                        </div>
                        <div class="column_two"></div> 
                        <div class="column_two">
                            <input type="submit" value="Delete">
                        </div>
                        <div class="column_two"></div>   
                    </div>
                </div>

                <hr width="100%">
                <br>

            </form>
        </div>
    </body>
</html>
