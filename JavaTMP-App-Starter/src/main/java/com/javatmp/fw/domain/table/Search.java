package com.javatmp.fw.domain.table;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
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
}
