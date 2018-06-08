package com.javatmp.service;

import com.javatmp.domain.Document;
import com.javatmp.domain.User;
import com.javatmp.util.MD5Util;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;
import java.util.logging.Logger;

public class DBFaker {

    private final Logger logger = Logger.getLogger(getClass().getName());
    private List<User> users = new LinkedList<>();
    private List<Document> documents = new LinkedList<>();
    private static Long counter = 0L;

    public static synchronized Long getNextCounter() {
        return ++counter;
    }

    public DBFaker() {
        this.generateFakeUsers();
    }

    public List<User> getUsersList() {
        return getUsers();
    }

    public synchronized void addUser(User user) {
        user.setId(DBFaker.getNextCounter());
        getUsers().add(user);
    }

    private void generateFakeUsers() {

        // just to make sure id 1 is not taken out
        DBFaker.getNextCounter();
        User logingUser = new User();
        logingUser.setId(1L);
        logingUser.setUserName("user" + logingUser.getId());
        logingUser.setPassword(MD5Util.convertToMD5(logingUser.getUserName()));
        logingUser.setFirstName("firstName");
        logingUser.setLastName("lastName");
        logingUser.setStatus((short) 1);
        logingUser.setCreationDate(new Date());
        logingUser.setEmail(logingUser.getUserName() + "@javatmp.com");
        logingUser.setMobile("00987654321000");
        logingUser.setLang("en");
        logingUser.setTheme("default");
        logingUser.setPosition("Super Administrator");
        logingUser.setOffice("New York");
        logingUser.setBirthOfDate(new Date(-399571200000L));
        logingUser.setJoiningDate(new Date(1293307200000L));
        logingUser.setSalary(new BigDecimal("100000"));
        logingUser.setMobile("123456789");
        this.users.add(logingUser);
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Tiger", "Nixon", (short) 1, new Date(-399571200000L), new Date(), "t.nixon@datatables.net", "5421", "en", "default", "US", "address not specified yet", "System Architect", "Edinburgh", new Date(1293307200000L), new BigDecimal("320800")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Garrett", "Winters", (short) 1, new Date(-462729600000L), new Date(), "g.winters@datatables.net", "8422", "en", "default", "US", "address not specified yet", "Accountant", "Tokyo", new Date(1293307200000L), new BigDecimal("170750")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Ashton", "Cox", (short) 1, new Date(-557337600000L), new Date(), "a.cox@datatables.net", "1562", "en", "default", "US", "address not specified yet", "Junior Technical Author", "San Francisco", new Date(1230408000000L), new BigDecimal("86000")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Cedric", "Kelly", (short) 1, new Date(831196800000L), new Date(), "c.kelly@datatables.net", "6224", "en", "default", "US", "address not specified yet", "Senior Javascript Developer", "Edinburgh", new Date(1325361600000L), new BigDecimal("433060")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Airi", "Satou", (short) 1, new Date(484041600000L), new Date(), "a.satou@datatables.net", "5407", "en", "default", "US", "address not specified yet", "Accountant", "Tokyo", new Date(1198958400000L), new BigDecimal("162700")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Brielle", "Williamson", (short) 1, new Date(-399571200000L), new Date(), "b.williamson@datatables.net", "4804", "en", "default", "US", "address not specified yet", "Integration Specialist", "New York", new Date(1325361600000L), new BigDecimal("372000")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Herrod", "Chandler", (short) 1, new Date(-336499200000L), new Date(), "h.chandler@datatables.net", "9608", "en", "default", "US", "address not specified yet", "Sales Assistant", "San Francisco", new Date(1325361600000L), new BigDecimal("137500")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Rhona", "Davidson", (short) 1, new Date(-210268800000L), new Date(), "r.davidson@datatables.net", "6200", "en", "default", "US", "address not specified yet", "Integration Specialist", "Tokyo", new Date(1261857600000L), new BigDecimal("327900")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Colleen", "Hurst", (short) 1, new Date(294652800000L), new Date(), "c.hurst@datatables.net", "2360", "en", "default", "US", "address not specified yet", "Javascript Developer", "San Francisco", new Date(1230408000000L), new BigDecimal("205500")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Sonya", "Frost", (short) 1, new Date(799574400000L), new Date(), "s.frost@datatables.net", "1667", "en", "default", "US", "address not specified yet", "Software Engineer", "Edinburgh", new Date(1198958400000L), new BigDecimal("103600")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Jena", "Gaines", (short) 1, new Date(578736000000L), new Date(), "j.gaines@datatables.net", "3814", "en", "default", "US", "address not specified yet", "Office Manager", "London", new Date(1198958400000L), new BigDecimal("90560")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Quinn", "Flynn", (short) 1, new Date(831196800000L), new Date(), "q.flynn@datatables.net", "9497", "en", "default", "US", "address not specified yet", "Support Lead", "Edinburgh", new Date(1356811200000L), new BigDecimal("342000")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Charde", "Marshall", (short) 1, new Date(389347200000L), new Date(), "c.marshall@datatables.net", "6741", "en", "default", "US", "address not specified yet", "Regional Director", "San Francisco", new Date(1198958400000L), new BigDecimal("470600")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Haley", "Kennedy", (short) 1, new Date(168422400000L), new Date(), "h.kennedy@datatables.net", "3597", "en", "default", "US", "address not specified yet", "Senior Marketing Designer", "London", new Date(1325361600000L), new BigDecimal("313500")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Tatyana", "Fitzpatrick", (short) 1, new Date(925804800000L), new Date(), "t.fitzpatrick@datatables.net", "1965", "en", "default", "US", "address not specified yet", "Regional Director", "London", new Date(1261857600000L), new BigDecimal("385750")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Michael", "Silva", (short) 1, new Date(-557337600000L), new Date(), "m.silva@datatables.net", "1581", "en", "default", "US", "address not specified yet", "Marketing Designer", "London", new Date(1325361600000L), new BigDecimal("198500")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Paul", "Byrd", (short) 1, new Date(-494265600000L), new Date(), "p.byrd@datatables.net", "3059", "en", "default", "US", "address not specified yet", "Chief Financial Officer (CFO)", "New York", new Date(1261857600000L), new BigDecimal("725000")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Gloria", "Little", (short) 1, new Date(-336499200000L), new Date(), "g.little@datatables.net", "1721", "en", "default", "US", "address not specified yet", "Systems Administrator", "New York", new Date(1230408000000L), new BigDecimal("237500")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Bradley", "Greer", (short) 1, new Date(231580800000L), new Date(), "b.greer@datatables.net", "2558", "en", "default", "US", "address not specified yet", "Software Engineer", "London", new Date(1325361600000L), new BigDecimal("132000")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Dai", "Rios", (short) 1, new Date(420883200000L), new Date(), "d.rios@datatables.net", "2290", "en", "default", "US", "address not specified yet", "Personnel Lead", "Edinburgh", new Date(1325361600000L), new BigDecimal("217500")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Jenette", "Caldwell", (short) 1, new Date(578736000000L), new Date(), "j.caldwell@datatables.net", "1937", "en", "default", "US", "address not specified yet", "Development Lead", "New York", new Date(1293307200000L), new BigDecimal("345000")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Yuri", "Berry", (short) 1, new Date(263116800000L), new Date(), "y.berry@datatables.net", "6154", "en", "default", "US", "address not specified yet", "Chief Marketing Officer (CMO)", "New York", new Date(1230408000000L), new BigDecimal("675000")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Caesar", "Vance", (short) 1, new Date(862732800000L), new Date(), "c.vance@datatables.net", "8330", "en", "default", "US", "address not specified yet", "Pre-Sales Support", "New York", new Date(1293307200000L), new BigDecimal("106450")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Doris", "Wilder", (short) 1, new Date(799574400000L), new Date(), "d.wilder@datatables.net", "3023", "en", "default", "US", "address not specified yet", "Sales Assistant", "Sidney", new Date(1261857600000L), new BigDecimal("85600")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Angelica", "Ramos", (short) 1, new Date(42192000000L), new Date(), "a.ramos@datatables.net", "5797", "en", "default", "US", "address not specified yet", "Chief Executive Officer (CEO)", "London", new Date(1230408000000L), new BigDecimal("1200000")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Gavin", "Joyce", (short) 1, new Date(200044800000L), new Date(), "g.joyce@datatables.net", "8822", "en", "default", "US", "address not specified yet", "Developer", "Edinburgh", new Date(1261857600000L), new BigDecimal("92575")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Jennifer", "Chang", (short) 1, new Date(641808000000L), new Date(), "j.chang@datatables.net", "9239", "en", "default", "US", "address not specified yet", "Regional Director", "Singapore", new Date(1261857600000L), new BigDecimal("357650")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Brenden", "Wagner", (short) 1, new Date(641808000000L), new Date(), "b.wagner@datatables.net", "1314", "en", "default", "US", "address not specified yet", "Software Engineer", "San Francisco", new Date(1293307200000L), new BigDecimal("206850")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Fiona", "Green", (short) 1, new Date(10656000000L), new Date(), "f.green@datatables.net", "2947", "en", "default", "US", "address not specified yet", "Chief Operating Officer (COO)", "San Francisco", new Date(1261857600000L), new BigDecimal("850000")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Shou", "Itou", (short) 1, new Date(894268800000L), new Date(), "s.itou@datatables.net", "8899", "en", "default", "US", "address not specified yet", "Regional Marketing", "Tokyo", new Date(1293307200000L), new BigDecimal("163000")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Michelle", "House", (short) 1, new Date(357811200000L), new Date(), "m.house@datatables.net", "2769", "en", "default", "US", "address not specified yet", "Integration Specialist", "Sidney", new Date(1293307200000L), new BigDecimal("95400")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Suki", "Burks", (short) 1, new Date(-147110400000L), new Date(), "s.burks@datatables.net", "6832", "en", "default", "US", "address not specified yet", "Developer", "London", new Date(1230408000000L), new BigDecimal("114500")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Prescott", "Bartlett", (short) 1, new Date(673344000000L), new Date(), "p.bartlett@datatables.net", "3606", "en", "default", "US", "address not specified yet", "Technical Author", "London", new Date(1293307200000L), new BigDecimal("145000")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Gavin", "Cortez", (short) 1, new Date(831196800000L), new Date(), "g.cortez@datatables.net", "2860", "en", "default", "US", "address not specified yet", "Team Leader", "San Francisco", new Date(1198958400000L), new BigDecimal("235500")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Martena", "Mccray", (short) 1, new Date(73814400000L), new Date(), "m.mccray@datatables.net", "8240", "en", "default", "US", "address not specified yet", "Post-Sales support", "Edinburgh", new Date(1293307200000L), new BigDecimal("324050")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Unity", "Butler", (short) 1, new Date(42192000000L), new Date(), "u.butler@datatables.net", "5384", "en", "default", "US", "address not specified yet", "Marketing Designer", "San Francisco", new Date(1230408000000L), new BigDecimal("85675")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Howard", "Hatfield", (short) 1, new Date(-84038400000L), new Date(), "h.hatfield@datatables.net", "7031", "en", "default", "US", "address not specified yet", "Office Manager", "San Francisco", new Date(1198958400000L), new BigDecimal("164500")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Hope", "Fuentes", (short) 1, new Date(231580800000L), new Date(), "h.fuentes@datatables.net", "6318", "en", "default", "US", "address not specified yet", "Secretary", "San Francisco", new Date(1261857600000L), new BigDecimal("109850")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Vivian", "Harrell", (short) 1, new Date(-431107200000L), new Date(), "v.harrell@datatables.net", "9422", "en", "default", "US", "address not specified yet", "Financial Controller", "San Francisco", new Date(1230408000000L), new BigDecimal("452500")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Timothy", "Mooney", (short) 1, new Date(357811200000L), new Date(), "t.mooney@datatables.net", "7580", "en", "default", "US", "address not specified yet", "Office Manager", "London", new Date(1198958400000L), new BigDecimal("136200")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Jackson", "Bradshaw", (short) 1, new Date(-525801600000L), new Date(), "j.bradshaw@datatables.net", "1042", "en", "default", "US", "address not specified yet", "Director", "New York", new Date(1198958400000L), new BigDecimal("645750")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Olivia", "Liang", (short) 1, new Date(-494265600000L), new Date(), "o.liang@datatables.net", "2120", "en", "default", "US", "address not specified yet", "Support Engineer", "Singapore", new Date(1293307200000L), new BigDecimal("234500")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Bruno", "Nash", (short) 1, new Date(326275200000L), new Date(), "b.nash@datatables.net", "6222", "en", "default", "US", "address not specified yet", "Software Engineer", "London", new Date(1293307200000L), new BigDecimal("163500")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Sakura", "Yamamoto", (short) 1, new Date(357811200000L), new Date(), "s.yamamoto@datatables.net", "9383", "en", "default", "US", "address not specified yet", "Support Engineer", "Tokyo", new Date(1230408000000L), new BigDecimal("139575")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Thor", "Walton", (short) 1, new Date(-399571200000L), new Date(), "t.walton@datatables.net", "8327", "en", "default", "US", "address not specified yet", "Developer", "New York", new Date(1356811200000L), new BigDecimal("98540")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Finn", "Camacho", (short) 1, new Date(42192000000L), new Date(), "f.camacho@datatables.net", "2927", "en", "default", "US", "address not specified yet", "Support Engineer", "San Francisco", new Date(1230408000000L), new BigDecimal("87500")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Serge", "Baldwin", (short) 1, new Date(-494265600000L), new Date(), "s.baldwin@datatables.net", "8352", "en", "default", "US", "address not specified yet", "Data Coordinator", "Singapore", new Date(1325361600000L), new BigDecimal("138575")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Zenaida", "Frank", (short) 1, new Date(-462729600000L), new Date(), "z.frank@datatables.net", "7439", "en", "default", "US", "address not specified yet", "Software Engineer", "New York", new Date(1261857600000L), new BigDecimal("125250")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Zorita", "Serrano", (short) 1, new Date(-241804800000L), new Date(), "z.serrano@datatables.net", "4389", "en", "default", "US", "address not specified yet", "Software Engineer", "San Francisco", new Date(1325361600000L), new BigDecimal("115000")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Jennifer", "Acosta", (short) 1, new Date(168422400000L), new Date(), "j.acosta@datatables.net", "3431", "en", "default", "US", "address not specified yet", "Junior Javascript Developer", "Edinburgh", new Date(1356811200000L), new BigDecimal("75650")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Cara", "Stevens", (short) 1, new Date(73814400000L), new Date(), "c.stevens@datatables.net", "3990", "en", "default", "US", "address not specified yet", "Sales Assistant", "New York", new Date(1293307200000L), new BigDecimal("145600")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Hermione", "Butler", (short) 1, new Date(42192000000L), new Date(), "h.butler@datatables.net", "1016", "en", "default", "US", "address not specified yet", "Regional Director", "London", new Date(1293307200000L), new BigDecimal("356250")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Lael", "Greer", (short) 1, new Date(862732800000L), new Date(), "l.greer@datatables.net", "6733", "en", "default", "US", "address not specified yet", "Systems Administrator", "London", new Date(1230408000000L), new BigDecimal("103500")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Jonas", "Alexander", (short) 1, new Date(578736000000L), new Date(), "j.alexander@datatables.net", "8196", "en", "default", "US", "address not specified yet", "Developer", "San Francisco", new Date(1261857600000L), new BigDecimal("86500")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Shad", "Decker", (short) 1, new Date(-84038400000L), new Date(), "s.decker@datatables.net", "6373", "en", "default", "US", "address not specified yet", "Regional Director", "Edinburgh", new Date(1198958400000L), new BigDecimal("183000")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Michael", "Bruce", (short) 1, new Date(610272000000L), new Date(), "m.bruce@datatables.net", "5384", "en", "default", "US", "address not specified yet", "Javascript Developer", "Singapore", new Date(1293307200000L), new BigDecimal("183000")));
        this.users.add(new User(DBFaker.getNextCounter(), null, null, "Donna", "Snider", (short) 1, new Date(673344000000L), new Date(), "d.snider@datatables.net", "4226", "en", "default", "US", "address not specified yet", "Customer Support", "New York", new Date(1293307200000L), new BigDecimal("112000")));

        // update birthdays randomly:
        Random rand = new Random();
        for (User user : this.users) {
            Calendar cal = Calendar.getInstance();
            cal.setTime(user.getBirthOfDate());
            cal.set(Calendar.MONTH, rand.nextInt(12));
            user.setBirthOfDate(cal.getTime());
        }

    }

    /**
     * @return the users
     */
    public List<User> getUsers() {
        return users;
    }

    /**
     * @return the documents
     */
    public List<Document> getDocuments() {
        return documents;
    }

    public static void main(String[] args) {
        DBFaker faker = new DBFaker();

    }
}
