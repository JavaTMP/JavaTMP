package com.javatmp.domain.table;

import java.util.HashMap;
import java.util.Map;

public class SortBy {

    /**
     * The map of sorts.
     */
    private Map<String, OrderDir> mapOfSorts;

    /**
     * Instantiates a new sort by.
     */
    public SortBy() {
        if (null == mapOfSorts) {
            mapOfSorts = new HashMap<String, OrderDir>();
        }
    }

    /**
     * Gets the sort bys.
     *
     * @return the sortBys
     */
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
