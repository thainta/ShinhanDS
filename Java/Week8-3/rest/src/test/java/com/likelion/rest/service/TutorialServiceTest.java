package com.likelion.rest.service;

import com.likelion.rest.entity.Tutorial;
import com.likelion.rest.repository.TutorialRepository;
import com.likelion.rest.service.Impl.TutorialServiceImpl;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class TutorialServiceTest {
    @Mock
    TutorialRepository tutorialRepository;

    @InjectMocks
    TutorialServiceImpl tutorialService;
    @BeforeEach
    void setUp() {
    }

    @AfterEach
    void tearDown() {
    }

    @Test
    void getTutorialById() {
        Tutorial testTutorial = new Tutorial(1,"title", "description", false);
        when(tutorialRepository.getReferenceById(anyLong())).thenReturn(testTutorial);
        Tutorial tutorialResponse = tutorialService.getTutorialById(1);
        assertEquals(testTutorial, tutorialResponse);
    }

    @Test
    void addTutorial() {
        Tutorial testTutorial = new Tutorial(1,"title", "description", false);
        when(tutorialRepository.save(any(Tutorial.class))).thenReturn(testTutorial);
        Tutorial tutorialResponse = tutorialService.addTutorial(testTutorial);
        assertEquals(testTutorial.getId(), tutorialResponse.getId());
    }

    @Test
    void updateTutorial() {
        Tutorial testTutorial = new Tutorial(1,"title", "description", false);
        Tutorial newTutorial = new Tutorial(1,"new title", "new description", false);

        when(tutorialRepository.getReferenceById(anyLong())).thenReturn(testTutorial);
        when(tutorialRepository.save(any(Tutorial.class))).thenReturn(newTutorial);

        Tutorial tutorialResponse = tutorialService.updateTutorial(1, newTutorial);

        assertEquals(newTutorial.getDescription(), tutorialResponse.getDescription());
    }


    @Test
    void removeTutorialById() {
        tutorialService.removeTutorialById(1L);
        verify(tutorialRepository, times(1)).deleteById(1L);
    }

}