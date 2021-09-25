package com.javatmp.demo.rest.reactive;

import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RestDto {
    @EqualsAndHashCode.Include
    private Long id;
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
