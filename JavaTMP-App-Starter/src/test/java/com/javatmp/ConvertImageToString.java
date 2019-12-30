/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

/**
 *
 * @author JavaTMP
 */
public class ConvertImageToString {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws FileNotFoundException, IOException {

        InputStream fileContentStream = new FileInputStream("C:\\NetBeansProjects\\JavaTMP\\JavaTMP-User-Starter\\web\\assets\\img\\default-profile-pic.png");

        int nRead;
        byte[] data = new byte[1 * 1024];
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        while ((nRead = fileContentStream.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, nRead);
        }
        String text = Base64.getEncoder().encodeToString(buffer.toByteArray());
        System.out.println(text);

        String defaultProfileImage = "iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAABP0lEQVR4nO3XMavqMBiH8Sf1aqnp4CZEHEVE/AZ+/8nFSUTEqSooWDcDTXKHA2dtDu+Be4f3N/cPD0mXmN1ul/iPFf86oI8GSmmglAZKaaCUBkppoJQGSv3J/fDz+bDf79lsNqSUOBwOpJRYrVbUdf3rux8Hns9nYozEGLler0wmE4wxNE3DcrnkdDpRFAUxRqy1OOeydn2yrvj9ftN1HaPRCPg6laqqGI/HeO8BcM7xfD5p25bpdJq9+5XA2+2Gc46u60gpkVLCGEMIAWMMANZaiqLAWstgMMje9cm64hACx+MRgMvlQlmWeO8JIVBVFfB1WsYYXq8X3nvKssza9ck6wfV6zXa7ZTgcslgsmM1mPB4P2rb9/teapmE+n1PXNff7PXvXx+irTkgDpTRQSgOlNFBKA6U0UEoDpTRQ6i+ZRr8OBrK0SQAAAABJRU5ErkJggg==";
        byte[] newImage = Base64.getDecoder().decode(defaultProfileImage);
        System.out.println(newImage.length);
    }

}
