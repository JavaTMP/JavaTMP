package com.javatmp.mvc.domain;

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

    /**
     * @return the overAllStatus
     */
    public boolean getOverAllStatus() {
        return overAllStatus;
    }

    /**
     * @param overAllStatus the overAllStatus to set
     */
    public void setOverAllStatus(boolean overAllStatus) {
        this.overAllStatus = overAllStatus;
    }

    /**
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * @return the statusCode
     */
    public Integer getStatusCode() {
        return statusCode;
    }

    /**
     * @param statusCode the statusCode to set
     */
    public void setStatusCode(Integer statusCode) {
        this.statusCode = statusCode;
    }

    /**
     * @return the redirectURL
     */
    public String getRedirectURL() {
        return redirectURL;
    }

    /**
     * @param redirectURL the redirectURL to set
     */
    public void setRedirectURL(String redirectURL) {
        this.redirectURL = redirectURL;
    }

    /**
     * @return the redirect
     */
    public Boolean getRedirect() {
        return redirect;
    }

    /**
     * @param redirect the redirect to set
     */
    public void setRedirect(Boolean redirect) {
        this.redirect = redirect;
    }

    /**
     * @return the data
     */
    public Object getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(Object data) {
        this.data = data;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

}
