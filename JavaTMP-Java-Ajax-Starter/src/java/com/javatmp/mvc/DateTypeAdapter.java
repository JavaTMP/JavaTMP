package com.javatmp.mvc;

import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import java.lang.reflect.Type;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class DateTypeAdapter implements JsonDeserializer<Date> {

    @Override
    public Date deserialize(JsonElement element, Type arg1, JsonDeserializationContext arg2) throws JsonParseException {
        String date = element.getAsString();

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");

//        format.setTimeZone(TimeZone.getTimeZone("UTC"));
        try {
            System.out.println("original datestr [" + date + "] Converted to [" + format.parse(date) + "]");
            return format.parse(date);
        } catch (ParseException exp) {
            exp.printStackTrace();
            return null;
        }
    }

//    @Override
//    public JsonElement serialize(Date src, Type typeOfSrc, JsonSerializationContext context) {
//        String date;
//        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
//        format.setTimeZone(TimeZone.getTimeZone("UTC"));
//        date = format.format(src);
//        System.out.println("original datestr [" + date + "] Converted to [" + format.parse(date) + "]");
//        return new JsonPrimitive(date);
//    }
}
