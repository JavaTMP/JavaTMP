/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.service;

import com.javatmp.domain.Account;
import com.javatmp.domain.Content;
import com.javatmp.domain.Country;
import com.javatmp.domain.DiaryEvent;
import com.javatmp.domain.Document;
import com.javatmp.domain.Message;
import com.javatmp.domain.User;
import com.javatmp.mvc.MvcHelper;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

/**
 *
 * @author m_dar
 */
public class DBFaker {

    private List<User> users = new LinkedList<>();
    private List<DiaryEvent> diaryEvents = new LinkedList<>();
    private List<Document> documents = new LinkedList<>();
    private List<Country> countries = new LinkedList<>();
    private List<Content> contents = new LinkedList<>();
    private List<Account> accounts = new LinkedList<>();
    private List<Message> messages = new LinkedList<>();

    private static Long counter = 0L;

    public static synchronized Long getNextCounter() {
        return ++counter;
    }

    public DBFaker() {
        this.generateFakeUsers();
        this.generateChartOfAccounts();
        this.generateCountries();
        this.generateContent();
        this.generateMessages();
    }

    public List<User> getUsersList() {
        return getUsers();
    }

    public synchronized void addDiaryEvent(DiaryEvent event) {
        this.getDiaryEvents().add(event);
        event.setId(Long.valueOf(this.diaryEvents.size()));
    }

    public synchronized void addUser(User user) {
        getUsers().add(user);
    }

    private void generateFakeUsers() {

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

    private void generateChartOfAccounts() {
        Account rootCompanyAccount = new Account(1L, "1000000", "Company", "Main Company Root Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 0, null, null, 1, null);
        Account asset = new Account(2L, "0000001", "Assets", "Main Company Assets Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 1, 1L, null, 1, null);
        Account liability = new Account(3L, "0000002", "Liabilities", "Main Company Liabilities Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 2, 1L, null, 1, null);
        Account income = new Account(4L, "0000003", "Incomes", "Main Company Incomes Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 3, 1L, null, 1, null);
        Account expense = new Account(5L, "0000004", "Expense", "Main Company Expenses Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 4, 1L, null, 1, null);
        Account equity = new Account(6L, "0000005", "Equity", "Main Company equities Account", BigDecimal.ZERO, BigDecimal.ZERO, BigDecimal.ZERO, 5, 1L, null, 1, null);
        accounts.add(rootCompanyAccount);
        accounts.add(asset);
        accounts.add(liability);
        accounts.add(income);
        accounts.add(expense);
        accounts.add(equity);
    }

    private void generateCountries() {

        getCountries().add(new Country("AF", "Afghanistan"));
        getCountries().add(new Country("AL", "Albania"));
        getCountries().add(new Country("DZ", "Algeria"));
        getCountries().add(new Country("AS", "American Samoa"));
        getCountries().add(new Country("AD", "Andorra"));
        getCountries().add(new Country("AO", "Angola"));
        getCountries().add(new Country("AI", "Anguilla"));
        getCountries().add(new Country("AR", "Argentina"));
        getCountries().add(new Country("AM", "Armenia"));
        getCountries().add(new Country("AW", "Aruba"));
        getCountries().add(new Country("AU", "Australia"));
        getCountries().add(new Country("AT", "Austria"));
        getCountries().add(new Country("AZ", "Azerbaijan"));
        getCountries().add(new Country("BS", "Bahamas"));
        getCountries().add(new Country("BH", "Bahrain"));
        getCountries().add(new Country("BD", "Bangladesh"));
        getCountries().add(new Country("BB", "Barbados"));
        getCountries().add(new Country("BY", "Belarus"));
        getCountries().add(new Country("BE", "Belgium"));
        getCountries().add(new Country("BZ", "Belize"));
        getCountries().add(new Country("BJ", "Benin"));
        getCountries().add(new Country("BM", "Bermuda"));
        getCountries().add(new Country("BT", "Bhutan"));
        getCountries().add(new Country("BO", "Bolivia"));
        getCountries().add(new Country("BA", "Bosnia and Herzegowina"));
        getCountries().add(new Country("BW", "Botswana"));
        getCountries().add(new Country("BV", "Bouvet Island"));
        getCountries().add(new Country("BR", "Brazil"));
        getCountries().add(new Country("IO", "British Indian Ocean Territory"));
        getCountries().add(new Country("BN", "Brunei Darussalam"));
        getCountries().add(new Country("BG", "Bulgaria"));
        getCountries().add(new Country("BF", "Burkina Faso"));
        getCountries().add(new Country("BI", "Burundi"));
        getCountries().add(new Country("KH", "Cambodia"));
        getCountries().add(new Country("CM", "Cameroon"));
        getCountries().add(new Country("CA", "Canada"));
        getCountries().add(new Country("CV", "Cape Verde"));
        getCountries().add(new Country("KY", "Cayman Islands"));
        getCountries().add(new Country("CF", "Central African Republic"));
        getCountries().add(new Country("TD", "Chad"));
        getCountries().add(new Country("CL", "Chile"));
        getCountries().add(new Country("CN", "China"));
        getCountries().add(new Country("CX", "Christmas Island"));
        getCountries().add(new Country("CC", "Cocos (Keeling) Islands"));
        getCountries().add(new Country("CO", "Colombia"));
        getCountries().add(new Country("KM", "Comoros"));
        getCountries().add(new Country("CG", "Congo"));
        getCountries().add(new Country("CD", "Congo, the Democratic Republic of the"));
        getCountries().add(new Country("CK", "Cook Islands"));
        getCountries().add(new Country("CR", "Costa Rica"));
        getCountries().add(new Country("CI", "Cote d'Ivoire"));
        getCountries().add(new Country("HR", "Croatia (Hrvatska)"));
        getCountries().add(new Country("CU", "Cuba"));
        getCountries().add(new Country("CY", "Cyprus"));
        getCountries().add(new Country("CZ", "Czech Republic"));
        getCountries().add(new Country("DK", "Denmark"));
        getCountries().add(new Country("DJ", "Djibouti"));
        getCountries().add(new Country("DM", "Dominica"));
        getCountries().add(new Country("DO", "Dominican Republic"));
        getCountries().add(new Country("EC", "Ecuador"));
        getCountries().add(new Country("EG", "Egypt"));
        getCountries().add(new Country("SV", "El Salvador"));
        getCountries().add(new Country("GQ", "Equatorial Guinea"));
        getCountries().add(new Country("ER", "Eritrea"));
        getCountries().add(new Country("EE", "Estonia"));
        getCountries().add(new Country("ET", "Ethiopia"));
        getCountries().add(new Country("FK", "Falkland Islands (Malvinas)"));
        getCountries().add(new Country("FO", "Faroe Islands"));
        getCountries().add(new Country("FJ", "Fiji"));
        getCountries().add(new Country("FI", "Finland"));
        getCountries().add(new Country("FR", "France"));
        getCountries().add(new Country("GF", "French Guiana"));
        getCountries().add(new Country("PF", "French Polynesia"));
        getCountries().add(new Country("TF", "French Southern Territories"));
        getCountries().add(new Country("GA", "Gabon"));
        getCountries().add(new Country("GM", "Gambia"));
        getCountries().add(new Country("GE", "Georgia"));
        getCountries().add(new Country("DE", "Germany"));
        getCountries().add(new Country("GH", "Ghana"));
        getCountries().add(new Country("GI", "Gibraltar"));
        getCountries().add(new Country("GR", "Greece"));
        getCountries().add(new Country("GL", "Greenland"));
        getCountries().add(new Country("GD", "Grenada"));
        getCountries().add(new Country("GP", "Guadeloupe"));
        getCountries().add(new Country("GU", "Guam"));
        getCountries().add(new Country("GT", "Guatemala"));
        getCountries().add(new Country("GN", "Guinea"));
        getCountries().add(new Country("GW", "Guinea-Bissau"));
        getCountries().add(new Country("GY", "Guyana"));
        getCountries().add(new Country("HT", "Haiti"));
        getCountries().add(new Country("HM", "Heard and Mc Donald Islands"));
        getCountries().add(new Country("VA", "Holy See (Vatican City State)"));
        getCountries().add(new Country("HN", "Honduras"));
        getCountries().add(new Country("HK", "Hong Kong"));
        getCountries().add(new Country("HU", "Hungary"));
        getCountries().add(new Country("IS", "Iceland"));
        getCountries().add(new Country("IN", "India"));
        getCountries().add(new Country("ID", "Indonesia"));
        getCountries().add(new Country("IR", "Iran (Islamic Republic of)"));
        getCountries().add(new Country("IQ", "Iraq"));
        getCountries().add(new Country("IE", "Ireland"));
        getCountries().add(new Country("IL", "Israel"));
        getCountries().add(new Country("IT", "Italy"));
        getCountries().add(new Country("JM", "Jamaica"));
        getCountries().add(new Country("JP", "Japan"));
        getCountries().add(new Country("JO", "Jordan"));
        getCountries().add(new Country("KZ", "Kazakhstan"));
        getCountries().add(new Country("KE", "Kenya"));
        getCountries().add(new Country("KI", "Kiribati"));
        getCountries().add(new Country("KP", "Korea, Democratic People's Republic of"));
        getCountries().add(new Country("KR", "Korea, Republic of"));
        getCountries().add(new Country("KW", "Kuwait"));
        getCountries().add(new Country("KG", "Kyrgyzstan"));
        getCountries().add(new Country("LA", "Lao People's Democratic Republic"));
        getCountries().add(new Country("LV", "Latvia"));
        getCountries().add(new Country("LB", "Lebanon"));
        getCountries().add(new Country("LS", "Lesotho"));
        getCountries().add(new Country("LR", "Liberia"));
        getCountries().add(new Country("LY", "Libyan Arab Jamahiriya"));
        getCountries().add(new Country("LI", "Liechtenstein"));
        getCountries().add(new Country("LT", "Lithuania"));
        getCountries().add(new Country("LU", "Luxembourg"));
        getCountries().add(new Country("MO", "Macau"));
        getCountries().add(new Country("MK", "Macedonia, The Former Yugoslav Republic of"));
        getCountries().add(new Country("MG", "Madagascar"));
        getCountries().add(new Country("MW", "Malawi"));
        getCountries().add(new Country("MY", "Malaysia"));
        getCountries().add(new Country("MV", "Maldives"));
        getCountries().add(new Country("ML", "Mali"));
        getCountries().add(new Country("MT", "Malta"));
        getCountries().add(new Country("MH", "Marshall Islands"));
        getCountries().add(new Country("MQ", "Martinique"));
        getCountries().add(new Country("MR", "Mauritania"));
        getCountries().add(new Country("MU", "Mauritius"));
        getCountries().add(new Country("YT", "Mayotte"));
        getCountries().add(new Country("MX", "Mexico"));
        getCountries().add(new Country("FM", "Micronesia, Federated States of"));
        getCountries().add(new Country("MD", "Moldova, Republic of"));
        getCountries().add(new Country("MC", "Monaco"));
        getCountries().add(new Country("MN", "Mongolia"));
        getCountries().add(new Country("MS", "Montserrat"));
        getCountries().add(new Country("MA", "Morocco"));
        getCountries().add(new Country("MZ", "Mozambique"));
        getCountries().add(new Country("MM", "Myanmar"));
        getCountries().add(new Country("NA", "Namibia"));
        getCountries().add(new Country("NR", "Nauru"));
        getCountries().add(new Country("NP", "Nepal"));
        getCountries().add(new Country("NL", "Netherlands"));
        getCountries().add(new Country("AN", "Netherlands Antilles"));
        getCountries().add(new Country("NC", "New Caledonia"));
        getCountries().add(new Country("NZ", "New Zealand"));
        getCountries().add(new Country("NI", "Nicaragua"));
        getCountries().add(new Country("NE", "Niger"));
        getCountries().add(new Country("NG", "Nigeria"));
        getCountries().add(new Country("NU", "Niue"));
        getCountries().add(new Country("NF", "Norfolk Island"));
        getCountries().add(new Country("MP", "Northern Mariana Islands"));
        getCountries().add(new Country("NO", "Norway"));
        getCountries().add(new Country("OM", "Oman"));
        getCountries().add(new Country("PK", "Pakistan"));
        getCountries().add(new Country("PW", "Palau"));
        getCountries().add(new Country("PA", "Panama"));
        getCountries().add(new Country("PG", "Papua New Guinea"));
        getCountries().add(new Country("PY", "Paraguay"));
        getCountries().add(new Country("PE", "Peru"));
        getCountries().add(new Country("PH", "Philippines"));
        getCountries().add(new Country("PN", "Pitcairn"));
        getCountries().add(new Country("PL", "Poland"));
        getCountries().add(new Country("PT", "Portugal"));
        getCountries().add(new Country("PR", "Puerto Rico"));
        getCountries().add(new Country("QA", "Qatar"));
        getCountries().add(new Country("RE", "Reunion"));
        getCountries().add(new Country("RO", "Romania"));
        getCountries().add(new Country("RU", "Russian Federation"));
        getCountries().add(new Country("RW", "Rwanda"));
        getCountries().add(new Country("KN", "Saint Kitts and Nevis"));
        getCountries().add(new Country("LC", "Saint LUCIA"));
        getCountries().add(new Country("VC", "Saint Vincent and the Grenadines"));
        getCountries().add(new Country("WS", "Samoa"));
        getCountries().add(new Country("SM", "San Marino"));
        getCountries().add(new Country("ST", "Sao Tome and Principe"));
        getCountries().add(new Country("SA", "Saudi Arabia"));
        getCountries().add(new Country("SN", "Senegal"));
        getCountries().add(new Country("SC", "Seychelles"));
        getCountries().add(new Country("SL", "Sierra Leone"));
        getCountries().add(new Country("SG", "Singapore"));
        getCountries().add(new Country("SK", "Slovakia (Slovak Republic)"));
        getCountries().add(new Country("SI", "Slovenia"));
        getCountries().add(new Country("SB", "Solomon Islands"));
        getCountries().add(new Country("SO", "Somalia"));
        getCountries().add(new Country("ZA", "South Africa"));
        getCountries().add(new Country("GS", "South Georgia and the South Sandwich Islands"));
        getCountries().add(new Country("ES", "Spain"));
        getCountries().add(new Country("LK", "Sri Lanka"));
        getCountries().add(new Country("SH", "St. Helena"));
        getCountries().add(new Country("PM", "St. Pierre and Miquelon"));
        getCountries().add(new Country("SD", "Sudan"));
        getCountries().add(new Country("SR", "Suriname"));
        getCountries().add(new Country("SJ", "Svalbard and Jan Mayen Islands"));
        getCountries().add(new Country("SZ", "Swaziland"));
        getCountries().add(new Country("SE", "Sweden"));
        getCountries().add(new Country("CH", "Switzerland"));
        getCountries().add(new Country("SY", "Syrian Arab Republic"));
        getCountries().add(new Country("TW", "Taiwan, Province of China"));
        getCountries().add(new Country("TJ", "Tajikistan"));
        getCountries().add(new Country("TZ", "Tanzania, United Republic of"));
        getCountries().add(new Country("TH", "Thailand"));
        getCountries().add(new Country("TG", "Togo"));
        getCountries().add(new Country("TK", "Tokelau"));
        getCountries().add(new Country("TO", "Tonga"));
        getCountries().add(new Country("TT", "Trinidad and Tobago"));
        getCountries().add(new Country("TN", "Tunisia"));
        getCountries().add(new Country("TR", "Turkey"));
        getCountries().add(new Country("TM", "Turkmenistan"));
        getCountries().add(new Country("TC", "Turks and Caicos Islands"));
        getCountries().add(new Country("TV", "Tuvalu"));
        getCountries().add(new Country("UG", "Uganda"));
        getCountries().add(new Country("UA", "Ukraine"));
        getCountries().add(new Country("AE", "United Arab Emirates"));
        getCountries().add(new Country("GB", "United Kingdom"));
        getCountries().add(new Country("US", "United States"));
        getCountries().add(new Country("UM", "United States Minor Outlying Islands"));
        getCountries().add(new Country("UY", "Uruguay"));
        getCountries().add(new Country("UZ", "Uzbekistan"));
        getCountries().add(new Country("VU", "Vanuatu"));
        getCountries().add(new Country("VE", "Venezuela"));
        getCountries().add(new Country("VN", "Viet Nam"));
        getCountries().add(new Country("VG", "Virgin Islands (British)"));
        getCountries().add(new Country("VI", "Virgin Islands (U.S.)"));
        getCountries().add(new Country("WF", "Wallis and Futuna Islands"));
        getCountries().add(new Country("EH", "Western Sahara"));
        getCountries().add(new Country("YE", "Yemen"));
        getCountries().add(new Country("ZM", "Zambia"));
        getCountries().add(new Country("ZW", "Zimbabwe"));
    }

    private void generateContent() {
        Content content = new Content();
        content.setContentId(DBFaker.getNextCounter());
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DAY_OF_MONTH, -1001);
        content.setCreationDate(calendar.getTime());
        content.setStatus((short) 1);
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
        this.contents.add(content);

        for (int i = 1; i < 1000; i++) {
            content = new Content();
            content.setContentId(DBFaker.getNextCounter());
            calendar = Calendar.getInstance();
            calendar.add(Calendar.DAY_OF_MONTH, -i);
            calendar.set(Calendar.HOUR_OF_DAY, ThreadLocalRandom.current().nextInt(0, 24));
            calendar.set(Calendar.MINUTE, ThreadLocalRandom.current().nextInt(0, 60));
            calendar.set(Calendar.SECOND, ThreadLocalRandom.current().nextInt(0, 60));
            calendar.set(Calendar.MILLISECOND, ThreadLocalRandom.current().nextInt(0, 1000));
            content.setCreationDate(calendar.getTime());
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
            this.contents.add(content);
        }
    }

    private void generateMessages() {

        Random rand = new Random();
        for (int i = 0; i < this.users.size(); i++) {
            Long from = this.users.get(i).getId();
            // get random to:
            for (int j = 0; j < 250; j++) {
                int randomTo = 0;
                while ((randomTo = rand.nextInt(this.users.size())) == i);
//                System.out.println("i[" + i + "] => random to is [" + randomTo + "]");
                Long to = this.users.get(randomTo).getId();
                Message message = new Message();
                message.setMessageId(DBFaker.getNextCounter());
                message.setFromUser(from);
                message.setToUser(to);
                message.setMessageStatus((short) 1);
                message.setMessageTitle("Fake Message number " + message.getMessageId());

                message.setMessageContentText("<p>A fake data summary text to show you number " + message.getMessageId() + " geneated from fake database, Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>\n"
                        + "<p>A fake data summary text to show you number " + message.getMessageId() + " geneated from fake database, Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>\n"
                        + "<p>A fake data summary text to show you number " + message.getMessageId() + " geneated from fake database, Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>\n"
                        + "<p>A fake data summary text to show you number " + message.getMessageId() + " geneated from fake database, Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>\n"
                        + "<p>A fake data summary text to show you number " + message.getMessageId() + " geneated from fake database, Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>\n"
                        + "<p>A fake data summary text to show you number " + message.getMessageId() + " geneated from fake database, Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>\n"
                        + "");

                Calendar calendar = Calendar.getInstance();
                calendar.add(Calendar.DAY_OF_MONTH, ThreadLocalRandom.current().nextInt(30) * -1);
                calendar.set(Calendar.HOUR_OF_DAY, ThreadLocalRandom.current().nextInt(24));
                calendar.set(Calendar.MINUTE, ThreadLocalRandom.current().nextInt(60));
                calendar.set(Calendar.SECOND, ThreadLocalRandom.current().nextInt(60));
                calendar.set(Calendar.MILLISECOND, ThreadLocalRandom.current().nextInt(1000));

                message.setCreationDate(calendar.getTime());
                this.messages.add(message);
            }
        }
    }

    /**
     * @return the users
     */
    public List<User> getUsers() {
        return users;
    }

    /**
     * @return the diaryEvents
     */
    public List<DiaryEvent> getDiaryEvents() {
        return diaryEvents;
    }

    /**
     * @return the documents
     */
    public List<Document> getDocuments() {
        return documents;
    }

    /**
     * @return the accounts
     */
    public List<Account> getAccounts() {
        return accounts;
    }

    /**
     * @return the countries
     */
    public List<Country> getCountries() {
        return countries;
    }

    /**
     * @return the contents
     */
    public List<Content> getContents() {
        return contents;
    }

    /**
     * @return the contents
     */
    public List<Message> getMessages() {
        return messages;
    }

    public static void main(String[] args) {
        DBFaker faker = new DBFaker();

    }
}
