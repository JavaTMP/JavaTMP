package com.javatmp.fw.domain.table;

import java.util.HashMap;
import java.util.Map;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class FilterBy {

    private Map<String, String> mapOfFilters = new HashMap<String, String>();
    private boolean globalSearch;

    public FilterBy() {
    }
}
