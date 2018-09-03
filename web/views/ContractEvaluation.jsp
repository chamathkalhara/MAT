<%--The employee contract evaluation is based on this form.This contains all the critirias that should be 
checked in contract renewal.--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>           
<!DOCTYPE html>
<html>

    <body>

        <script src="/MAT/js/jquery.min.js" type="text/javascript"></script>
        <script src="/MAT/js/jquery-migrate-3.0.0.min.js"></script>
        <script src="/MAT/js/main.js"></script>
        <div class="body">
            <form action="" method="POST" border="0">
                <div id="heading_sub">
                    <h2><center>Contract Employee Evaluation</center></h2></div><br>
                        <%--3
                        <div class="heading_inline">
                            <h2>Criteria/instructions</h2><span class="read_more">Read more <i class="fa fa-sort-desc"></i></span>    
                        </div>
                        <div class="instructions">
                            <h2>(01)This evaluation is carried out under 8 performance factors such as</h2><br>
                            <p><b>a. Quantity of work</b></h2>
                            <p>-Consider the results of this employee’s efforts.  Does the employee demonstrate 
                                the ability to manage several responsibilities simultaneously; perform work in a 
                                productive and timely manner; meet work schedules.</p>
                            <p><b>b. Quality of work</b></h2>
                            <p>-Does the employee complete assignments meeting quality standards?  Consider accuracy, 
                                neatness, thoroughness and adherence to standards</p>
                            <p><b>c. Job knowledge</b></h2>
                            <p>-Job knowledge measures employee’s mastery of the concepts needed to perform the work assigned</p>
                            <p><b>d. Attendance and Punctuality</b></p>
                            <p>-Consider work arrival and departure in accordance with departmental and SLC policy and also keep 
                                update superior on taking leave</p>
                            <p><b>e. Leadership</b></p>
                            <p>- consists of the Knowledge/Skills that encompass an understanding of the organization, the external 
                                environment that impacts the organization, and the skills needed to influence, motivate, and challenge 
                                others in the workplace.</p>
                            <p><b>f. Problem solving and analytical thinking</b></p>
                            <p>-Identifies problems; determines accuracy and relevancy of information; uses sound judgment to 
                                generate and evaluate alternatives, and to make recommendations</p>
                            <p><b>g. Team work </b></p>
                            <p>- Encourages and facilitates cooperation, pride, trust and group identity; fosters commitment and team 
                                spirit; works with others to achieve goals; facilitates an open exchange of ideas and fosters an 
                                atmosphere of open communication</p>
                            <p><b>h. Integrity and Ethics</b></p>
                            <p>-Contributes to maintaining the integrity of the organization; displays high standards of ethical conduct; 
                                and appreciates the impact of violating these standards on the organization, self, and others </p><br>
                            <h2>(02) The following rating scale guide is being provided to assist the evaluator in assigning the most 
                                appropriate measurement of the employees’ performance factors and behavioral traits.</h2><br>

                    <p><b>1. Unacceptable </b>- Consistently fails to meet job requirements; performance clearly below 
                        minimum requirements.  Immediate improvement required to maintain employment.</p>
                    <p><b>2. Needs Improvement</b>– Occasionally fails to meet job requirements; performance must 
                        improve to meet expectations of position.</p>
                    <p><b>3. Meets Expectations</b>– Able to perform 100% of job duties satisfactorily.  
                        Normal guidance and supervision are required.</p>
                    <p><b>4. Exceeds Expectations</b>– Frequently exceeds job requirements; all planned objectives 
                        were achieved above the established standards and accomplishments were made in unexpected areas as well.</p>
                    <p><b>5. Superior</b>– Consistently exceeds job requirements; this is the highest level of 
                        performance that can be attained.</p><br>--%>



                <div class="grid_container">

                    <div class="row">
                        <div class="column_one label_input">
                            <label for="ceno">Contract Evaluation ID<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="ceno" id="ceno" required>
                        </div>
                        <div class="column_one"></div>

                        <div class="column_one">
                            <label id="dateapp">Date of Evaluation<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two ">
                            <input type="date" name="dateapp" id="dateapp" required width="80" class="combo_date" required>
                        </div>
                        <div class="column_one"></div>
                    </div>


                    <div class="row">
                        <div class="column_one label_input">
                            <label for="eno">Employee ID<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="eno" id="eno" required="">
                        </div>
                        <div class="column_one"></div>
                        <div class="column_one label_input">
                            <label for="ename">Employee Name</label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="ename" id="ename">
                        </div>

                    </div>

                    <div class="row">
                        <div class="column_one label_input">
                            <label for="crd">Cadre</label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="crd" id="crd">
                        </div>
                        <div class="column_one"></div>
                        <div class="column_one">
                            <label id="dept">Department</label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="dept" id="dept">
                        </div>
                        <div class="column_one"></div>    
                    </div>


                </div>
                <br>
                <table>
                    <tr>
                        <th></th>
                        <th>Criteria</th>
                        <th colspan="5">Standards (Please select the appropriate score, 5 is the highest score)</th>

                    </tr>
                    <tr>
                        <th></th>
                        <th></th>
                        <th>1</th>
                        <th>2</th>
                        <th>3</th>
                        <th>4</th>
                        <th>5</th>
                    </tr>

                    <tr>
                        <td>1</td>
                        <td>Quantity of Work</td>
                        <td><input type="radio" name="tick1"  checked></td>
                        <td><input type="radio" name="tick1"></td>
                        <td><input type="radio" name="tick1"></td>
                        <td><input type="radio" name="tick1"></td>
                        <td><input type="radio" name="tick1"></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Quality of Work</td>
                        <td><input type="radio" name="tick2"  checked></td>
                        <td><input type="radio" name="tick2"></td>
                        <td><input type="radio" name="tick2"></td>
                        <td><input type="radio" name="tick2"></td>
                        <td><input type="radio" name="tick2"></td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Job Knowledge</td>
                        <td><input type="radio" name="tick3"  checked></td>
                        <td><input type="radio" name="tick3"></td>
                        <td><input type="radio" name="tick3"></td>
                        <td><input type="radio" name="tick3"></td>
                        <td><input type="radio" name="tick3"></td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>Attendance and Punctuality</td>
                        <td><input type="radio" name="tick4"  checked></td>
                        <td><input type="radio" name="tick4"></td>
                        <td><input type="radio" name="tick4"></td>
                        <td><input type="radio" name="tick4"></td>
                        <td><input type="radio" name="tick4"></td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>Leadership</td>
                        <td><input type="radio" name="tick5"  checked></td>
                        <td><input type="radio" name="tick5"></td>
                        <td><input type="radio" name="tick5"></td>
                        <td><input type="radio" name="tick5"></td>
                        <td><input type="radio" name="tick5"></td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td>Problem solving and Analytical thinking</td>
                        <td><input type="radio" name="tick6"  checked></td>
                        <td><input type="radio" name="tick6"></td>
                        <td><input type="radio" name="tick6"></td>
                        <td><input type="radio" name="tick6"></td>
                        <td><input type="radio" name="tick6"></td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td>Team Work</td>
                        <td><input type="radio" name="tick7" checked></td>
                        <td><input type="radio" name="tick7"></td>
                        <td><input type="radio" name="tick7"></td>
                        <td><input type="radio" name="tick7"></td>
                        <td><input type="radio" name="tick7"></td>
                    </tr>
                    <tr>
                        <td>8</td>
                        <td> Integrity and Ethics </td>
                        <td><input type="radio" name="tick8" checked></td>
                        <td><input type="radio" name="tick8"></td>
                        <td><input type="radio" name="tick8"></td>
                        <td><input type="radio" name="tick8"></td>
                        <td><input type="radio" name="tick8"></td>
                    </tr>

                </table><br>

                <p><b>Suitability Criteria for confirmation </b></p>
                <table>
                    <tr>
                        <th>Standard</th>
                        <th>Rating(According to the obtained marks)</th>
                        <th>Decision</th>

                    </tr>
                    <tr>
                        <td>Unacceptable</td>
                        <td>20-36</td>
                        <td>Not Recommended</td>
                    </tr>
                    <tr>
                        <td>Needs Improvements</td>
                        <td>37-52</td>
                        <td>Not Recommended</td>
                    </tr>
                    <tr>
                        <td>Meets Expectations</td>
                        <td>53-68</td>
                        <td>Recommended but needs Developments</td>
                    </tr>
                    <tr>
                        <td>Exceeds Expectations</td>
                        <td>69-84</td>
                        <td>Recommended</td>
                    </tr>
                    <tr>
                        <td>Superior</td>
                        <td>85-100</td>
                        <td>Recommended</td>
                    </tr>
                </table><br>
                <div class="grid_container">
                    <div class="row">
                        <div class="column_three label_input">
                            <label id="totm">Total marks out of 100((Obtained marks/40)*100)</label>
                        </div>
                        <div class="column_one">
                            <input type="text" name="totm" id="totm">
                        </div>
                        <div class="column_one"></div>
                    </div>
                </div><br>

                <div>
                    <label id="cmnt2"><h4><b>Remarks by Evaluating Officer</b></h4></label>
                </div>
                <div class="grid_container">
                    <div class="row">
                        <div class="column_two"> 
                            <input type="text" name="cmnt2" id="cmnt2">
                        </div>
                    </div>
                </div>
                <div class="grid_container">
                    <div class="row">
                        <div class="column_one label_input">
                            <label id="evalid">Evaluator ID</label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="evalid" id="evalid">
                        </div>
                        <div class="column_one"></div>
                        <div class="column_one label_input">
                            <label id="evalname">Evaluator Name</label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="evalname" id="evalname">
                        </div>
                    </div>
                </div>     

                <div>
                    <label id="cmnt3"><h4><b> HR Manager’s Remarks.</b></h4></label>
                </div>
                <div class="grid_container">
                    <div class="row">
                        <div class="column_two"> 
                            <input type="text" name="cmnt3" id="cmnt3">
                        </div>
                    </div>
                </div><br>


                <div>
                    <label id="cmnt4"><h4><b>Approval (Secretary/ CEO/ Add CEO)</b></h4></label>
                </div>
                <div class="grid_container">
                    <div class="row">
                        <div class="column_one"> 
                            <input type="radio" name="approval" value="yes" checked> Yes
                        </div>
                        <div class="column_one">
                            <input type="radio" name="approval" value="no">No<br>
                        </div>
                    </div>
                </div><br>

                <div class="grid_container">
                    <div class="row">
                        <div class="column_one"></div>
                        <div class="column_two">
                            <input type="submit" value="Submit">
                        </div>
                        <div class="column_five"></div>

                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
