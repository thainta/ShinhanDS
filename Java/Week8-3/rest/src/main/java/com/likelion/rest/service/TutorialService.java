package com.likelion.rest.service;



import com.likelion.rest.entity.Tutorial;

import java.util.List;

public interface TutorialService {
    List<Tutorial> getAllTutorials();
    Tutorial getTutorialById(long id);

    Tutorial addTutorial(Tutorial tutorial);

    Tutorial updateTutorial(long id, Tutorial tutorial);

    void removeAllTutorial();

    void removeTutorialById(long id);

    List<Tutorial> getTutorialIsPublished(boolean isPublished);

    List<Tutorial> getTutorialByKeyword(String keyword);

}
