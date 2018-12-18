<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Awareness Widget</title>
    <link rel="stylesheet" href="css/WidgetStyling.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript">
        //when the document has finished loading. "$" sign calls the jquery
        $(document).ready(function () {
		
		function user (name, status, avatarURL) {
		this.name=name;
		this.GetName = function() {
        return this.name;
		};
		this.status=status;
		this.GetStatus = function() {
        return this.status;
		};
		this.avatarURL=avatarURL;
		this.GetAvatarURL = function() {
        return this.avatarURL;
		};
		}

		var users = [
		new user("A", "Online","*.png"),
		new user("B", "Online","*.png"),
		new user("C", "Offline","*.png"),
		new user("D", "Online","*.png"),
		new user("E", "Online","*.png"),
		new user("F", "Offline","*.png"),
		new user("G", "Online","*.png")];
		
		$("#sortable").sortable();
        $("#sortable").disableSelection();
        $(".links").click(function () {
                alert("Chat page");
            });
        $("#online").progressbar({
                value: 40
            });
        $("#offline").progressbar({
                value: 60
            });
        $(document).tooltip();
		
		$.each(users, function (index, value) {
                        console.log(value.GetName());
                        var color;
                        if (value.GetStatus == "Online") {
                            color = 'lawngreen';
                        } else if (value.GetStatus == "Offline") {
                            color = 'red';
                        } else {
                            color = 'grey';
                        }
                        var userDP = '<div class="links" ' + 'style="background-color:' + color.toString()+'"'+ '>' + value.GetName() + '</div>';
                        $(userDP).appendTo($("#AW_myClanFrame"));
						});
			})
    </script>

</head>

<body>

    <div class="container">
        <div class="column" id="AW_myClanFrame">
            <strong>My Clan</strong>
            <ul id="sortable">
			</ul>
        </div>
        <div class="column" id="AW_otherClanFrame">
            <strong>Other Clan</strong>
            <p>Online members: </p><div id="online"></div>
            <p>Offline members: </p><div id="offline"></div>
        </div>
        <div class="column">
            <ul>
                <li><p style="color: lawngreen">Online in your page</p></li>
                <li><p style="color: red">Online in other pages</p></li>
                <li><p style="color: dimgrey">offline</p></li>
            </ul>
        </div>

        <div class="column" id="AW_ajaxresult">

        </div>
    </div>

</body>

</html>