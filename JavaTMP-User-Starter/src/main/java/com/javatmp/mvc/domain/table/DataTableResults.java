package com.javatmp.mvc.domain.table;

import java.util.List;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class DataTableResults<T> {

    private Integer draw;
    private Long recordsFiltered;
    private Long recordsTotal;
    private List<T> data;
}
