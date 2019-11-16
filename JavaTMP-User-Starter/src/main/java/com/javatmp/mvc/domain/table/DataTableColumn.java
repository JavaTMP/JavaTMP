package com.javatmp.mvc.domain.table;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class DataTableColumn {

    private int index;
    private String data;
    @EqualsAndHashCode.Include
    private String name;
    private boolean searchable;
    private boolean orderable;
    private Search search;
    private boolean regex;
    private String sortDir;

    public DataTableColumn(int index, String name) {
        this.setIndex(index);
        this.setName(name);
    }
}
