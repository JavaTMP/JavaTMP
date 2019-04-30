package com.javatmp.module.event;

import com.javatmp.module.dms.Document;
import com.javatmp.module.message.Message;
import com.javatmp.module.user.User;
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

    private List<DiaryEvent> diaryEvents = new LinkedList<>();
    private List<Document> documents = new LinkedList<>();
    private List<Message> messages = new LinkedList<>();
    private List<User> users = new LinkedList<>();
    private static Long counter = 0L;

    public static synchronized Long getNextCounter() {
        return ++counter;
    }

    public DBFaker() {

    }

    public synchronized void addDiaryEvent(DiaryEvent event) {
        this.getDiaryEvents().add(event);
        event.setId(Long.valueOf(this.diaryEvents.size()));
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

    public void generateMessages() {

        Random rand = new Random();
        for (int i = 0; i < this.getUsers().size(); i++) {
            Long from = this.getUsers().get(i).getId();
            // get random to:
            for (int j = 0; j < 250; j++) {
                int randomTo = 0;
                while ((randomTo = rand.nextInt(this.getUsers().size())) == i);
//                logger.info("i[" + i + "] => random to is [" + randomTo + "]");
                Long to = this.getUsers().get(randomTo).getId();
                Message message = new Message();
                message.setMessageId(DBFaker.getNextCounter());
                message.setFromUserId(from);
                message.setToUserId(to);
                message.setMessageStatus((short) 1);
                message.setMessageTitle("Fake Message number " + message.getMessageId());

                message.setMessageContentText("<p>A fake data summary text to show you number " + message.getMessageId() + " geneated from fake database, Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>");

                Calendar calendar = Calendar.getInstance();
                int randomDayOfMonth = ThreadLocalRandom.current().nextInt(31);
                calendar.add(Calendar.DAY_OF_MONTH, randomDayOfMonth * -1);
                if (randomDayOfMonth != 0) {
                    calendar.set(Calendar.HOUR_OF_DAY, ThreadLocalRandom.current().nextInt(24));
                    calendar.set(Calendar.MINUTE, ThreadLocalRandom.current().nextInt(60));
                    calendar.set(Calendar.SECOND, ThreadLocalRandom.current().nextInt(60));
                    calendar.set(Calendar.MILLISECOND, ThreadLocalRandom.current().nextInt(1000));
                } else {
                    int value = 0;
                    value = calendar.get(Calendar.HOUR_OF_DAY);
                    calendar.set(Calendar.HOUR_OF_DAY, ThreadLocalRandom.current().nextInt(value == 0 ? 1 : value));
                    value = calendar.get(Calendar.MINUTE);
                    calendar.set(Calendar.MINUTE, ThreadLocalRandom.current().nextInt(value == 0 ? 1 : value));
                    value = calendar.get(Calendar.SECOND);
                    calendar.set(Calendar.SECOND, ThreadLocalRandom.current().nextInt(value == 0 ? 1 : value));
                    value = calendar.get(Calendar.MILLISECOND);
                    calendar.set(Calendar.MILLISECOND, ThreadLocalRandom.current().nextInt(value == 0 ? 1 : value));
                }

                message.setCreationDate(calendar.getTime());
                this.messages.add(message);
            }
        }
    }

    /**
     * @return the contents
     */
    public List<Message> getMessages() {
        return messages;
    }

    /**
     * @return the users
     */
    public List<User> getUsers() {
        return users;
    }

    /**
     * @param users the users to set
     */
    public void setUsers(List<User> users) {
        this.users = users;
    }
}
