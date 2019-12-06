package com.javatmp.frontend;

import java.util.List;

/**
 *
 * @author JavaTMP
 */
class RuleOrGroup {

    private Boolean not;
    private String condition;
    private List<RuleOrGroup> rules;

    private String id;
    private String field;
    private String type;
    private String operator;
    private Object value;

    /**
     * @return the condition
     */
    public String getCondition() {
        return condition;
    }

    /**
     * @param condition the condition to set
     */
    public void setCondition(String condition) {
        this.condition = condition;
    }

    /**
     * @return the rules
     */
    public List<RuleOrGroup> getRules() {
        return rules;
    }

    /**
     * @param rules the rules to set
     */
    public void setRules(List<RuleOrGroup> rules) {
        this.rules = rules;
    }

    /**
     * @return the not
     */
    public Boolean getNot() {
        return not;
    }

    /**
     * @param not the not to set
     */
    public void setNot(Boolean not) {
        this.not = not;
    }

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the field
     */
    public String getField() {
        return field;
    }

    /**
     * @param field the field to set
     */
    public void setField(String field) {
        this.field = field;
    }

    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * @return the operator
     */
    public String getOperator() {
        return operator;
    }

    /**
     * @param operator the operator to set
     */
    public void setOperator(String operator) {
        this.operator = operator;
    }

    /**
     * @return the value
     */
    public Object getValue() {
        return value;
    }

    /**
     * @param value the value to set
     */
    public void setValue(Object value) {
        this.value = value;
    }
}
