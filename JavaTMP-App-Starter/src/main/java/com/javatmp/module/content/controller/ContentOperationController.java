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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

@Slf4j
@Controller
@RequestMapping("/content")
public class ContentOperationController {

    @Autowired
    ContentService contentService;

    @PostMapping("/CreateNewContent")
    public @ResponseBody
    ResponseMessage CreateNewContent(@SessionAttribute(Constants.LANGUAGE_ATTR_KEY) ResourceBundle labels,
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
    public @ResponseBody
    ResponseMessage deleteContent(@SessionAttribute(Constants.LANGUAGE_ATTR_KEY) ResourceBundle labels,
            @SessionAttribute(Constants.LOG_IN_USER_NAME) User loggedInUser,
            Content contentToBeDeleted, ResponseMessage responseMessage) {
        log.info("User to be deleted is [" + contentToBeDeleted + "]");

        this.contentService.deleteContent(contentToBeDeleted);

        responseMessage.setOverAllStatus(true);
        responseMessage.setTitle(labels.getString("action.successTitle"));
        responseMessage.setMessage("Successfully deleted Record");
        responseMessage.setData(contentToBeDeleted);
        return responseMessage;

    }

    @PostMapping("/ListContent")
    public @ResponseBody
    ResponseMessage doPost(@RequestBody DataTableRequest tableRequest, ResponseMessage responseMessage,
            HttpServletRequest request, HttpServletResponse response)
            throws ParseException {
        DataTableResults<Content> results = this.contentService.listContent(tableRequest);
        responseMessage.setOverAllStatus(true);
        responseMessage.setMessage("Content Read successfully");
        responseMessage.setData(results);
        return responseMessage;

    }

    @GetMapping(value = "/cms/ReadContentController")
    public @ResponseBody
    ResponseMessage doGet(Content contentToBeRead, HttpServletRequest request, HttpServletResponse response) {

        ResponseMessage responseMessage = new ResponseMessage();

        Content dbContent = this.contentService.getOne(contentToBeRead.getContentId());
        responseMessage.setOverAllStatus(true);
        responseMessage.setMessage("Content Read successfully");
        responseMessage.setData(dbContent);
        return responseMessage;
    }
}
