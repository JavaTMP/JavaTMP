package javatmp.frontend;

import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import java.lang.reflect.Type;

public class ValueTypeAdapter implements JsonSerializer<Value>, JsonDeserializer<Value> {

    @Override
    public JsonElement serialize(Value src, Type typeOfSrc, JsonSerializationContext context) {
        System.out.println("ValueTypeAdapter serialize typeofsrc = [" + typeOfSrc + "] actual [" + src.getClass().getName() + "]");
        System.out.println("value src [" + src + "] content [" + src.getOriginal() + "]");
        return new JsonPrimitive(src.getOriginal());
    }

    @Override
    public Value deserialize(JsonElement json, Type typeOfSrc, JsonDeserializationContext context)
            throws JsonParseException {
        System.out.println("ValueTypeAdapter deserialize typeof src = " + typeOfSrc + "]");
        System.out.println("ValueTypeAdapter deserialize typeof json = [" + json + "]");
        System.out.println("ValueTypeAdapter deserialize typeof json as string = [" + json.getAsString() + "]");
        Value value = new Value();
        if (json.isJsonPrimitive()) {
            value.setOriginal(json.getAsString());
        } else {
            value.setOriginal(json.getAsString());
        }
        return value;
    }

}
