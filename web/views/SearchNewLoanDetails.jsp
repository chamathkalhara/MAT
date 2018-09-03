<%--
This form contains the details of a new loan.When employee wants to apply a loan
the payment details,number of months can be checked from this form.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <script src="/MAT/js/jquery.min.js" type="text/javascript"></script>
    <script src="/MAT/js/jquery-migrate-3.0.0.min.js"></script>
    <script src="/MAT/js/main.js"></script>

    <script>
        $(document).ready(function () {
            $('.eno').on('keypress', function (e) {
                if (e.keyCode === 13) {
                    $.ajax({
                        type: "POST",
                        url: "../LoanControllerNew",
                        data: {empId: $('#eno').val(), type: "search2"},
                        success: function (result) {
                            var data = JSON.parse(result);

                            $('#ename').val(data.empName);
                            $('#mmonth').val(data.maxMonth);
                            $('#mamount').val(data.maxAmount);
                        }
                    });
                }
            });

            $('#form').on('submit', function (e) {
                var amount = $('#samount').val();
                var month = $('#smonth').val();

                $('#oamount').val(amount);
                $('#omonth').val(month);
                $('#opayment').val((amount / month).toFixed(2));
            });
        });
    </script>
    <body>

        <div class="body">

            <form onsubmit="return false" method="POST" id="form">
                <div class="row" id="heading_sub">
                    <h2><center>Search New Loan Details</center></h2></div>
                <div class="grid_container">

                    <div class="row">
                        <div class="column_two label_input">
                            <label for="eno"> Enter Employee Number <span class="asterix">*</span> </label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="eno" id="eno" class="eno" required value="EMP">
                        </div>
                        <div class="column_two"></div>
                        <div class="column_two"></div>

                    </div>
                    <hr>
                    <h3>Employee Details</h3>
                    <div class="row">
                        <div class="column_one label_input">
                            <label for="ename"> Employee Name </label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="ename" id="ename">
                        </div>
                        <div class="column_one"></div>
                    </div>

                    <div class="row">
                        <div class="column_one label_input">
                            <label for="mamount"> Maximum Loan Amount   </label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="mamount" id="mamount">
                        </div>
                        <div class="column_one"></div>
                        <div class="column_one label_input">
                            <label for="mmonth"> Maximum No of months for payment  </label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="mmonth" id="mmonth">
                        </div>
                        <div class="column_one"></div>


                    </div>
                </div><hr>
                <div class="grid_container">


                    <div class="row">
                        <div class="column_one label_input">
                            <label for="samount"> Amount of Loan </label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="samount" id="samount" required>
                        </div>
                        <div class="column_one"></div>
                        <div class="column_one label_input">
                            <label for="smonth"> Number of Months  </label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="smonth" id="smonth" required>
                        </div>
                        <div class="column_one"></div>

                    </div>
                    <div class="row">
                        <div class="column_one"></div>
                        <div class="column_two label_input">
                            <input type="submit" value="Search"><br>
                        </div>
                    </div>
                    <hr>
                    <h3>Loan Details</h3>
                    <div class="row">
                        <div class="column_one label_input">
                            <label for="oamount"> Amount of Loan </label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="oamount" id="oamount">
                        </div>
                        <div class="column_one"></div>
                        <div class="column_one label_input">
                            <label for="0month"> Number of Months  </label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="omonth" id="omonth">
                        </div>
                        <div class="column_one"></div>

                    </div>
                    <div class="row">
                        <div class="column_one label_input">
                            <label for="opayment"> Payment </label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="opayment" id="opayment">
                        </div>
                        <div class="column_one"></div>

                        <div class="column_four"></div>

                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
