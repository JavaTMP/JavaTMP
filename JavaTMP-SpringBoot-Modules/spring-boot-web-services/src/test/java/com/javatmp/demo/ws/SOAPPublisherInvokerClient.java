package com.javatmp.demo.ws;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Arrays;

@SpringBootTest
@Slf4j
class SOAPPublisherInvokerClient {

    @Test
    void invoke() throws MalformedURLException {
        log.debug("*** SpringBoot Test Context Load 1 ***");
        URL wsdlURL = new URL("http://localhost:8888/ws/person?wsdl");
        //check above URL in browser, you should see WSDL file

        //creating QName using targetNamespace and name
        QName qname = new QName("http://ws.demo.javatmp.com/", "PersonServiceImplService");

        Service service = Service.create(wsdlURL, qname);

        //We need to pass interface and model beans to client
        PersonService ps = service.getPort(PersonService.class);

        Person p1 = new Person(); p1.setName("JavaTMP"); p1.setId(1); p1.setAge(30);
        Person p2 = new Person(); p2.setName("Bootstrap"); p2.setId(2); p2.setAge(25);

        //add person
        log.debug("Add Person Status : {}", ps.addPerson(p1));
        log.debug("Add Person Status : {}", ps.addPerson(p2));

        //get person
        log.debug("get person : {}", ps.getPerson(1));

        //get all persons
        log.debug("get all persons : {}", Arrays.asList(ps.getAllPersons()));

        //delete person
        log.debug("Delete Person Status : {}", ps.deletePerson(2));

        //get all persons
        log.debug("get all persons : {}", Arrays.asList(ps.getAllPersons()));
    }

}
