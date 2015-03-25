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
        <title>Details Page | Dovetune</title>
    </head>
    <body>
        <script>
            SC.initialize({
                client_id: 'YOUR_CLIENT_ID'
            });
            
            var json;
          //  var track_url = 'http://soundcloud.com/rennier-1/imagine-dragons-shots';
          var track_url = '${soundcloudUrl}';
            SC.oEmbed(track_url, { auto_play: true }, function(oEmbed) {
                console.log(oEmbed);
                json = oEmbed["html"];

                document.write(json);
            });
        </script>
    </body>
</html>
