<%-- 
    Document   : experimentalSearch
    Created on : Mar 13, 2015, 5:49:00 PM
    Author     : adam
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
        <link href="tanga.css" type="text/css" rel="stylesheet" media="screen" />
        <script src="http://connect.soundcloud.com/sdk.js"></script> 
        <style>
            .resultdiv {
                background-color: #edece0;
            }
        </style>
    </head>
    <body>
        <script>
            SC.initialize({
                client_id: 'YOUR_CLIENT_ID'
            });

            function e() {
                var message_entered =  document.getElementById("search_box").value;
                // find all sounds of message_entered licensed under 'creative commons share alike'
                SC.get('/tracks', { q: message_entered }, function(tracks) {
                    console.log(tracks.length + " search results");

                    var parent = document.getElementById("searchdiv");
        for (var i = 0; i < tracks.length; i++) {
            permalink = tracks[i]["permalink_url"];
            title = tracks[i]["title"];
            avatar = tracks[i]['user']['avatar_url'];
            download = tracks[i]['download_url'];
            artwork_url = tracks[i]['artwork_url'];
            artist = tracks[i]['user']['username'];
            
            //debug
            console.log(tracks[i]);
            
            diva = document.createElement('div');
            a = document.createElement('a');
            a.href = avatar;
            a.innerHTML = title;
            img = document.createElement('img');
            img.src = artwork_url;
            img.alt = "Image Unavailable";
            a.appendChild(document.createElement('br'));
            img.setAttribute("width", "30%");            
            a.appendChild(img);            
            diva.setAttribute("class","resultdiv");
            diva.appendChild(document.createElement('hr'));
            diva.appendChild(a);
            parent.appendChild(diva);
        }
    });
            };
        </script>
        <div id="searchdiv" style=" min-width: 700px;max-width: 700px; border: solid;" >
            <h1>Search</h1><form action="javascript:e()" onsubmit="return e();">
                <input type="text" name="searchbox" id="search_box">
                <input type="button" value="Search" onclick="e();">
            </form>
        </div>
    </body>
</html>