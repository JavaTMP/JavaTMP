package com.javatmp.mvc.domain.table;

public class Search {

    private String value;
    private Boolean regex;
    private String operatorType;

    public Search() {
    }

    public Search(String value, Boolean regex) {
        this.value = value;
        this.regex = regex;
    }

    /**
     * @return the value
     */
    public String getValue() {
        return value;
    }

    /**
     * @param value the value to set
     */
    public void setValue(String value) {
        this.value = value;
    }

    /**
     * @return the regex
     */
    public Boolean getRegex() {
        return regex;
    }

    /**
     * @param regex the regex to set
     */
    public void setRegex(Boolean regex) {
        this.regex = regex;
    }

    @Override
    public String toString() {
        return "(value[" + this.value + "], operatorType[" + this.operatorType + "], regex[" + this.regex + "])";
    }

    /**
     * @return the operatorType
     */
    public String getOperatorType() {
        return operatorType;
    }

    /**
     * @param operatorType the operatorType to set
     */
    public void setOperatorType(String operatorType) {
        this.operatorType = operatorType;
    }

}
