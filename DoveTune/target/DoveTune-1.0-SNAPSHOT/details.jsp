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
            	function changeIt(){
                var tweetStr = document.getElementById("tweet").value;
                var songStr = document.getElementById("songValue").value;
                
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange=function()
                    {
                        if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                    {
                     
                        var newTweet = document.createElement("LI");
                        newTweet.innerHTML = xmlhttp.responseText;
//                        newTweet.appendChild(textNode);
//                        var newTweet = xmlhttp.responseText;
                        console.log(newTweet);
                        var insertTweet = document.getElementById("tweetList");
                        insertTweet.insertBefore(newTweet, insertTweet.childNodes[0]);
//                       document.getElementById("tweetList").innerHTML=xmlhttp.responseText;
                    }
                    };
		xmlhttp.open("POST", "PostTweet", true);
		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xmlhttp.send("tweet=" + tweetStr + "&song=" + songStr);
	}
        </script>
        <div id="detailsDiv" style=" min-width: 700px;max-width: 700px; border: solid;" >
            <div id="details">
            <h1 style="text-align: center;">Dovetune</h1>
            <h1 style="text-align: center;"><a href="SignIn">Sign In to Twitter</a></h1>
            <form action="search.jsp" method="GET">
                <input type="text" size="100%" name="searchbox" id="search_box">
                <input type="submit" value="Search">
            </form>
            <input type="text" name="enterTweet" id="tweet">
            <input type="hidden" id="songValue" value="${song}">
            <input type="submit" onclick="changeIt()">
            <div style="border: solid;">
                <h2 style="text-align: center;">${param.songName}</h2>
            </div>
            </div>
            <ul id="tweetList">${list}</ul>
        </div>
    </body>
</html>
