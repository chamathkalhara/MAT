/* 
 * The system data validation functions.
 */

"use strict";
function formatDate(today) {
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!
    var yyyy = today.getFullYear();
    if (dd < 10) {
        dd = "0" + dd;
    }
    if (mm < 10) {
        mm = "0" + mm;
    }
    return today = yyyy + "-" + mm + "-" + dd;
}


$(document).ready(function () {
    //Date validation
    var today = new Date();
    today = formatDate(today);
    var lastMonth = new Date();
    lastMonth.setMonth(today.getMonth - 1);
    var dob = document.getElementById("dob");
    var dor = document.getElementById("dor");
    var pdoc = document.getElementById("pdoc");
    var sdate = document.getElementById("sdate");
    var ldate = document.getElementById("ldate");
    
    if (dob) {
        dob.setAttribute("max", "2000-12-31");
        dob.setAttribute("min", "1950-01-01");
    } else if (dor) {
        dor.setAttribute("max", today);
    } else if (pdoc) {
        dob.setAttribute("max", today);
        dob.setAttribute("min", lastMonth);
    } else if (sdate) {
        sdate.setAttribute("max", today);
    } else if (ldate) {
        ldate.setAttribute("max", today);
    }

});
