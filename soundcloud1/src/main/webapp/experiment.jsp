<%-- 
    Document   : experiment
    Created on : Mar 3, 2015, 4:30:35 PM
    Author     : stake
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="http://connect.soundcloud.com/sdk.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="tanga.css" type="text/css" rel="stylesheet" media="screen" />

        <title>Details Page | Dovetune</title>
    </head>
    <body>
        <script>
            SC.initialize({
                client_id: 'YOUR_CLIENT_ID'
            });
            
            var json;
            var track_url = '${param.soundcloudUrl}';

            SC.oEmbed(track_url, { auto_play: true }, function(oEmbed) {
                //console.log(oEmbed);
                json = oEmbed["html"];
                
                console.log(json);
                var parent = document.getElementById("detailsDiv");
                var content = parent.innerHTML;
                content += json;
                document.getElementById("detailsDiv").innerHTML = content;
            });
        </script>
        <div id="detailsDiv" style=" min-width: 700px;max-width: 700px; border: solid;" >
            <h1>Search</h1>
            <form action="javascript:e()" onsubmit="return e();">
                <input type="text" name="searchbox" id="search_box">
                <input type="button" value="Search" onclick="e();">
            </form>
            <div style="border: solid;">
                <h1 style="text-align: center;">Name of Song</h1>
            </div>
        </div>
    </body>
</html>
