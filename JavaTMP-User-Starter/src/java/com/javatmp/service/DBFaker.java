package com.javatmp.service;

import com.javatmp.domain.Country;
import com.javatmp.domain.Document;
import com.javatmp.domain.Language;
import com.javatmp.domain.Theme;
import com.javatmp.domain.Timezone;
import com.javatmp.domain.User;
import com.javatmp.util.MD5Util;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import java.util.logging.Logger;

public class DBFaker {

    private final Logger logger = Logger.getLogger(getClass().getName());
    private List<User> users = new LinkedList<>();
    private List<Document> documents = new LinkedList<>();
    private List<Country> countries = new LinkedList<>();
    private List<Language> languages = new LinkedList<>();
    private List<Theme> themes = new LinkedList<>();
    private List<Timezone> timezones = new LinkedList<>();
    private static Long counter = 0L;

    public static synchronized Long getNextCounter() {
        return ++counter;
    }

    public DBFaker() {
        this.generateThemes();
        this.generateLanguages();
        this.generateCountries();
        this.generateFakeUsers();
        this.generateTimezones();
    }

    private void generateTimezones() {
        // prepare a list of timezones - you should prepare them once instead of each request.
        String[] ids = TimeZone.getAvailableIDs();
        for (String id : ids) {
            TimeZone zone = TimeZone.getTimeZone(id);
            int offset = zone.getRawOffset() / 1000;
            int hour = offset / 3600;
            int minutes = (offset % 3600) / 60;
            String displayName = zone.getDisplayName();
            String d = zone.getDisplayName(zone.useDaylightTime(), TimeZone.SHORT);
            String displayTimezoneInfo = String.format("(GMT%+03d:%02d) %s - %s (%s)", hour, Math.abs(minutes), id, displayName, d);
            timezones.add(new Timezone(id, displayTimezoneInfo));
        }
    }

    public List<User> getUsersList() {
        return getUsers();
    }

    public synchronized void addUser(User user) {
        user.setId(DBFaker.getNextCounter());
        getUsers().add(user);
    }

    private void generateThemes() {
        this.themes.add(new Theme("default", "Default"));
        this.themes.add(new Theme("cerulean", "Cerulean"));
        this.themes.add(new Theme("cosmo", "Cosmo"));
        this.themes.add(new Theme("cyborg", "Cyborg"));
        this.themes.add(new Theme("darkly", "Darkly"));
        this.themes.add(new Theme("flatly", "Flatly"));
        this.themes.add(new Theme("journal", "Journal"));
        this.themes.add(new Theme("litera", "Litera"));
        this.themes.add(new Theme("lumen", "Lumen"));
        this.themes.add(new Theme("lux", "Lux"));
        this.themes.add(new Theme("materia", "Materia"));
        this.themes.add(new Theme("minty", "Minty"));
        this.themes.add(new Theme("pulse", "Pulse"));
        this.themes.add(new Theme("sandstone", "Sandstone"));
        this.themes.add(new Theme("simplex", "Simplex"));
        this.themes.add(new Theme("sketchy", "Sketchy"));
        this.themes.add(new Theme("slate", "Slate"));
        this.themes.add(new Theme("solar", "Solar"));
        this.themes.add(new Theme("spacelab", "Spacelab"));
        this.themes.add(new Theme("superhero", "Superhero"));
        this.themes.add(new Theme("united", "United"));
        this.themes.add(new Theme("yeti", "Yeti"));
    }

    private void generateLanguages() {
        this.languages.add(new Language("ar", "Arabic (AR)"));
        this.languages.add(new Language("en", "English (EN)"));
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
        logingUser.setEmail("support@javatmp.com");
        logingUser.setLang("en");
        logingUser.setTheme("default");
        logingUser.setTimezone(TimeZone.getTimeZone("UTC").getID());
        logingUser.setBirthDate(new Date(-399571200000L));
        logingUser.setCountryId("US");
        logingUser.setAddress("<p>Not provided yet</p>");
        this.users.add(logingUser);
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

    public List<Country> getCountries() {
        return countries;
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

    /**
     * @return the languages
     */
    public List<Language> getLanguages() {
        return languages;
    }

    /**
     * @param languages the languages to set
     */
    public void setLanguages(List<Language> languages) {
        this.languages = languages;
    }

    /**
     * @return the themes
     */
    public List<Theme> getThemes() {
        return themes;
    }

    /**
     * @return the timezones
     */
    public List<Timezone> getTimezones() {
        return timezones;
    }
}
