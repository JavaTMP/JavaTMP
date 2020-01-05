/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.config.converter;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.javatmp.fw.domain.table.OrderDir;
import java.io.IOException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.jackson.JsonComponent;

@Slf4j
@JsonComponent
public class OrderDirTypeJsonDeserializer extends JsonDeserializer<OrderDir> {

    @Override
    public OrderDir deserialize(JsonParser jsonParser,
            DeserializationContext deserializationContext) throws IOException,
            JsonProcessingException {
        log.debug("******* >>>> order value [" + jsonParser.getValueAsString() + "]");
        return OrderDir.fromValue(jsonParser.getValueAsString());
    }
}
