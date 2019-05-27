package com.javatmp.module.content;

import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.util.JpaDaoHelper;
import java.text.ParseException;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.LockModeType;
import javax.persistence.PersistenceException;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

public class ContentService {

    private final Logger logger = Logger.getLogger(getClass().getName());
    private final JpaDaoHelper jpaDaoHelper;

    public ContentService(JpaDaoHelper jpaDaoHelper) {
        this.jpaDaoHelper = jpaDaoHelper;
//        generateContent();
    }

    public Long getAllCount() {
        return this.getJpaDaoHelper().getAllCount(Content.class);
    }

    public int updateContent(Content content) {
        int updateStatus = 0;
        EntityManager em = null;
        try {

            em = this.getJpaDaoHelper().getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<Content> cq = cb.createQuery(Content.class);
            Root<Content> from = cq.from(Content.class);
            cq.select(from);
            cq.where(cb.equal(from.get(Content_.contentId), content.getContentId()));
            TypedQuery<Content> query = em.createQuery(cq);
            query.setLockMode(LockModeType.PESSIMISTIC_WRITE);
            Content dbContent = query.getSingleResult();
            dbContent.setTitle(content.getTitle());
            dbContent.setSummaryText(content.getSummaryText());
            dbContent.setContentText(content.getContentText());
            dbContent.setStatus(content.getStatus());
            em.getTransaction().commit();
            updateStatus = 1;
        } catch (PersistenceException e) {
            if (em != null) {
                em.getTransaction().rollback();
            }
            throw e;
        }

        return updateStatus;
    }

    public Content readContentById(Content content) {
        return this.getJpaDaoHelper().read(Content.class, content.getContentId());
    }

    public DataTableResults<Content> listContent(DataTableRequest<Content> page) throws ParseException {

        page.setClassType(Content.class);
        page.setSelects(new String[]{"contentId", "title", "summaryText",
            "contentText", "creationDate", "createdBy", "status"});
        DataTableResults<Content> msgs = getJpaDaoHelper().retrievePageRequestDetails(page);
        return msgs;
    }

    private void generateContent() {
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
        this.getJpaDaoHelper().create(content);

        for (int i = 1; i < 1000; i++) {
            content = new Content();
            calendar = Calendar.getInstance();
            calendar.add(Calendar.DAY_OF_MONTH, -i);
            calendar.set(Calendar.HOUR_OF_DAY, ThreadLocalRandom.current().nextInt(0, 24));
            calendar.set(Calendar.MINUTE, ThreadLocalRandom.current().nextInt(0, 60));
            calendar.set(Calendar.SECOND, ThreadLocalRandom.current().nextInt(0, 60));
            calendar.set(Calendar.MILLISECOND, ThreadLocalRandom.current().nextInt(0, 1000));
            content.setCreationDate(calendar.getTime());
            content.setCreatedBy(1L);
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
            this.getJpaDaoHelper().create(content);
        }
    }

    /**
     * @return the jpaDaoHelper
     */
    public JpaDaoHelper getJpaDaoHelper() {
        return jpaDaoHelper;
    }

}
