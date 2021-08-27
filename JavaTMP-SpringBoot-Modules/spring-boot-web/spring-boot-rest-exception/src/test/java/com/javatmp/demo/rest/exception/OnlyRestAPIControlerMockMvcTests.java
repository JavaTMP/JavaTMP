package com.javatmp.demo.rest.exception;

import com.javatmp.demo.rest.exception.RestAPIController;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
@AutoConfigureMockMvc
@WebMvcTest(RestAPIController.class)
public class OnlyRestAPIControlerMockMvcTests {

    @Autowired
    private MockMvc mockMvc;

    @Test
    public void testGet() throws Exception {
        this.mockMvc.perform(MockMvcRequestBuilders.get("/rest/get").accept(MediaType.APPLICATION_JSON))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andDo(MockMvcResultHandlers.print())
                .andReturn();
    }

    @Test
    public void testGet1() throws Exception {
        this.mockMvc.perform(MockMvcRequestBuilders.get("/rest/get/1").accept(MediaType.APPLICATION_JSON))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andDo(MockMvcResultHandlers.print())
                .andReturn();
    }
}
