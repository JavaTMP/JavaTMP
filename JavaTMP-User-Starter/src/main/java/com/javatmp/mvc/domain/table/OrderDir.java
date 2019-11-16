package com.javatmp.mvc.domain.table;

public enum OrderDir {

    ASC("asc"),
    DESC("desc");

    private final String value;

    OrderDir(String v) {
        value = v;
    }

    public String value() {
        return value;
    }

    public static OrderDir fromValue(String v) {
        for (OrderDir c : OrderDir.values()) {
            if (c.name().toLowerCase().equals(v != null ? v.toLowerCase() : "")) {
                return c;
            }
        }
        throw new IllegalArgumentException(v);
    }

}
