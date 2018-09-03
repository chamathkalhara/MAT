<%-- 
    Document   : PerformanceAppraisal
    Created on : Sep 4, 2016, 6:19:03 AM
    Author     : Tajini
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <body>

        <div class="body">
            <form action="" method="POST" border="0">

                <div class="row" id="heading_sub">
                    <h2><center>Performance Appraisal</center></h2></div><br><br>
                <div class="grid_container">
                    <div class="row">
                        <div class="column_one label_input">
                            <label for="year"><b>Year of Assessment<span class="asterix">*</span> </b></label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="year" id="year" required ><br>
                            <%--<script type="text/javascript">
                                document.getElementById('year').value = Date();
                            </script>--%>
                        </div>
                        <div class="column_one"></div>
                        <div class="column_one label_input">
                            <label for="assessment">Assessment<span class="asterix">*</span> </label>
                        </div>
                        <div class="column_three adjust">
                            <input type="radio" name="assessment" id="assessment" value="Mid"  checked> Mid
                            <input type="radio" name="assessment" id="assessment" value="End"> End
                        </div>

                    </div>

                </div>

                <h2><b>Job Holders Data</b></h2>
                <div class="grid_container">
                    <div class="row">
                        <div class="column_one label_input">
                            <label for="paeno">Employee No<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="paeno" id="paeno" required>
                        </div>
                        <div class="column_one"></div>
                        <div class="column_one label_input">
                            <label for="paename">Name<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="paename" id="paename" required>
                        </div>
                        <div class="column_one"></div>
                    </div>

                    <div class="row">
                        <div class="column_one label_input">
                            <label for="epfno">EPF No<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="epfno" id="epfno" required>
                        </div>
                        <div class="column_one"></div>
                        <div class="column_one label_input">
                            <label for="des">Designation<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="des" id="des" required>
                        </div>
                        <div class="column_one"></div>
                    </div>


                    <div class="row"> 
                        <div class="column_one label_input">
                            <label id="dep">Department<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="dep" id="dep" required="">
                        </div>
                        <div class="column_one"></div> 
                        <div class="column_four"></div>

                    </div>
                </div>

                <h2><b>Appraiser</b></h2>
                <div class="grid_container">
                    <div class="row">
                        <div class="column_one label_input">
                            <label id="aempId">Employee Id<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="aempId" id="aempId" required="">
                        </div>
                        <div class="column_one"></div>
                        <div class="column_one label_input">
                            <label id="aname">Name<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="aname" id="aname" required="">
                        </div>
                    </div>

                    <div class="row">
                        <div class="column_one label_input">
                            <label for="ades">Designation<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="ades" id="ades" required>
                        </div>
                        <div class="column_one"></div>
                        <div class="column_one label_input">
                            <label for="doapp">Date of Appraisal</label>
                        </div>
                        <div class="column_two">
                            <input type="date" name="doapp" id="doapp">
                        </div>
                        <div class="column_one"></div>
                    </div>
                </div>

                <%--<h2><b>Appraiser’s Superior</b></h2><br>
                <div class="grid_container">
                    <div class="row">
                        <div class="column_one label_input">
                            <label id="sname">Name<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="sname" id="sname" required="">
                        </div>
                        <div class="column_one"></div>
                        <div class="column_one label_input">
                            <label for="sdes">Designation<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="sdes" id="sdes" required>
                        </div>
                        <div class="column_one"></div>
                    </div>
                </div><br>
                --%>
                <br>
                <h2><b>Performance Agreement</b></h2>

                <h4>Weight (W) denotes the scope of specified Key Result Area (KRA) on importance & prioritized basis.</h4>
                <%--
                <h2><b>Guidelines for Deciding Achievement %</b></h2><br>
                --%>
                <style>
                    table {
                        font-family: arial, sans-serif;
                        border-collapse: collapse;
                        width: 100%;
                    }

                    td, th {
                        border: 1px solid #dddddd;
                        text-align: left;
                        padding: 8px;
                    }

                    tr:nth-child(even) {
                        background-color: #dddddd;
                    }
                </style>

                <%--
                <table>
                    <tr>
                        <th class="performance_td">Achievement %</th>
                        <th class="performance_td">Description</th>
                    </tr>

                    <tr>
                        <td>80 - 100</td>
                        <td>Optimum self direction towards achieving Excellence through self.</td>
                    </tr>
                    <tr>
                        <td>50 - 79</td>
                        <td>Makes an effort with minimum direction to achieve positive results using available resources</td>
                    </tr>
                    <tr>
                        <td>20 - 49</td>
                        <td>Required direction</td>
                    </tr>
                    <tr>
                        <td>0 - 19</td>
                        <td>Below standard</td>
                    </tr>

                </table>
                --%>
                <table>
                    <tr>
                        <th>Key Performance Indicators</th>
                        <th>Weight (W) Out Of 100</th>
                        <th>Achievement (P) %</th>
                        <th>(W x  P) / 100</th>
                    </tr>

                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="3"><b>Total Marks</b></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="3"><b>Marks out of 55 =  Total Marks /100 * 55</b></td>
                        <td></td>
                    </tr>

                </table><br>

                <%--
<table>
                    <tr>
                        <th></th>
                        <th colspan="2">At objective setting</th>
                        <th colspan="2">After Evaluation</th>

                    </tr>

                    <tr>
                        <th></th>
                        <th>Date</th>
                        <th>Signature</th>
                        <th>Date</th>
                        <th>Signature</th>
                    </tr>
                    <tr>
                        <td>Agreed upon by Employee</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Agreed upon by Appraiser</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Agreed upon by Appraiser’s Superior</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>


                </table>
                --%>
                <br>
                <%--
                    <table>
                        <tr>
                            <th colspan="2">MID YEAR REVIEW FOR PERFORMANCE OBJECTIVES</th>
                        </tr>
                        <tr>
                            <th>KPI Number as per page 2.</th>
                            <th>Comments on progress</th>
                        </tr>

                    <tr>
                        <td>01.</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>02.</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>03.</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>04.</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>05.</td>
                        <td></td>
                    </tr>

                </table><br><br> --%>
                <h2><b>PERFORMANCE FACTOR & CORE VALUES</b></h2>

                <table>
                    <tr>
                        <th>Marks</th>
                        <th>Rating System</th>
                        <th>Marks</th>
                        <th>Rating System</th>
                    </tr>

                    <tr>
                        <td>1</td>
                        <td>Below standard – Improvement Required</td>
                        <td>2</td>
                        <td>Significant improvement necessary</td>
                    </tr>

                    <tr>
                        <td>3</td>
                        <td>Some improvement necessary</td>
                        <td>4</td>
                        <td>Fully competence in performance</td>
                    </tr>

                    <tr>
                        <td>5</td>
                        <td>Consistently exceed job requirement</td>
                        <td></td>
                        <td></td>
                    </tr>

                </table><br>


                <table>
                    <tr>
                        <th></th>
                        <th colspan="6"> REVIEW</th>

                    </tr>
                    <tr>
                        <th>PERFORMANCE FACTOR</th>
                        <th colspan="6">(Please select relevant Box)</th>	


                    </tr>

                    <tr>
                        <td></td>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td><b>Marks</b></td>

                    </tr>
                    <tr>

                        <td>01.Leadership</td>
                        <td><input type="radio" name="leadership" id="leadership" value="1"  checked></td>
                        <td><input type="radio" name="leadership" id="leadership" value="2" ></td>
                        <td><input type="radio" name="leadership" id="leadership" value="3" ></td>
                        <td><input type="radio" name="leadership" id="leadership" value="4" ></td>
                        <td><input type="radio" name="leadership" id="leadership" value="5" ></td>
                        <td></td>

                    </tr>
                    <tr>
                        <td>02.Initiative</td>
                        <td><input type="radio" name="initiative" id="initiative" value="1" checked></td>
                        <td><input type="radio" name="initiative" id="initiative" value="2" ></td>
                        <td><input type="radio" name="initiative" id="initiative" value="3" ></td>
                        <td><input type="radio" name="initiative" id="initiative" value="4" ></td>
                        <td><input type="radio" name="initiative" id="initiative" value="5" ></td>
                        <td></td>

                    </tr>
                    <tr>
                        <td>03.Commitment </td>
                        <td><input type="radio" name="commitment" id="commitment" value="1" checked></td>
                        <td><input type="radio" name="commitment" id="commitment" value="2" ></td>
                        <td><input type="radio" name="commitment" id="commitment" value="3" ></td>
                        <td><input type="radio" name="commitment" id="commitment" value="4" ></td>
                        <td><input type="radio" name="commitment" id="commitment" value="5" ></td>
                        <td></td>

                    </tr>
                    <tr>
                        <td>04.Team work</td>
                        <td><input type="radio" name="teamwork" id="teamwork" value="1" checked></td>
                        <td><input type="radio" name="teamwork" id="teamwork" value="2" ></td>
                        <td><input type="radio" name="teamwork" id="teamwork" value="3" ></td>
                        <td><input type="radio" name="teamwork" id="teamwork" value="4" ></td>
                        <td><input type="radio" name="teamwork" id="teamwork" value="5" ></td>
                        <td></td>

                    </tr>
                    <tr>
                        <td>05.Communication</td>
                        <td><input type="radio" name="commucation" id="commucation" value="1" checked></td>
                        <td><input type="radio" name="commucation" id="commucation" value="2" ></td>
                        <td><input type="radio" name="commucation" id="commucation" value="3" ></td>
                        <td><input type="radio" name="commucation" id="commucation" value="4" ></td>
                        <td><input type="radio" name="commucation" id="commucation" value="5" ></td>
                        <td></td>

                    </tr>
                    <tr>
                        <td>06.Productivity</td>
                        <td><input type="radio" name="productivity" id="productivity" value="1" checked></td>
                        <td><input type="radio" name="productivity" id="productivity" value="2" ></td>
                        <td><input type="radio" name="productivity" id="productivity" value="3" ></td>
                        <td><input type="radio" name="productivity" id="productivity" value="4" ></td>
                        <td><input type="radio" name="productivity" id="productivity" value="5" ></td>
                        <td></td>

                    </tr>
                    <tr>
                        <td><b>Total Marks</b></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>

                    </tr>
                    <tr>
                        <th>CORE VALUES</th>
                        <th colspan="6">(Please select relevant Box)</th>	

                    </tr>
                    <tr>
                        <td></td>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td><b>Marks</b></td>

                    </tr>
                    <tr>
                        <td>07.Creativity</td>
                        <td><input type="radio" name="creativity" id="creativity" value="1" checked></td>
                        <td><input type="radio" name="creativity" id="creativity" value="2" ></td>
                        <td><input type="radio" name="creativity" id="creativity" value="3" ></td>
                        <td><input type="radio" name="creativity" id="creativity" value="4" ></td>
                        <td><input type="radio" name="creativity" id="creativity" value="5" ></td>
                        <td></td>

                    </tr>
                    <tr>
                        <td>08.Dependability</td>
                        <td><input type="radio" name="dependability" id="dependability" value="1" checked></td>
                        <td><input type="radio" name="dependability" id="dependability" value="2" ></td>
                        <td><input type="radio" name="dependability" id="dependability" value="3" ></td>
                        <td><input type="radio" name="dependability" id="dependability" value="4" ></td>
                        <td><input type="radio" name="dependability" id="dependability" value="5" ></td>
                        <td></td>

                    </tr>
                    <tr>
                        <td>09.Accountability</td>
                        <td><input type="radio" name="accountability" id="accountability" value="1" checked></td>
                        <td><input type="radio" name="accountability" id="accountability" value="2" ></td>
                        <td><input type="radio" name="accountability" id="accountability" value="3" ></td>
                        <td><input type="radio" name="accountability" id="accountability" value="4" ></td>
                        <td><input type="radio" name="accountability" id="accountability" value="5" ></td>
                        <td></td>

                    </tr>
                    <tr>
                        <td><b>Total Marks</b></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>

                    </tr>

                </table><br>
                <%--<table>
                    <tr>
                        <th></th>
                        <th colspan="2">MID YEAR REVIEW</th>
                        <th colspan="2">END YEAR REVIEW</th>

                    </tr>

                    <tr>
                        <th></th>
                        <th>Date</th>
                        <th>Signature</th>
                        <th>Date</th>
                        <th>Signature</th>
                    </tr>
                    <tr>
                        <td>Agreed upon by Appraisee</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Agreed upon by Appraiser</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>                
</table>--%>
                <%--
                                <h2><b>OVERALL EVALUATION (To be filled end of the year)</b></h2>--%>
                <%--
                <h4>•The Appraiser to fill the following with the second level Appraiser 
                    (Head of the Division) and NOT WITH EMPLOYEE. This page should not be discussed with the employee.</h4>
                <h4>•Overall rating is based on the individual’s achievement of job objectives and 
                    responsibilities including the performance & behaviour.</h4><br>
                --%>
                <%--
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
                
                <h4>•Please mark X where appropriate.	•Suggested increments % is indicated in each box.</h4>

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
                --%>
                <%--
                <div class="grid_container">
                    <div class="row">
                        <div class="column_one label_input">
                            <label for="date">Date</label>
                        </div>
                        <div class="column_two ">
                            <input type="date" name="date" id="date">
                        </div>
                        <div class="column_five"></div>
                    </div><br>
                    <p><b>Appraiser's,</b></p>
                    <div class="row">
                        <div class="column_one label_input">
                            <label for="aname">Name<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="aname" id="aname" required="">
                        </div>
                        <div class="column_five"></div>
                    </div>
                    <div class="row">
                        <div class="column_one label_input">
                            <label for="asig">Signature</label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="asig" id="asig">
                        </div>
                        <div class="column_five"></div>
                    </div><br>
                    <p><b>Appraisers Superior,</b></p>
                    <div class="row">
                        <div class="column_one label_input">
                            <label for="cmnts">Comments</label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="cmnts" id="cmnts">
                        </div>
                        <div class="column_five"></div>
                    </div>
                    <div class="row">
                        <div class="column_one label_input">
                            <label for="ssig">Signature</label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="ssig" id="ssig">
                        </div>
                        <div class="column_five"></div>
                    </div>
                    <div class="row">
                        <div class="column_one label_input">
                            <label for="des">Designation<span class="asterix">*</span></label>
                        </div>
                        <div class="column_two">
                            <input type="text" name="des" id="des" required>
                        </div>
                        <div class="column_five"></div>
                    </div>
                </div>
                --%>

<%--
                <h2>PERFORMANCE FACTOR DEFINITION – GUIDE TO THE APPRAISERS</h2>
                <h4>Appraiser needs to compare appraisee only against the work performance 
                    and standards for the position which he/she holds. When defining the 
                    performance factors, overall view has been considered and therefore 
                    appraiser has a right to customize the definition to match same to the position</h4>
                <h2>GENERAL DEFINITION OF PERFORMANCE FACTORS AND CORE VALUES.</h2>
                <table>
                    <tr>

                        <th>Performance Factor</th>
                        <th>Definition</th>                                                           
                    </tr>

                    <tr>
                        <td>01.Leadership</td>
                        <td>Able to direct, influence and rally everybody towards achieving common objectives 
                            enthusiastically. Ability to set high standards for self and as well as for others. 
                            Supports experimentation and brainstorming that leads to innovation and learning.</td>
                    </tr> 
                    <tr>
                        <td>02.Initiative</td>
                        <td>Adopting a “Self Starting" rather than "passively accepting". Being proactive. 
                            Think independently; recognize what is needed to improve job efficiency and take action 
                            on improvements.</td>
                    </tr>
                    <tr>
                        <td>03.Initiative</td>
                        <td>Delivers despite obstacles and pressure and relentless in pursuit of major business 
                            improvements and success .Takes ownership and be proactive in resolving issues.  
                            Always delivers on personal and team commitment. Actions, decisions and behavior 
                            consistently support long term success</td>
                    </tr>
                    <tr>
                        <td>04.Team work</td>
                        <td>The ability to work co-operatively with others, to , be part of a team  to  work  
                            together,  as  opposed  to  working  separately  or competitively. Creates win-win,  
                            symbiotic   relationship   with others across all levels in pursuit of business goals.  
                            Shows consideration/ concern and respect for other people.  Confronts interpersonal 
                            issues compassionately</td>
                    </tr>
                    <tr>
                        <td>05.Communication</td>
                        <td>Ability  to  convey  (both  oral  and  written)  ideas/observations, clearly,  accurately,  
                            succinctly  and  convincingly  in  a  timely fashion. Is credible, assertive and confident. 
                            Presents effectively and is able to shape others opinions.  </td>
                    </tr>
                    <tr>
                        <td>06.Productivity</td>
                        <td>Taking highest possible output using lowest possible input in shortest possible time.  
                            Plans and prioritizes work, effectively utilize resources (own time, staff time, machinery 
                            and money), delegates responsibility for results.</td>
                    </tr>
                    <tr>                    
                        <th>Core Values</th>
                        <th>Definition</th>                                                           
                    </tr>
                    <tr>
                        <td>07.Creativity</td>
                        <td>Posses the ability and the desire to plan, develop and implement new systematic procedures, 
                            methodologies and to forward suggestions in relating with the area of work which enables to 
                            increase the overall efficiency, effectiveness and enhance the service quality.</td>
                    </tr>
                    <tr>
                        <td>08.Dependability</td>
                        <td>The degree the employee can be relied upon to get the job done.</td>
                    </tr>
                    <tr>
                        <td>09.Accountability</td>
                        <td>Being able to take personal responsibilities and to be proactive in both work issues and 
                            building relationships to carry out the work functions. Ability and willingness to deliver 
                            the success in work area under the minimum supervision and guidance.</td>
                    </tr>
                </table>
                --%>
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



