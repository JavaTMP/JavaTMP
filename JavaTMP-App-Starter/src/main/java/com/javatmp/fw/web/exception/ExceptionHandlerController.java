package com.javatmp.fw.web.exception;

import com.javatmp.fw.domain.ResponseMessage;
import javax.persistence.PersistenceException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

@Slf4j
@ControllerAdvice
public class ExceptionHandlerController {

    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(PersistenceException.class)
    public @ResponseBody
    ResponseMessage handlePersistenceException(HttpServletRequest request, HttpServletResponse response,
            PersistenceException exception) {
        ResponseMessage responseMessage = new ResponseMessage();
        Throwable t = exception;
        while (t.getCause() != null) {
            t = t.getCause();
        }
        log.error("database related ex : {}", t.getMessage());
        responseMessage.setOverAllStatus(false);
        responseMessage.setMessage(t.getMessage());
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        responseMessage.setStatusCode(HttpServletResponse.SC_BAD_REQUEST);
        return responseMessage;

    }

    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(IllegalArgumentException.class)
    public @ResponseBody
    ResponseMessage handleIllegalArgumentException(HttpServletRequest request, HttpServletResponse response,
            IllegalArgumentException exception) {
        log.error("database related ex : {}", exception.getMessage());
        ResponseMessage responseMessage = new ResponseMessage();
        responseMessage.setOverAllStatus(false);
        responseMessage.setMessage(exception.getMessage());
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        responseMessage.setStatusCode(HttpServletResponse.SC_BAD_REQUEST);
        return responseMessage;

    }
}
