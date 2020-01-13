package com.javatmp.module.content.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.module.content.entity.Content;
import com.javatmp.module.content.service.ContentService;
import com.javatmp.module.user.entity.User;
import com.javatmp.util.Constants;
import java.text.ParseException;
import java.util.Date;
import java.util.ResourceBundle;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

@Slf4j
@RestController
@RequestMapping("/content")
public class ContentOperationController {

    @Autowired
    ContentService contentService;

    @PostMapping("/CreateNewContent")
    public ResponseMessage CreateNewContent(@SessionAttribute(Constants.LANGUAGE_ATTR_KEY) ResourceBundle labels,
            @SessionAttribute(Constants.LOG_IN_USER_NAME) User loggedInUser,
            Content contentToBeCreated, ResponseMessage responseMessage) {

        log.debug("content to be created is {}", contentToBeCreated);
        contentToBeCreated.setCreationDate(new Date());
        contentToBeCreated.setStatus((short) 1);
        contentToBeCreated.setCreatedBy(loggedInUser.getId());

        this.contentService.save(contentToBeCreated);
        responseMessage.setOverAllStatus(true);
        responseMessage.setMessage("Content Created Successfully");
        responseMessage.setData(contentToBeCreated);
        return responseMessage;
    }

    @PostMapping("/deleteContent")
    public ResponseMessage deleteContent(
            @SessionAttribute(Constants.LANGUAGE_ATTR_KEY) ResourceBundle labels,
            @SessionAttribute(Constants.LOG_IN_USER_NAME) User loggedInUser,
            @RequestBody Content contentToBeDeleted,
            ResponseMessage responseMessage) {
        log.info("User to be deleted is [" + contentToBeDeleted + "]");

        this.contentService.deleteContent(contentToBeDeleted);

        responseMessage.setOverAllStatus(true);
        responseMessage.setTitle(labels.getString("action.successTitle"));
        responseMessage.setMessage("Successfully deleted Record");
        responseMessage.setData(contentToBeDeleted);
        return responseMessage;

    }

    @PostMapping("/ListContent")
    public DataTableResults<Content> listContent(@RequestBody DataTableRequest tableRequest)
            throws ParseException {
        DataTableResults<Content> results = this.contentService.listContent(tableRequest);
        return results;
    }

    @GetMapping("/readContentController")
    public Content readContentController(Content contentToBeRead) {
        Content dbContent = this.contentService.getOne(contentToBeRead.getContentId());
        return dbContent;
    }
}
