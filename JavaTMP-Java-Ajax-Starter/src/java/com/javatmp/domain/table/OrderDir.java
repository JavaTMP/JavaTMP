package com.javatmp.domain.table;

public enum OrderDir {

    /**
     * The asc.
     */
    ASC("asc"),
    /**
     * The desc.
     */
    DESC("desc");

    /**
     * The value.
     */
    private final String value;

    /**
     * Instantiates a new sort order.
     *
     * @param v the v
     */
    OrderDir(String v) {
        value = v;
    }

    /**
     * From value.
     *
     * @param v the v
     * @return the sort order
     */
    public static OrderDir fromValue(String v) {
        for (OrderDir c : OrderDir.values()) {
            if (c.name().toLowerCase().equals(v != null ? v.toLowerCase() : "")) {
                return c;
            }
        }
        throw new IllegalArgumentException(v);
    }

    /**
     * Value.
     *
     * @return the string
     */
    public String value() {
        return value;
    }

}
