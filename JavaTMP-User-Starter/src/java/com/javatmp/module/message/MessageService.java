package com.javatmp.module.message;

import com.javatmp.module.user.User;
import com.javatmp.module.user.UserService;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.util.JpaDaoHelper;
import java.text.ParseException;
import java.util.Calendar;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;
import java.util.logging.Logger;

public class MessageService {

    private final Logger logger = Logger.getLogger(getClass().getName());
    private final JpaDaoHelper jpaDaoHelper;
    private UserService userService;

    public MessageService(JpaDaoHelper jpaDaoHelper, UserService userService) {
        this.jpaDaoHelper = jpaDaoHelper;
        this.userService = userService;
    }

    public Long getAllCount() {
        return this.jpaDaoHelper.getAllCount(Message.class);
    }

//    public List<Message> getMessages() {
//        return this.jpaDaoHelper.findAll(Message.class);
//    }
    public Message readMessageById(Message message) {
        Message row = this.jpaDaoHelper.read(Message.class, message.getMessageId());

        Long fromUserId = row.getFromUserId();
        Long toUserId = row.getToUserId();
        User fromUser = new User();
        fromUser.setId(fromUserId);

        fromUser = this.userService.readBasicUserById(fromUser);
        if (fromUser != null) {
            row.setFromUser(fromUser);
        }

        User toUser = new User();
        toUser.setId(toUserId);

        toUser = this.userService.readBasicUserById(toUser);
        if (toUser != null) {
            row.setToUser(toUser);
        }
        return row;
    }

    public Message createMessage(Message message) {
        return this.jpaDaoHelper.create(message);
    }

    public DataTableResults<Message> listMessages(DataTableRequest<Message> tableRequest) throws ParseException {

        tableRequest.setClassType(Message.class);
        tableRequest.setSelects(new String[]{"messageId", "messageTitle", "messageContentText", "creationDate", "fromUserId", "toUserId", "messageStatus"});
        DataTableResults<Message> msgs = jpaDaoHelper.retrievePageRequestDetails(tableRequest);
        return msgs;
    }

    public void generateMessages() {
        Long counter = 0L;
        Random rand = new Random();
        List<User> users = this.userService.getUsers();
        for (int i = 0; i < users.size(); i++) {
            Long from = users.get(i).getId();
            // get random to:
            System.out.println("From i [" + from + "]");
            for (int j = 0; j < 10; j++) {
                int randomTo = 0;
                while ((randomTo = rand.nextInt(users.size())) == i);
//                logger.info("i[" + i + "] => random to is [" + randomTo + "]");
                Long to = users.get(randomTo).getId();
                Message message = new Message();
                message.setFromUserId(from);
                message.setToUserId(to);
                message.setMessageStatus((short) 1);
                message.setMessageTitle("Fake Message number " + (++counter));

                message.setMessageContentText("<p>A fake data summary text to show you number " + (counter) + " geneated from fake database, Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>");

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
                this.createMessage(message);
            }
        }
    }

}
