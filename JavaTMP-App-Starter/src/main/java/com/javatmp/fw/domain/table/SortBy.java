package com.javatmp.fw.domain.table;

import java.util.HashMap;
import java.util.Map;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class SortBy {

    private Map<String, OrderDir> mapOfSorts = new HashMap<String, OrderDir>();

    public SortBy() {
    }

    public Map<String, OrderDir> getSortBys() {
        return mapOfSorts;
    }

    /**
     * Adds the sort.
     *
     * @param sortBy the sort by
     */
    public void addSort(String sortBy) {
        mapOfSorts.put(sortBy, OrderDir.ASC);
    }

    /**
     * Adds the sort.
     *
     * @param sortBy the sort by
     * @param sortOrder the sort order
     */
    public void addSort(String sortBy, OrderDir sortOrder) {
        mapOfSorts.put(sortBy, sortOrder);
    }

}
