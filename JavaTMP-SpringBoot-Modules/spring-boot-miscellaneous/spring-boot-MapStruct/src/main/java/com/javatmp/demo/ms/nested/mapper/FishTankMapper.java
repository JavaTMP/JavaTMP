/*
 * Copyright MapStruct Authors.
 *
 * Licensed under the Apache License version 2.0, available at http://www.apache.org/licenses/LICENSE-2.0
 */
package com.javatmp.demo.ms.nested.mapper;

import com.javatmp.demo.ms.nested.dto.FishTankDto;
import com.javatmp.demo.ms.nested.model.FishTank;
import org.mapstruct.InheritInverseConfiguration;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

/**
 *
 * @author Sjaak Derksen
 */
@Mapper
public interface FishTankMapper {

    FishTankMapper INSTANCE = Mappers.getMapper( FishTankMapper.class );

     @Mapping(target = "fish.kind", source = "fish.type")
     @Mapping(target = "fish.name", ignore = true)
     @Mapping(target = "ornament", source = "interior.ornament")
     @Mapping(target = "material.materialType", source = "material")
     @Mapping(target = "quality.report.organisation.name", source = "quality.report.organisationName")
     FishTankDto map(FishTank source);

    @Mapping(target = "fish.kind", source = "source.fish.type")
    @Mapping(target = "fish.name", ignore = true)
    @Mapping(target = "ornament", source = "source.interior.ornament")
    @Mapping(target = "material.materialType", source = "source.material")
    @Mapping(target = "quality.report.organisation.name", source = "source.quality.report.organisationName")
    FishTankDto mapAsWell(FishTank source);

    @InheritInverseConfiguration( name = "map" )
    FishTank map(FishTankDto source);

}
