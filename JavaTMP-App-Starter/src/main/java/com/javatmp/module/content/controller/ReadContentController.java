package com.javatmp.module.content.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.module.content.entity.Content;
import com.javatmp.module.content.service.ContentService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
public class ReadContentController {

    @Autowired
    ContentService contentService;

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
