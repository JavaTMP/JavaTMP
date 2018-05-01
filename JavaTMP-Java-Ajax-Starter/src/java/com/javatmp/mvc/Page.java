/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.mvc;

import java.util.List;

public class Page<T> {

    private Class<T> type;
    private T exampleObject;

    private List<T> records;
    private Integer numOfRowsPerPage;
    private Integer requestedPageNum;
    private Long allCount;

    private String sortColumn;
    private String sortOrder;

    private String[] selects;

    public Page(Class<T> type) {
        this.type = type;
    }

    public Page(Integer requestedInteger, Integer numberOfRowsPerPage, String sortColumn, String sortOrder) {
        this.requestedPageNum = requestedInteger;
        this.numOfRowsPerPage = numberOfRowsPerPage;
        this.sortColumn = sortColumn;
        this.sortOrder = sortOrder;
    }

    public Page(Integer requestedInteger, Integer numberOfRowsPerPage,
            String sortColumn, String sortOrder, Class<T> type) {
        this.requestedPageNum = requestedInteger;
        this.numOfRowsPerPage = numberOfRowsPerPage;
        this.sortColumn = sortColumn;
        this.sortOrder = sortOrder;
        this.type = type;
    }
//    private Integer from;// = (this.getRows() * this.getPage()) - this.getRows();

    /**
     * @return the from
     */
    public Integer getFrom() {
        return (this.getNumOfRowsPerPage() * this.getRequestedPageNum())
                - this.getNumOfRowsPerPage();
    }

    /**
     * @return the type
     */
    public Class<T> getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(Class<T> type) {
        this.type = type;
    }

    /**
     * @return the exampleObject
     */
    public T getExampleObject() {
        return exampleObject;
    }

    /**
     * @param exampleObject the exampleObject to set
     */
    public void setExampleObject(T exampleObject) {
        this.exampleObject = exampleObject;
    }

    /**
     * @return the records
     */
    public List<T> getRecords() {
        return records;
    }

    /**
     * @param records the records to set
     */
    public void setRecords(List<T> records) {
        this.records = records;
    }

    /**
     * @return the sortColumn
     */
    public String getSortColumn() {
        return sortColumn;
    }

    /**
     * @param sortColumn the sortColumn to set
     */
    public void setSortColumn(String sortColumn) {
        this.sortColumn = sortColumn;
    }

    /**
     * @return the sortOrder
     */
    public String getSortOrder() {
        return sortOrder;
    }

    /**
     * @param sortOrder the sortOrder to set
     */
    public void setSortOrder(String sortOrder) {
        this.sortOrder = sortOrder;
    }

    /**
     * @return the allCount
     */
    public Long getAllCount() {
        return allCount;
    }

    /**
     * @param allCount the allCount to set
     */
    public void setAllCount(Long allCount) {
        this.allCount = allCount;
    }

    /**
     * @return the requestedPageNum
     */
    public Integer getRequestedPageNum() {
        return requestedPageNum;
    }

    /**
     * @param requestedPageNum the requestedPageNum to set
     */
    public void setRequestedPageNum(Integer requestedPageNum) {
        this.requestedPageNum = requestedPageNum;
    }

    /**
     * @return the numOfRowsPerPage
     */
    public Integer getNumOfRowsPerPage() {
        return numOfRowsPerPage;
    }

    /**
     * @param numOfRowsPerPage the numOfRowsPerPage to set
     */
    public void setNumOfRowsPerPage(Integer numOfRowsPerPage) {
        this.numOfRowsPerPage = numOfRowsPerPage;
    }

    /**
     * @return the selects
     */
    public String[] getSelects() {
        return selects;
    }

    /**
     * @param selects the selects to set
     */
    public void setSelects(String[] selects) {
        this.selects = selects;
    }
}
