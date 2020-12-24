package com.javatmp.module.content.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.module.content.entity.Content;
import com.javatmp.module.content.service.ContentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
@Controller
public class UpdateContent {

    @Autowired
    ContentService contentService;

    @GetMapping(value = "/content/UpdateContent")
    public String doGet(Content content, Model model) {
        log.info("request content is [" + (content) + "]");
        content = this.contentService.getOne(content.getContentId());
        log.info("DB user to be Updated is [" + (content) + "]");

        model.addAttribute("content", content);
        return "/pages/content/UpdateContent.jsp";
    }

    @PostMapping(value = "/content/UpdateContent")
    public @ResponseBody
    ResponseMessage doPost(Content contentToBeUpdated, HttpServletRequest request, HttpServletResponse response) {

        log.debug("content to be updated is {}", contentToBeUpdated);
        ResponseMessage responseMessage = new ResponseMessage();

        if (this.contentService.updateContent(contentToBeUpdated) == 1) {
            // content updated successfully:
            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage("Content Updated successfully");
        } else {
            // content does not updated successfully:
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage("Content NOT Updated");
        }

        return responseMessage;
    }
}
