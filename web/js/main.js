/* 
 * This files contains the main js functions for toggling and several other load content functions.
 */

function changeEmpValue() {
    document.getElementById("updatebtn_emp").style.visibility = "hidden";
    document.getElementById("ub").style.visibility = "visible";
    document.getElementById("de").style.visibility = "hidden";
    var elems = ["fname" , "lname" , "gender" , "nic" , "dob" , "address" , "epfno" , "ppno" , "did" , "cid"];
    for (var i = elems.length - 1; i >= 0; i--) {
        document.getElementsByName(elems[i])[0].disabled = false;
    }
}

function changeEnableValue() {
    document.getElementById("search").value = "Save";
    var elems = ["cno_res" , "name_res"];
    for (var i = elems.length - 1; i >= 0; i--) {
        console.log(document.getElementsByName(elems[i])[0]);
        document.getElementsByName(elems[i])[0].disabled = false;
    }
}

function changeDisableValue() {
    document.getElementById("search").value = "Save";
    var elems = ["cno" , "cname"];
    for (var i = elems.length - 1; i >= 0; i--) {
        document.getElementsByName(elems[i])[0].disabled = true;
    }
}

function previewImage(){
    $("#image_upload").on("change" , function()
    {
        var files = !!this.files ? this.files : [];
        if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support
 
        if (/^image/.test( files[0].type)){ // only image file
            var reader = new FileReader(); // instance of the FileReader
            reader.readAsDataURL(files[0]); // read the local file
 
            reader.onloadend = function(){ // set image data as background of div
                $("#preview_image").css("background-image" , "url("+this.result+")");
            }
        }
    });
}

$(document).ready(function() {

    function userAuthView() {
        $(".newUserForm").show();
        $(".editUserForm").show();
        $(".profileSettingsForm").show();

        /*$(".newUser").click(function () {
         $(".newUserForm").slideToggle();
         });*/

        $(".editUser").click(function() {
            $(".editUserForm").slideToggle();
        });
        /*
         $(".profileSettings").click(function () {
         $(".profileSettingsForm").slideToggle();
         });*/
    }
    ;


    function changePasswordView() {
        $(".changePasswordForm").hide();
        $(".changePassword").click(function() {
            $(".changePasswordForm").slideToggle();
        });
    }
    ;

    function changeInstructionView() {
        $(".instructions").hide();
        $(".read_more").click(function() {
            $(".instructions").slideToggle();
        });
    }
    ;

    function changeSearchTableView() {
        $(".searchTable").hide();
        $(".searchBtn").click(function() {
            $(".searchTable").slideToggle();
        });
    }
    ;
    
    function loadContent() {
        $("#header").load("../includes/header.html");
    }
    ;

    function loadContent(a, b) {
        $(a).load(b);
    }
    ;

    loadContent("#header" , "../includes/Header_New.jsp");

    loadContent("#Navigation_Bar" , "../includes/navigations/Navigation.jsp");
    loadContent("#Navigation_Bar_New" , "../includes/navigations/Navigation_Other.jsp");
    loadContent("#login_header" , "includes/HeaderNewUpdated.jsp");

    loadContent();
    userAuthView();
    changePasswordView();
    changeInstructionView();
    changeSearchTableView();
});

function openTab(evt, TabName) {
    console.log(TabName);
    event.preventDefault();

    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active" , "");
    }

    // Show the current tab, and add an "active" class to the link that opened the tab
    document.getElementById(TabName).style.display = "block";
    evt.currentTarget.className += " active";
}