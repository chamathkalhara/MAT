<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../includes/header1.jsp"%>
    <body>
    <%@include file="../includes/navigations/AdminNavigation.jsp"%><br><br>
        <div class="body">
            <form border="0">
                <h2><center>Change Password</center></h2>
                <div>
                    <label for="cpwd">Current Password</label>
                    <input type="password" name="cpwd" id="cpwd">
                </div>
                <div>
                    <label for="newpwd">New Password</label>
                    <input type="password" name="newpwd" id="newpwd">
                </div>
                <div>
                    <label for="newpwd">Confirm Password</label>
                    <input type="password" name="newpwd" id="newpwd">
                </div>

                <input type="submit" value="Save">

            </form>
        </div>
    </body>
</html>
