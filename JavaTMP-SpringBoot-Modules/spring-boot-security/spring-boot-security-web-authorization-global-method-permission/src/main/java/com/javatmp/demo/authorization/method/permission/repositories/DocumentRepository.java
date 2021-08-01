package com.javatmp.demo.authorization.method.permission.repositories;

import com.javatmp.demo.authorization.method.permission.model.Document;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class DocumentRepository {

    private Map<String, Document> documents;

    public DocumentRepository() {
        this.documents = new HashMap<>();
        this.documents.put("abc123", new Document("natalie"));
        this.documents.put("qwe123", new Document("natalie"));
        this.documents.put("asd555", new Document("emma"));
    }

    public Document findDocument(String code) {
        return documents.get(code);
    }
}
