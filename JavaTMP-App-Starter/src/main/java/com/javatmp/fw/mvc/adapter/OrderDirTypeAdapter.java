package com.javatmp.fw.mvc.adapter;

import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import com.javatmp.fw.domain.table.OrderDir;
import java.lang.reflect.Type;

public class OrderDirTypeAdapter implements JsonSerializer<OrderDir>, JsonDeserializer<OrderDir> {

    @Override
    public JsonElement serialize(OrderDir src, Type typeOfSrc, JsonSerializationContext context) {
        return new JsonPrimitive(src.value());
    }

    @Override
    public OrderDir deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
            throws JsonParseException {
        return OrderDir.fromValue(json.getAsString());
    }

}
