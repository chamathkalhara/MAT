/* 
 * The function in this file loads the content in a jsp to a div of another jsp file when clicked.
 */
"use strict";
$(document).ready(function () {
    function loadContentLink(a, b, c) {
        $(a).click(function (event) {
            event.preventDefault();
            $(b).load(c);
        });
    };
    
    loadContentLink("#sys_settings", "#work_arena", "SystemSettings.jsp");
    loadContentLink("#sys_users", "#work_arena", "SysUsers.jsp");
    loadContentLink("#employee", "#work_arena", "Employee.jsp");
    loadContentLink("#loan", "#work_arena", "Loan.jsp");
    loadContentLink("#appraisals", "#work_arena", "Appraisals.jsp");
    loadContentLink("#reports", "#work_arena", "Report.jsp");
    loadContentLink("#department", "#work_arena", "department.jsp");
    loadContentLink("#cadre", "#work_arena", "Cadre.jsp");
    loadContentLink("#player", "#work_arena", "player.jsp");
    loadContentLink("#contract", "#work_arena", "Contract.jsp");
    loadContentLink("#allowance", "#work_arena", "Allowance.jsp");
    loadContentLink("#attendance", "#work_arena", "Attendance.jsp");
    loadContentLink("#testmatch", "#work_arena", "TestMatch.jsp");
    loadContentLink("#odit20", "#work_arena", "ODIT20.jsp");
    //Loads the relevant jsp files for the tab selections
    loadContentLink("#insertemployee", "#work_space", "../views/AddEmployee.jsp");
    loadContentLink("#searchemployee", "#work_space", "SearchEmployeeNew.jsp");
    loadContentLink("#insertloan", "#work_space", "AddLoan.jsp");
    loadContentLink("#searchloan", "#work_space", "SearchLoannew.jsp");
    loadContentLink("#conductappraisal", "#work_space", "PerformanceAppraisal.jsp");
    loadContentLink("#insertcadre", "#work_space", "AddCadre.jsp");
    loadContentLink("#searchcadre", "#work_space", "SearchCadreNew.jsp");
    loadContentLink("#insertdepartment", "#work_space", "AddDepartment.jsp");
    loadContentLink("#searchdepartment", "#work_space", "SearchDepartmentNew.jsp");
    loadContentLink("#viewsystemusers", "#work_space", "SystemUsers.jsp");
    loadContentLink("#addsystemusers", "#work_space", "EditSystemUsers.jsp");
    loadContentLink("#user_authentication", "#work_space", "UserAuthentication.jsp");
    loadContentLink("#insertcontract", "#work_space", "AddContract.jsp");
    loadContentLink("#searchcontract", "#work_space", "SearchContractNew.jsp");
    loadContentLink("#insertallowance", "#work_space", "AddAllowanceNew.jsp");
    loadContentLink("#searchallowance", "#work_space", "SearchAllowanceNew.jsp");
    loadContentLink("#contractrenewal", "#work_space", "ContractRenewal.jsp");
    loadContentLink("#searchplayer", "#work_space", "SearchPlayer.jsp");
    loadContentLink("#playerperformance", "#work_space", "PlayerPerformance.jsp");
    loadContentLink("#addreport", "#work_space", "AddAttendanceReport.jsp");
    loadContentLink("#overtime", "#work_space", "AddOvertime.jsp");
    loadContentLink("#contractevaluation","#work_space","ContractEvaluation.jsp");
    //loadContentLink("#leave", "#work_space", "Leave.jsp");
    loadContentLink("#view_reports", "#work_space_report", "ViewReport.jsp");
    loadContentLink("#appraisalanalysis", "#work_space", "EmployeePerformance.jsp");
    loadContentLink("#viewcadreports", "#work_space_report", "ViewCadreReport.jsp");
    loadContentLink("#viewempreports", "#work_space_report", "ViewEmployeesReport.jsp");
    loadContentLink("#viewperreports", "#work_space_report", "ViewPersonnelReport.jsp");
    loadContentLink("#viewsdreports", "#work_space_report", "ViewStrengthDistributionReport.jsp");
    loadContentLink("#leave", "#work_space", "AddLeave.jsp");
    loadContentLink("#newloandetails", "#work_space", "SearchNewLoanDetails.jsp");
    loadContentLink("#insertkpi", "#work_space", "AddKPI.jsp");    
    loadContentLink("#inserttmatch", "#work_space", "AddTest.jsp");
    loadContentLink("#insertomatch", "#work_space", "AddOdi.jsp");
    loadContentLink("#insertoscore", "#work_space", "AddOdiDetails.jsp");
    loadContentLink("#inserttscore", "#work_space", "AddTestDetails.jsp");    
});
