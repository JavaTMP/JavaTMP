package com.javatmp.domain.table;

public class Order {

    private Integer column;
    private OrderDir dir;

    public Order() {
    }

    public Order(Integer column, OrderDir dir) {
        this.column = column;
        this.dir = dir;
    }

    /**
     * @return the column
     */
    public Integer getColumn() {
        return column;
    }

    /**
     * @param column the column to set
     */
    public void setColumn(Integer column) {
        this.column = column;
    }

    /**
     * @return the dir
     */
    public OrderDir getDir() {
        return dir;
    }

    /**
     * @param dir the dir to set
     */
    public void setDir(OrderDir dir) {
        this.dir = dir;
    }

}
