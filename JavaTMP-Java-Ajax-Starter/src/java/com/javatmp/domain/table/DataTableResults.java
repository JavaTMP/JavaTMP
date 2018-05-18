package com.javatmp.domain.table;

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
    private List<T> data;

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
     * @return the data
     */
    public List<T> getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(List<T> data) {
        this.data = data;
    }

}
