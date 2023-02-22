package com.likelion.rest.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.likelion.rest.entity.Tutorial;
import com.likelion.rest.service.TutorialService;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.Mockito.when;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@ExtendWith(SpringExtension.class)
@WebMvcTest(TutorialController.class)
class TutorialControllerTest {

    @Autowired
    MockMvc mockMvc;
    @MockBean
    private TutorialService tutorialService;

    @BeforeEach
    void setUp() {
    }

    @AfterEach
    void tearDown() {
    }

    @Test
    void getTutorialsById() throws Exception {
        Tutorial tutorial = new Tutorial(1, "Title", "description", true);

        when(tutorialService.getTutorialById(1L)).thenReturn(tutorial);

        MockHttpServletResponse response = mockMvc.perform(get("/api/tutorials/1")
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andDo(print()).andExpect(status().isOk())
                .andReturn()
                .getResponse();
    }

    @Test
    void addTutorialTest() throws Exception {
        Tutorial tutorial = new Tutorial(1, "Title", "description", true);

        when(tutorialService.addTutorial(any(Tutorial.class))).thenReturn(tutorial);

        MockHttpServletResponse response = mockMvc.perform(post("/api/tutorials/")
                                                        .contentType(MediaType.APPLICATION_JSON)
                                                        .accept(MediaType.APPLICATION_JSON)
                                                        .content(asJsonString(tutorial)))
                                                .andDo(print()).andExpect(status().isCreated())
                                                .andReturn()
                                                .getResponse();
    }

    @Test
    void updateTutorial() throws Exception {
        long id = 1;
        Tutorial testTutorial = new Tutorial(id,"title", "description", false);
        String testJSONContentString = asJsonString(testTutorial);

        when(tutorialService.updateTutorial(anyLong(), any(Tutorial.class)))
                .thenReturn(testTutorial);

        RequestBuilder requestBuilder = put("/api/tutorials/" + id)
                .accept(MediaType.APPLICATION_JSON)
                .content(testJSONContentString)
                .contentType(MediaType.APPLICATION_JSON);

        mockMvc.perform(requestBuilder).andDo(print()).andExpect(status().isOk()).andReturn();
    }
    public static String asJsonString(final Object obj) {
        try {
            return new ObjectMapper().writeValueAsString(obj);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    @Test
    void deleteTutorialById() throws Exception {
        mockMvc.perform(delete("/api/tutorials/1")).andDo(print());
    }
}