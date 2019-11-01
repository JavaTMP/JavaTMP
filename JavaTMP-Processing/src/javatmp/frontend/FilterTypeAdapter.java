package javatmp.frontend;

import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParseException;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import java.lang.reflect.Type;

public class FilterTypeAdapter implements JsonSerializer<Filter>, JsonDeserializer<Filter> {

    @Override
    public JsonElement serialize(Filter src, Type typeOfSrc, JsonSerializationContext context) {
        System.out.println("FilterTypeAdapter serialize typeofsrc = [" + typeOfSrc + "] actual [" + src.getClass().getName() + "]");
        return context.serialize(src);
    }

    @Override
    public Filter deserialize(JsonElement json, Type typeOfSrc, JsonDeserializationContext context)
            throws JsonParseException {
        System.out.println("FilterTypeAdapter deserialize typeof src = " + typeOfSrc + "]");
        JsonObject node = (JsonObject) json;
        System.out.println("size = " + node.size());
        Class actualClassName = null;
        if ((node.size() == 2 || node.size() == 3) && node.has("condition") && node.has("rules")) {
            actualClassName = Group.class;
        } else if ((node.size() == 6) && true) {
            actualClassName = Rule.class;
        }
        System.out.println("actualClassName [" + actualClassName + "]");
        return context.deserialize(json, actualClassName);
    }

}
