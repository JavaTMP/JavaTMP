package com.javatmp.demo.rest;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Data
@NoArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class RestDto {
    private int intField;
    private Integer integerField;
    private String stringField;
    private Date date;
    private LocalDate localDate;
    private LocalDateTime localDateTime;
    private Boolean booleanField;
    private List<RestDto> restDtoList;
    private Map<Integer, RestDto> restDtoMap;
    private RestDto restDto;
}
