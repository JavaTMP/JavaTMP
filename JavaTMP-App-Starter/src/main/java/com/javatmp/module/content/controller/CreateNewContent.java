package com.javatmp.module.content.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.module.content.entity.Content;
import com.javatmp.module.content.service.ContentService;
import com.javatmp.module.user.entity.User;
import com.javatmp.util.Constants;
import java.util.Date;
import java.util.ResourceBundle;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
public class CreateNewContent {

    @Autowired
    ContentService contentService;

    @PostMapping(value = "/content/CreateNewContent")
    public @ResponseBody
    ResponseMessage doPost(Content contentToBeCreated, HttpServletRequest request, HttpServletResponse response) {

        ResponseMessage responseMessage = new ResponseMessage();
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");
        ResourceBundle labels = (ResourceBundle) session.getAttribute(Constants.LANGUAGE_ATTR_KEY);

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
}
