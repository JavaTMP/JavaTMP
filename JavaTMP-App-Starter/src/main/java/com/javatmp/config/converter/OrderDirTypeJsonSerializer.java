/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.config.converter;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.javatmp.fw.domain.table.OrderDir;
import java.io.IOException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.jackson.JsonComponent;

@Slf4j
@JsonComponent
public class OrderDirTypeJsonSerializer extends JsonSerializer<OrderDir> {

    @Override
    public void serialize(OrderDir en, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException,
            JsonProcessingException {
        log.debug("******* >>>> order value [" + en.value() + "]");
        jsonGenerator.writeString(en.value());
    }
}
