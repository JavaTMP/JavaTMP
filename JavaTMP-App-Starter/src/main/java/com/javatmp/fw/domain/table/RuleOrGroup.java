package com.javatmp.fw.domain.table;

import java.util.List;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class RuleOrGroup {

    private Boolean not;
    private String condition;
    private List<RuleOrGroup> rules;

    private String id;
    private String field;
    private String type;
    private String operator;
    private Object value;
}
