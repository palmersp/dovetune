/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.soundcloud1.curl;

/**
 *
 * @author stake
 */
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;

public class Curl {
    public static void curl() throws IOException {
        ProcessBuilder pb = new ProcessBuilder(
                "curl",
                "http://soundcloud.com/oembed",
                "-d",
                "'format=json'",
                "-d",
                "'url=http://soundcloud.com/forss/flickermood'");

        //pb.directory(new File("/home/stake/Pictures"));
        //pb.redirectErrorStream(true);
        Process p = pb.start();
        InputStream is = p.getInputStream();

        FileOutputStream outputStream = new FileOutputStream(
                "/home/stake/Pictures/simpson_download.jpg");

        String line;
        BufferedInputStream bis = new BufferedInputStream(is);
        byte[] bytes = new byte[100];
        int numberByteReaded;
        while ((numberByteReaded = bis.read(bytes, 0, 100)) != -1) {

            outputStream.write(bytes, 0, numberByteReaded);
            Arrays.fill(bytes, (byte) 0);

        }
    }
}
