/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.dovetune;

import java.io.IOException;
import static java.lang.System.out;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;

/**
 *
 * @author Spencer
 */
@WebServlet(name = "SearchTwitter", urlPatterns = {"/SearchTwitter"})
public class SearchTwitter extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, TwitterException {
        
             Twitter twitter = (Twitter)request.getSession().getAttribute("twitter");
             out.println(twitter.toString());
             String soundcloudUrl = request.getParameter("soundcloudUrl");
             String songName = request.getParameter("songName");

        try {
//            Query query = new Query(songName + " #DoveTune #SoundCloud");
              Query query = new Query("#" + songName);

            QueryResult result = twitter.search(query);

                List<Status> tweets = result.getTweets();
                String list = "<ul>";
                for (Status tweet : tweets) {
                   list += "<li><strong>" +tweet.getUser().getName() + " @" + tweet.getUser().getScreenName() + "</strong> - " + tweet.getText() + "</li>";
                }
                list += "</ul>";
//                list = list.replace("#" + songName + "", "<strong class='hashtags'>#"+ songName +"</strong>");
                int i = songName.indexOf("- ");
                String song = songName.substring(i + 2);
                list = list.replace("#" + song, "<strong class='hashtags'>#" + song + "</strong>");
                list = list.replace("#DoveTune", "<strong class='hashtags'>#DoveTune</strong>");
                list = list.replace("#SoundCloud", "<strong class='hashtags'>#SoundCloud</strong>");

                request.setAttribute("soundcloudUrl", soundcloudUrl);
                request.setAttribute("songName", songName);
                request.setAttribute("list", list);

        } catch (TwitterException te) {
            te.printStackTrace();
            out.println("Failed to search tweets: " + te.getMessage());
            System.exit(-1);
        }
        request.getRequestDispatcher("details.jsp").forward(request, response);

      
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (TwitterException ex) {
            Logger.getLogger(SearchTwitter.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (TwitterException ex) {
            Logger.getLogger(SearchTwitter.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
