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
        <style>
            iframe {
                height: 150px !important
            }
        </style>
        <title>Details Page | DoveTune</title>
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
                
                var parent = document.getElementById("details");
                var content = parent.innerHTML;
                content += json;
                document.getElementById("details").innerHTML = content;
            });
        </script>
        <div id="detailsDiv" style=" min-width: 700px;max-width: 700px; border: solid;" >
            <div id="details">
            <h1 style="text-align: center;">Dovetune</h1>
            <h1 style="text-align: center;"><a href="SignIn">Sign In to Twitter</a></h1>
            <form action="search.jsp" method="GET">
                <input type="text" size="100%" name="searchbox" id="search_box">
                <input type="submit" value="Search">
            </form>
            <div style="border: solid;">
                <h2 style="text-align: center;">${param.songName}</h2>
            </div>
            </div>
             ${list}
        </div>
    </body>
</html>
