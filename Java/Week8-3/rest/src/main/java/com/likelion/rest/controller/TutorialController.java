package com.likelion.rest.controller;

import com.likelion.rest.entity.Tutorial;
import com.likelion.rest.service.TutorialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/api")
public class TutorialController {
    @Autowired
    private TutorialService tutorialService;

    @GetMapping(value="/tutorials")
    public ResponseEntity<List<Tutorial>> getAllTutorials(@RequestParam(value ="title", required = false) String keyword){
        if(keyword == null)
            return new ResponseEntity<>(tutorialService.getAllTutorials(), HttpStatus.OK);
        else
            return new ResponseEntity<>(tutorialService.getTutorialByKeyword(keyword), HttpStatus.OK);
    }

    @GetMapping(value="/tutorials/{id}")
    public ResponseEntity<Tutorial> getTutorialsById(@PathVariable(name = "id") long id){
        try{
            return new ResponseEntity<>(tutorialService.getTutorialById(id), HttpStatus.OK);
        }
        catch (Exception e){
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

    @PostMapping(value="/tutorials")
    public ResponseEntity<Tutorial> addTutorial(@RequestBody Tutorial tutorial){
        return new ResponseEntity<>(tutorialService.addTutorial(tutorial), HttpStatus.CREATED);
    }

    @PutMapping(value="/tutorials/{id}")
    public ResponseEntity<Tutorial> updateTutorial(@PathVariable(name = "id") long id, @RequestBody Tutorial tutorial){
        try{
            return new ResponseEntity<>(tutorialService.updateTutorial(id, tutorial), HttpStatus.OK);
        }
        catch (Exception e){
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

    @DeleteMapping(value="/tutorials/{id}")
    public ResponseEntity deleteTutorialById(@PathVariable(name = "id") long id){
        try{
            tutorialService.removeTutorialById(id);
            return ResponseEntity.ok().body("The tutorial with id: " + id + " was deleted");
        }
        catch (Exception e){
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

    @DeleteMapping(value="/tutorials/")
    public ResponseEntity deleteAllTutorial(){
        try{
            tutorialService.removeAllTutorial();
            return ResponseEntity.ok().body("All tutorials was deleted");
        }
        catch (Exception e){
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

    @GetMapping(value="/tutorials/published")
    public ResponseEntity<List<Tutorial>> getAllTutorialIsPublished(){
        try{
            return new ResponseEntity<>(tutorialService.getTutorialIsPublished(true), HttpStatus.OK);
        }
        catch (Exception e){
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

}
