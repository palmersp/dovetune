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
        <title>JSP Page</title>
        <script src="http://connect.soundcloud.com/sdk.js"></script>    
<script>
SC.initialize({
  client_id: 'YOUR_CLIENT_ID'
});
function search_print() {
             var form_text = "<h1>Search</h1>";
            form_text += "<form action=\"experimentalSearch.jsp\">";
            form_text += "<input type=\"text\" name=\"searchbox\" id=\"search_box\">";
            form_text += "<input type=\"button\" value=\"Search\" onclick=\"e();\">";
            form_text += "</form>";
            document.write(form_text);
}
    function e() {
    var message_entered =  document.getElementById("search_box").value;

        // find all sounds of buskers licensed under 'creative commons share alike'
search_print();
        SC.get('/tracks', { q: message_entered, license: 'cc-by-sa' }, function(tracks) {
  console.log(tracks.length + " search results");
  for (var i = 0; i < tracks.length; i++) {
   permalink = tracks[i]["permalink_url"];
   title = tracks[i]["title"];
   avatar = tracks[i]['user']['avatar_url'];
   download = tracks[i]['download_url'];
   artwork_url = tracks[i]['artwork_url'];
   artist = tracks[i]['user']['username'];
   console.log(tracks[i]);
   document.write("<a href=\"" + avatar + "\" ><img src=\"" + artwork_url + "\" alt=\"Artwork Unavailable\"/></a><br>");   
   document.write("<a href=\"" + permalink + "\">" + artist + "</a><span> - </span>");   
   document.write("<a href=\"" + permalink + "\">" + title + "</a><br>");   
   document.write("<hr>");
  }
   });
};
</script>

    </head>
     
    <body>
        <script>
            search_print();
        </script>
        
    </body>
</html>
