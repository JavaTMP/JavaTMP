package com.javatmp.module.user.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.fw.util.Util;
import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import com.javatmp.util.MD5Util;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Slf4j
@Controller
public class UpdateCompleteUserController {

    @Autowired
    UserService userService;

    @PostMapping("/user/UpdateCompleteUserController")
    public @ResponseBody
    ResponseMessage doPost(User userToBeUpdated, String oldPassword, @RequestParam MultipartFile profilePicture,
            HttpServletRequest request, HttpServletResponse response) throws IOException {

        ResponseMessage responseMessage = new ResponseMessage();

        try {

            log.info("User to be Updated is [" + MvcHelper.toString(userToBeUpdated) + "]");

            User dbUser = this.userService.readCompleteUserById(userToBeUpdated);
            log.info("Existing DB User to be Updated is [" + MvcHelper.toString(dbUser) + "]");

            // first check if existing db password equal provided old password:
            if (dbUser.getPassword().equals(MD5Util.convertToMD5(oldPassword)) == false) {
                throw new IllegalArgumentException("Existing Password does not match provided old password");
            }

            log.info("UserToBeCreated is [" + MvcHelper.deepToString(userToBeUpdated) + "]");
            userToBeUpdated.setPassword(MD5Util.convertToMD5(userToBeUpdated.getPassword()));

            Document fileUploading = Util.readDocumentFromRequestIfExist(profilePicture);
            if (fileUploading != null) {
                fileUploading.setDocumentId(dbUser.getProfilePicDocumentId());
                userToBeUpdated.setProfilePicDocument(fileUploading);
                userToBeUpdated.setProfilePicDocumentId(fileUploading.getDocumentId());
            }

            int updateStatus = this.userService.updateCompleteUser(userToBeUpdated);

            responseMessage.setOverAllStatus(Boolean.TRUE);
            responseMessage.setMessage("User Updated successfully");
            responseMessage.setData(userToBeUpdated);

        } catch (IllegalArgumentException e) {
            log.info("ERROR : " + e.getMessage());
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage(e.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            responseMessage.setStatusCode(HttpServletResponse.SC_BAD_REQUEST);
        } catch (IllegalStateException e) {
            log.info("ERROR : " + e.getMessage());
            responseMessage.setOverAllStatus(false);
            responseMessage.setMessage("The file to be uploaded exceeds its maximum permitted size of 51200 bytes - " + e.getMessage());
            response.setStatus(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);
            responseMessage.setStatusCode(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);
        }
        return responseMessage;
    }
}
