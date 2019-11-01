package javatmp.frontend;

import java.util.List;

/**
 *
 * @author JavaTMP
 */
class QueryBuilder {

    private Boolean not;
    private String condition;
    private Boolean valid;
    private List<Filter> rules;

    /**
     * @return the valid
     */
    public Boolean getValid() {
        return valid;
    }

    /**
     * @param valid the valid to set
     */
    public void setValid(Boolean valid) {
        this.valid = valid;
    }

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
    public List<Filter> getRules() {
        return rules;
    }

    /**
     * @param rules the rules to set
     */
    public void setRules(List<Filter> rules) {
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

}
