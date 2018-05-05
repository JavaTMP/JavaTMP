package com.javatmp.domain.table;

import com.google.gson.Gson;
import com.google.gson.annotations.SerializedName;
import java.util.List;

public class DataTableResults<T> {

    /**
     * The draw.
     */
    private Integer draw;

    /**
     * The records filtered.
     */
    private Long recordsFiltered;

    /**
     * The records total.
     */
    private Long recordsTotal;

    /**
     * The list of data objects.
     */
    @SerializedName("data")
    List<T> listOfDataObjects;

    public String getJson() {
        return new Gson().toJson(this);
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
     * Gets the records filtered.
     *
     * @return the recordsFiltered
     */
    public Long getRecordsFiltered() {
        return recordsFiltered;
    }

    /**
     * Sets the records filtered.
     *
     * @param recordsFiltered the recordsFiltered to set
     */
    public void setRecordsFiltered(Long recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }

    /**
     * Gets the records total.
     *
     * @return the recordsTotal
     */
    public Long getRecordsTotal() {
        return recordsTotal;
    }

    /**
     * Sets the records total.
     *
     * @param recordsTotal the recordsTotal to set
     */
    public void setRecordsTotal(Long recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    /**
     * Gets the list of data objects.
     *
     * @return the listOfDataObjects
     */
    public List<T> getListOfDataObjects() {
        return listOfDataObjects;
    }

    /**
     * Sets the list of data objects.
     *
     * @param listOfDataObjects the listOfDataObjects to set
     */
    public void setListOfDataObjects(List<T> listOfDataObjects) {
        this.listOfDataObjects = listOfDataObjects;
    }

}
