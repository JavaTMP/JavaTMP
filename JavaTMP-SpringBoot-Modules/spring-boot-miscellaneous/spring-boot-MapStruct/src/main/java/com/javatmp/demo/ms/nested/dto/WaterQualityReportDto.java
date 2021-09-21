/*
 * Copyright MapStruct Authors.
 *
 * Licensed under the Apache License version 2.0, available at http://www.apache.org/licenses/LICENSE-2.0
 */
package com.javatmp.demo.ms.nested.dto;

/**
 *
 * @author Sjaak Derksen
 */
public class WaterQualityReportDto {

    private WaterQualityOrganisationDto organisation;
    private String verdict;

    public WaterQualityOrganisationDto getOrganisation() {
        return organisation;
    }

    public void setOrganisation(WaterQualityOrganisationDto organisation) {
        this.organisation = organisation;
    }

    public String getVerdict() {
        return verdict;
    }

    public void setVerdict(String verdict) {
        this.verdict = verdict;
    }

}
