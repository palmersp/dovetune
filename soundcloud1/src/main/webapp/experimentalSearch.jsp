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
    </head>
    <body>
        <script>
            SC.initialize({
                client_id: 'YOUR_CLIENT_ID'
            });
            //override document.write to append onto DOM
            document.write=function(s){
                var scripts = document.getElementsByTagName('script');
                var lastScript = scripts[scripts.length-1];
                lastScript.insertAdjacentHTML("beforebegin", s);
            }
            function search_print() {
                var form_text = "<div class=\"column1\"><h1>Search</h1>";
                form_text += "<form>";
                form_text += "<input type=\"text\" name=\"searchbox\" id=\"search_box\">";
                form_text += "<input type=\"button\" value=\"Search\" onclick=\"e();\">";
                form_text += "</form></div>";
                document.write(form_text);
            }
            function e() {
                var message_entered =  document.getElementById("search_box").value;
                // find all sounds of message_entered licensed under 'creative commons share alike'
                SC.get('/tracks', { q: message_entered, license: 'cc-by-sa' }, function(tracks) {
                    console.log(tracks.length + " search results");

                    var search_results_formated = ("<div style=\"float:right\" class=\"column1\"><article>");
                    search_results_formated += ("<h1>Twitter Posts</h1><p>Tweets</p>");
                    search_results_formated += ("<p>Tweets will go along the side here along this part</p>");
                    search_results_formated += ("<p>Tweets will go along the side here along this part</p>");
                    search_results_formated += ("<p>Tweets will go along the side here along this part</p>");
                    search_results_formated += ("<p>Tweets will go along the side here along this part</p>");
                    search_results_formated += ("</div></article>");
                    search_results_formated += ("<div class=\"column1\"><article>");
                    for (var i = 0; i < tracks.length; i++) {
                        permalink = tracks[i]["permalink_url"];
                        title = tracks[i]["title"];
                        avatar = tracks[i]['user']['avatar_url'];
                        download = tracks[i]['download_url'];
                        artwork_url = tracks[i]['artwork_url'];
                        artist = tracks[i]['user']['username'];
                        console.log(tracks[i]);
                        search_results_formated += ("<a href=\"" + avatar + "\" ><img src=\"" + artwork_url + "\" lowsrc=\"" + avatar + "\" alt=\"Artwork Unavailable\"/></a><br>");   
                        search_results_formated += ("<a href=\"" + permalink + "\">" + artist + "</a><span> - </span>");   
                        search_results_formated += ("<a href=\"" + permalink + "\">" + title + "</a><br>");   
                        search_results_formated += ("<form action=\"ProcessSong\" method=\"POST\"><input type=\"text\" value=\"");
                        search_results_formated += permalink;
                        search_results_formated += "\" name=\"soundcloudUrl\"><input type=\"submit\" value=\"Listen\">";
                        search_results_formated += ("</form>");
                        search_results_formated += ("<hr>");
                    }
                    search_results_formated += ("</div></article>");
                    document.write(search_results_formated);
                });
            };
        </script>
        <script>
            search_print();
        </script>
    </body>
</html>