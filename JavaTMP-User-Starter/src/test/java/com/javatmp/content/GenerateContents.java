/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.content;

import com.javatmp.module.content.entity.Content;
import com.javatmp.module.user.User;
import com.javatmp.module.user.UserService;
import com.javatmp.util.JpaDaoHelper;
import java.util.Calendar;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

/**
 *
 * @author JavaTMP
 */
public class GenerateContents {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        JpaDaoHelper jpaDaoHelper;
        UserService userService;
        jpaDaoHelper = new JpaDaoHelper("AppPU");
        userService = new UserService(jpaDaoHelper);
        List<User> users = userService.getUsers();
        generateContent(jpaDaoHelper, users);
    }

    public static void generateContent(JpaDaoHelper jpaDaoHelper, List<User> users) {
        Content content = new Content();
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DAY_OF_MONTH, -1001);
        content.setCreationDate(calendar.getTime());
        content.setStatus((short) 1);
        content.setCreatedBy(1L);
        content.setTitle("Java (programming language) Wikipedia Page");
        content.setSummaryText("<p><b>Java</b> is a general-purpose <b>computer-programming language</b> that is <b>concurrent</b>, <b>class-based</b>, <b>object-oriented</b>, and specifically designed to have as few implementation dependencies as possible. It is intended to let application developers \"<b>write once, run anywhere</b>\" (WORA), meaning that <b>compiled</b> Java code can run on all platforms that support Java without the need for recompilation.</p>");
        content.setContentText("<p><b>Java</b> is a general-purpose <b>computer-programming language</b> that is <b>concurrent</b>, <b>class-based</b>, <b>object-oriented</b>, and specifically designed to have as few implementation dependencies as possible. It is intended to let application developers \"<b>write once, run anywhere</b>\" (WORA), meaning that <b>compiled</b> Java code can run on all platforms that support Java without the need for recompilation. Java applications are typically compiled to <b>bytecode</b> that can run on any <b>Java virtual machine</b> (JVM) regardless of <b>computer architecture</b>. As of 2016, Java is one of the most <b>popular programming languages</b> in use, particularly for client-server web applications, with a reported 9 million developers. Java was originally developed by<b> James Gosling</b> at <b>Sun Microsystems</b> (which has since been acquired by <b>Oracle Corporation</b>) and released in 1995 as a core component of Sun Microsystems' Java platform. The language derives much of its syntax from C and C++, but it has fewer low-level facilities than either of them.</p>\n"
                + "<p>The original and reference implementation Java compilers, virtual machines, and class libraries were originally released by Sun under proprietary licenses. As of May 2007, in compliance with the specifications of the <b>Java Community Process</b>, Sun relicensed most of its Java technologies under the <b>GNU General Public License</b>. Others have also developed alternative implementations of these Sun technologies, such as the GNU Compiler for Java (bytecode compiler), GNU Classpath (standard libraries), and IcedTea-Web (browser plugin for applets).</p>\n"
                + "<p>The latest version is <b>Java 10</b>, released on March 20, 2018, which follows <b>Java 9</b> after only six months in line with the new release schedule. Java 8 is still supported but there will be no more security updates for Java 9. Versions earlier than Java 8 are supported by companies on a commercial basis; e.g. by Oracle back to Java 6 as of October 2017 (while they still \"highly recommend that you uninstall\" pre-Java 8 from at least Windows computers).</p>\n"
                + "<p>There were five primary goals in the creation of the Java language:</p><ol><li>It must be \"simple, object-oriented, and familiar\".</li><li>It must be \"robust and secure\".</li><li>It must be \"architecture-neutral and portable\".</li><li>It must execute with \"high performance\".</li><li>It must be \"interpreted, threaded, and dynamic\".</li></ol>\n"
                + "<p>For more information about Java Programming language see the following links:</p>\n"
                + "<ul>\n"
                + "<li><a href=\"https://en.wikipedia.org/wiki/Java_(programming_language)\" target=\"_blank\">Original Java (programming language) Wikipedia Page</a>.</li>\n"
                + "<li><a href=\"https://www.oracle.com/java/index.html\" target=\"_blank\">Oracle Java home Page</a>.</li>\n"
                + "<li><a href=\"https://en.wikipedia.org/wiki/Java_version_history\" target=\"_blank\">Java version history</a>.</li>\n"
                + "</ul>\n"
                + "<p>Copy pasted from <a href=\"https://en.wikipedia.org/wiki/Java_(programming_language)\" target=\"_blank\">this wikipedia page</a>.</p>\n"
                + "");
        jpaDaoHelper.create(content);
        Random rand = new Random();
        for (int i = 1; i < 1000; i++) {
            int randomTo = rand.nextInt(users.size());
            Long createdBy = users.get(randomTo).getId();
            content = new Content();
            calendar = Calendar.getInstance();
            calendar.add(Calendar.DAY_OF_MONTH, -i);
            calendar.set(Calendar.HOUR_OF_DAY, ThreadLocalRandom.current().nextInt(0, 24));
            calendar.set(Calendar.MINUTE, ThreadLocalRandom.current().nextInt(0, 60));
            calendar.set(Calendar.SECOND, ThreadLocalRandom.current().nextInt(0, 60));
            calendar.set(Calendar.MILLISECOND, ThreadLocalRandom.current().nextInt(0, 1000));
            content.setCreationDate(calendar.getTime());
            content.setCreatedBy(createdBy);
            content.setStatus((short) 1);
            content.setTitle("Fake data content title to show you id number " + content.getContentId());
            content.setSummaryText("<p>A fake data summary text to show you number " + content.getContentId() + " geneated from fake database, Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>");
            content.setContentText("<p>A fake data summary text to show you number " + content.getContentId() + " geneated from fake database, Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>\n"
                    + "<p>A fake data summary text to show you number " + content.getContentId() + " geneated from fake database, Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>\n"
                    + "<p>A fake data summary text to show you number " + content.getContentId() + " geneated from fake database, Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>\n"
                    + "<p>A fake data summary text to show you number " + content.getContentId() + " geneated from fake database, Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>\n"
                    + "<p>A fake data summary text to show you number " + content.getContentId() + " geneated from fake database, Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>\n"
                    + "<p>A fake data summary text to show you number " + content.getContentId() + " geneated from fake database, Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>\n"
                    + "");

            jpaDaoHelper.create(content);
        }
    }
}
