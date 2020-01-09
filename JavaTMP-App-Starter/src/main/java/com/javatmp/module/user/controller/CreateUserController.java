package com.javatmp.module.user.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.util.Util;
import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import com.javatmp.util.MD5Util;
import java.io.IOException;
import java.util.Date;
import java.util.ResourceBundle;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

@Slf4j
@Controller
public class CreateUserController {

    @Autowired
    UserService userService;

    @PostMapping("/user/CreateUserController")
    public @ResponseBody
    ResponseMessage doPost(@SessionAttribute ResourceBundle labels,
            @RequestParam("profilePicture") MultipartFile profilePicture, User userToBeCreated,
            HttpServletRequest request, HttpServletResponse response) {

        ResponseMessage responseMessage = new ResponseMessage();

        try {
            log.info("User to be created is {}", userToBeCreated);
            Document fileUploading = Util.readDocumentFromRequestIfExist(profilePicture);
            log.info("original size [" + fileUploading.getDocumentSize()
                    + "] stream size [" + fileUploading.getDocumentContent().length + "]");
            String t = "FileName 'requested' \"to\" Upload [" + fileUploading.getDocumentName()
                    + "] type[" + fileUploading.getContentType() + "]size[" + fileUploading.getDocumentSize() + "]<br/>";
            log.info(t);

            userToBeCreated.setProfilePicDocument(fileUploading);
            log.info("UserToBeCreated is {}", userToBeCreated);
            userToBeCreated.setPassword(MD5Util.convertToMD5(userToBeCreated.getPassword()));
            userToBeCreated.setCreationDate(new Date());
            userToBeCreated.setStatus((short) 1);

            this.userService.createNewUser(userToBeCreated);

            responseMessage.setOverAllStatus(true);
            responseMessage.setMessage(labels.getString("action.createUser.successMsg"));
            responseMessage.setData(userToBeCreated);

        } catch (IOException e) {
            throw new IllegalArgumentException("Failed to store file", e);
        } catch (IllegalStateException e) {
            log.info("ERROR : " + e.getMessage());
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(labels.getString("action.createUser.wrongDocumentSize"));
            response.setStatus(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);
            responseMessage.setStatusCode(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);

        }
        return responseMessage;
    }

}
