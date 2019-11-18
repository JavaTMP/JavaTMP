package com.javatmp.fw.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class ResponseMessage {

    private boolean overAllStatus;
    private String title;
    private String message;
    private Integer statusCode;
    private Boolean redirect;
    private String redirectURL;
    private Object data;

    public ResponseMessage() {
    }

    public ResponseMessage(boolean overAllStatus, String message, Integer statusCode) {
        this.overAllStatus = overAllStatus;
        this.message = message;
        this.statusCode = statusCode;
    }

    public ResponseMessage(boolean overAllStatus, Integer statusCode) {
        this.overAllStatus = overAllStatus;
        this.message = null;
        this.statusCode = statusCode;
    }
}
