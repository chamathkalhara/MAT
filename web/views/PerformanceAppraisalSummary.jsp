<%-- 
    Document   : PerformanceAppraisalSummary
    Created on : Jan 14, 2017, 9:17:14 PM
    Author     : sashika
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <body>

        <div class="body">
            <form action="" method="POST" border="0">

                <div class="row" id="heading_sub">
                    <h1><center>Performance Appraisal Overall Summery</center></h1></div><br>
                <div class="grid_container">

                    <div class="row">
                        <div class="column_two label_input">
                            <label for="year"><b>Year of Assessment<span class="asterix">*</span> </b></label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="year" id="year" required ><br>

                        </div>
                        <div class="column_four"></div>
                    </div>

                    <div class="row">
                        <div class="column_one label_input">
                            <label for="pseno">Employee No<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="pseno" id="pseno" required>
                        </div>
                        <div class="column_one"></div>
                        <div class="column_one label_input">
                            <label for="psename">Name</label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="psename" id="psename" >
                        </div>
                        <div class="column_one"></div>
                    </div>

                    <div class="row">
                        <div class="column_one label_input">
                            <label for="midid">Mid Appraisal ID<span class="asterix">*</span> </b</label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="midid" id="midid" required ><br>
                        </div>
                        <div class="column_one"></div>
                        <div class="column_one label_input">
                            <label for="endid">End Appraisal ID<span class="asterix">*</span> </label>
                        </div>
                        <div class="column_two adjust">
                            <input type="text" name="endid" id="endid" required ><br>
                        </div>
                        <div class="column_one"></div>

                    </div>

                </div>


                <table>
                    <tr>
                        <th></th>
                        <th>Marks Allocated</th>
                        <th>Achievement</th>
                    </tr>

                    <tr>
                        <td>Performance Objectives (VBS based on this)</td>
                        <td>55</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Performance Factor</td>
                        <td>30</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Core Values</td>
                        <td>15</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Overall Achievement</td>
                        <td>100</td>
                        <td></td>
                    </tr>  
                </table>

                <h2><b>Overall Rating for Salary Increment</b></h2>

                <table>
                    <tr>

                        <th>Poor</th>
                        <th>Development</th>
                        <th>Meet Expectation</th>
                        <th>Exceed Expectation</th>
                        <th>Out standing</th>                    
                    </tr>

                    <tr>
                        <td>(0 – 40)No increase</td>
                        <td>>(41 – 60)Low increase</td>
                        <td>(61 – 75)Average increase</td>
                        <td>(76 – 90)High increase</td>
                        <td>(91 – 100)Merit increase</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="overallrating" id="overallrating" value="No increase" checked></td>
                        <td><input type="radio" name="overallrating" id="overallrating" value="Low increase" ></td>
                        <td><input type="radio" name="overallrating" id="overallrating" value="Average increase" ></td>
                        <td><input type="radio" name="overallrating" id="overallrating" value="High increase" ></td>
                        <td><input type="radio" name="overallrating" id="overallrating" value="Merit increase" ></td>
                    </tr>                
                </table><br>
                <table>
                    <tr>

                        <th colspan="1">Current</th>
                        <th colspan="2">Promotion</th>
                        <th colspan="1">(If Yes) Recommendations </th>

                    </tr>
                    <tr>

                        <th>Designation</th>
                        <th>Yes</th>
                        <th>No</th>
                        <th>Designation</th>
                    </tr>                                
                    <tr>
                        <td></td>
                        <td><input type="radio" name="promotion" id="promotion" value="Yes" ></td>
                        <td><input type="radio" name="promotion" id="promotion" value="No" ></td>
                        <td></td>
                    </tr>                
                </table><br>

                <br>
                <div class="grid_container">
                    <div class="row"> 

                        <div class="column_two"></div>
                        <div class="column_two"><input type="submit" value="Submit"></div>
                        <div class="column_four"></div>

                    </div>

                </div>
            </form>
        </div>
    </body>
</html>



