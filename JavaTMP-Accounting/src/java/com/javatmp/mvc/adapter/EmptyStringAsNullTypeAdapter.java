package com.javatmp.mvc.adapter;

import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;
import com.google.gson.JsonPrimitive;
import java.lang.reflect.Type;
import java.util.logging.Level;
import java.util.logging.Logger;

public final class EmptyStringAsNullTypeAdapter<T>
        implements JsonDeserializer<T> {

    // Let Gson instantiate it itself
    public EmptyStringAsNullTypeAdapter() {
    }

    @Override
    public T deserialize(final JsonElement jsonElement, final Type type, final JsonDeserializationContext context)
            throws JsonParseException {
        T ret = null;
        String tempValue = jsonElement.getAsString();
        System.out.println("teemp [" + tempValue + "] type [" + type.getTypeName() + "]");
        if (tempValue == null || tempValue.trim().equals("")) {
            return null;
        } else {

        }
        return ret;
    }

}
