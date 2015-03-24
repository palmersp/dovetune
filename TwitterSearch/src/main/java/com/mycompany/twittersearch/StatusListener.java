/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.twittersearch;

import twitter4j.Status;
import twitter4j.StatusDeletionNotice;

/**
 *
 * @author Spencer
 */
class StatusListener {
    

            public void onStatus(Status status) {
                String list = "@" + status.getUser().getScreenName() + " - " + status.getText();
            }

          
            public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {
                System.out.println("Got a status deletion notice id:" + statusDeletionNotice.getStatusId());
            }

         
            public void onTrackLimitationNotice(int numberOfLimitedStatuses) {
                System.out.println("Got track limitation notice:" + numberOfLimitedStatuses);
            }

   
            public void onScrubGeo(long userId, long upToStatusId) {
                System.out.println("Got scrub_geo event userId:" + userId + " upToStatusId:" + upToStatusId);
            }

//            @Override
//            public void onStallWarning(StallWarning warning) {
//                System.out.println("Got stall warning:" + warning);
//            }

       
            public void onException(Exception ex) {
                ex.printStackTrace();
            }
    
}
