package com.likelion.rest.repository;

import com.likelion.rest.entity.Tutorial;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.junit.jupiter.api.Assertions.*;
@DataJpaTest
class TutorialRepositoryTest {
    @Autowired
    private TutorialRepository tutorialRepository;
    @BeforeEach
    void setUp() {
        tutorialRepository.save(new Tutorial(1, "title 1", "description 1", true));
        tutorialRepository.save(new Tutorial(2, "title 2", "description 2", true));
        tutorialRepository.save(new Tutorial(3, "title 3", "description 3", true));
    }

    @AfterEach
    void tearDown() {
        tutorialRepository.deleteAll();
    }

    @Test
    public void testSaveTutorial() {
        Tutorial tutorial = new Tutorial(4, "Java Tutorial", "This is a Java Tutorial", true);

        Tutorial saved = tutorialRepository.save(tutorial);

        assertEquals(saved, tutorialRepository.getReferenceById(4L));
    }

    @Test

    void findById() {
        assertNotNull(tutorialRepository.getReferenceById(1L));
    }
    @Test
    void deleteById() {
        tutorialRepository.deleteById(7L);
        assertThat(tutorialRepository.findById(7L)).isNotPresent();
    }

}