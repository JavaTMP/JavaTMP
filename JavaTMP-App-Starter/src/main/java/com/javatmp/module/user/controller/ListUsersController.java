package com.javatmp.module.user.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.fw.mvc.MvcHelper;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import java.io.IOException;
import java.text.ParseException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
public class ListUsersController {

    @Autowired
    UserService userService;

    @PostMapping(value = "/user/ListUsersController", produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    ResponseMessage doPost(@RequestBody DataTableRequest tableRequest, HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException {

        ResponseMessage responseMessage = new ResponseMessage();
        log.info("datatableRequest [" + MvcHelper.deepToString(tableRequest) + "]");
        DataTableResults<User> dataTableResult = this.userService.listAllUsers(tableRequest);
        responseMessage.setOverAllStatus(true);
        responseMessage.setData(dataTableResult);
        return responseMessage;
    }
}
