package com.likelion.rest.service.Impl;

import com.likelion.rest.entity.Tutorial;
import com.likelion.rest.repository.TutorialRepository;
import com.likelion.rest.service.TutorialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TutorialServiceImpl implements TutorialService {

    @Autowired
    TutorialRepository tutorialRepository;
    @Override
    public List<Tutorial> getAllTutorials() {
        return tutorialRepository.findAll();
    }

    @Override
    public Tutorial getTutorialById(long id) {
        return tutorialRepository.getReferenceById(id);
    }

    @Override
    public Tutorial addTutorial(Tutorial tutorial) {
        Tutorial newTutorial = new Tutorial();
        newTutorial.setId(tutorial.getId());
        newTutorial.setDescription(tutorial.getDescription());
        newTutorial.setTitle(tutorial.getTitle());
        newTutorial.setPublishedStatus(tutorial.isPublishedStatus());
        tutorialRepository.save(newTutorial);
        return newTutorial;
    }

    @Override
    public Tutorial updateTutorial(long id, Tutorial tutorial) {
        Tutorial newTutorial = tutorialRepository.getReferenceById(id);
        newTutorial.setDescription(tutorial.getDescription());
        newTutorial.setTitle(tutorial.getTitle());
        newTutorial.setPublishedStatus(tutorial.isPublishedStatus());

        tutorialRepository.save(newTutorial);
        return newTutorial;
    }

    @Override
    public void removeAllTutorial() {
        tutorialRepository.deleteAll();
    }

    @Override
    public void removeTutorialById(long id) {
        tutorialRepository.deleteById(id);
    }

    @Override
    public List<Tutorial> getTutorialIsPublished(boolean isPublished) {
        return tutorialRepository.findByPublishedStatus(isPublished);
    }
    @Override
    public List<Tutorial> getTutorialByKeyword(String keyword) {
        return tutorialRepository.findAllByTitleContaining(keyword);
    }
}
