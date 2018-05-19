package com.javatmp.domain.table;

import java.util.List;

public class DataTableRequest {

    /**
     * The unique id.
     */
    private String uniqueId;

    /**
     * The draw.
     */
    private Integer draw;

    /**
     * The start.
     */
    private Integer start;

    /**
     * The length.
     */
    private Integer length;

    /**
     * The search.
     */
    private Search search;

    /**
     * The regex.
     */
    private boolean regex;

    /**
     * The columns.
     */
    private List<DataTableColumnSpecs> columns;

    /**
     * The order.
     */
    private List<Order> order;

    /**
     * The is global search.
     */
    private boolean isGlobalSearch;

    /**
     * Instantiates a new data table request.
     *
     * @param request the request
     */
    public DataTableRequest() {
    }

    /**
     * Gets the unique id.
     *
     * @return the uniqueId
     */
    public String getUniqueId() {
        return uniqueId;
    }

    /**
     * Sets the unique id.
     *
     * @param uniqueId the uniqueId to set
     */
    public void setUniqueId(String uniqueId) {
        this.uniqueId = uniqueId;
    }

    /**
     * Gets the start.
     *
     * @return the start
     */
    public Integer getStart() {
        return start;
    }

    /**
     * Sets the start.
     *
     * @param start the start to set
     */
    public void setStart(Integer start) {
        this.start = start;
    }

    /**
     * Gets the length.
     *
     * @return the length
     */
    public Integer getLength() {
        return length;
    }

    /**
     * Sets the length.
     *
     * @param length the length to set
     */
    public void setLength(Integer length) {
        this.length = length;
    }

    /**
     * Gets the search.
     *
     * @return the search
     */
    public Search getSearch() {
        return search;
    }

    /**
     * Sets the search.
     *
     * @param search the search to set
     */
    public void setSearch(Search search) {
        this.search = search;
    }

    /**
     * Checks if is regex.
     *
     * @return the regex
     */
    public boolean isRegex() {
        return regex;
    }

    /**
     * Sets the regex.
     *
     * @param regex the regex to set
     */
    public void setRegex(boolean regex) {
        this.regex = regex;
    }

    /**
     * Gets the columns.
     *
     * @return the columns
     */
    public List<DataTableColumnSpecs> getColumns() {
        return columns;
    }

    /**
     * Sets the columns.
     *
     * @param columns the columns to set
     */
    public void setColumns(List<DataTableColumnSpecs> columns) {
        this.columns = columns;
    }

    /**
     * Gets the order.
     *
     * @return the order
     */
    public List<Order> getOrder() {
        return order;
    }

    /**
     * Sets the order.
     *
     * @param order the order to set
     */
    public void setOrder(List<Order> order) {
        this.order = order;
    }

    /**
     * Gets the draw.
     *
     * @return the draw
     */
    public Integer getDraw() {
        return draw;
    }

    /**
     * Sets the draw.
     *
     * @param draw the draw to set
     */
    public void setDraw(Integer draw) {
        this.draw = draw;
    }

    /**
     * Checks if is global search.
     *
     * @return the isGlobalSearch
     */
    public boolean isGlobalSearch() {
        return isGlobalSearch;
    }

    /**
     * Sets the global search.
     *
     * @param isGlobalSearch the isGlobalSearch to set
     */
    public void setGlobalSearch(boolean isGlobalSearch) {
        this.isGlobalSearch = isGlobalSearch;
    }

    /**
     * The max params to check.
     */
    private int maxParamsToCheck = 0;

}
