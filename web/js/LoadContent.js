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
    loadContentLink("#contract", "#work_arena", "Contract.jsp");
    loadContentLink("#allowance", "#work_arena", "Allowance.jsp");
    loadContentLink("#attendance", "#work_arena", "Attendance.jsp");
    loadContentLink("#overtime", "#work_space", "AddOvertime.jsp");
    loadContentLink("#leave", "#work_space", "AddLeave.jsp");
    //Loads the relevant jsp files for the tab selections
    loadContentLink("#insertemployee", "#work_space", "../views/AddEmployee.jsp");
    loadContentLink("#searchemployee", "#work_space", "SearchEmployeeNew.jsp");
    loadContentLink("#searchloan", "#work_space", "SearchLoannew.jsp");
    loadContentLink("#conductappraisal", "#work_space", "PerformanceAppraisal.jsp");
    loadContentLink("#viewsystemusers", "#work_space", "SystemUsers.jsp");
    loadContentLink("#addsystemusers", "#work_space", "EditSystemUsers.jsp");
    loadContentLink("#user_authentication", "#work_space", "UserAuthentication.jsp");
    loadContentLink("#insertcontract", "#work_space", "AddContract.jsp");
    loadContentLink("#searchcontract", "#work_space", "SearchContractNew.jsp");
    loadContentLink("#insertallowance", "#work_space", "AddAllowanceNew.jsp");
    loadContentLink("#searchallowance", "#work_space", "SearchAllowanceNew.jsp");
    loadContentLink("#contractrenewal", "#work_space", "ContractRenewal.jsp");
    loadContentLink("#addreport", "#work_space", "AddAttendanceReport.jsp");
    loadContentLink("#contractevaluation","#work_space","ContractEvaluation.jsp");
    //loadContentLink("#leave", "#work_space", "Leave.jsp");
    loadContentLink("#view_reports", "#work_space_report", "ViewReport.jsp");
    loadContentLink("#appraisalanalysis", "#work_space", "EmployeePerformance.jsp");
    loadContentLink("#viewempreports", "#work_space_report", "ViewEmployeesReport.jsp");
    loadContentLink("#viewperreports", "#work_space_report", "ViewPersonnelReport.jsp");
    loadContentLink("#newloandetails", "#work_space", "SearchNewLoanDetails.jsp");    
});
