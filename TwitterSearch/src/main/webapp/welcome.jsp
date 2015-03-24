<%-- 
    Document   : Welcome
    Created on : Mar 14, 2015, 10:23:33 PM
    Author     : Spencer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
    </head>
    <body>
        <form action="SearchTwitter" method="Post">
            Topic to Search:
            <input type="text" name="term">
            <input type="submit" value="Search">
        </form>
        <form action="PostTweet" method="Post">
            Tweet!
            <input type="text" name="tweet">
            <input type="submit" value="Tweet">
        </form>
        <!--<a href="Stream">Stream</a>-->
    </body>
</html>
