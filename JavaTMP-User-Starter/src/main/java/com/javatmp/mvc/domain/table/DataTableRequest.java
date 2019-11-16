package com.javatmp.mvc.domain.table;

import java.util.List;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class DataTableRequest<T> {

    private Class<T> classType;
    private String[] selects;
    private String uniqueId;
    private Integer draw;
    private Integer start;
    private Integer length;
    private Search search;
    private boolean regex;
    private List<DataTableColumn> columns;
    private List<Order> order;
    private boolean isGlobalSearch;
    private RuleOrGroup advancedSearchQuery;
}
