package com.likelion.websocket.controller;

import com.likelion.websocket.config.DynamicTopicConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
public class DynamicTopicController {
    @Autowired
    private DynamicTopicConfig dynamicTopicConfig;
    @PostMapping("createTopic")
    public ResponseEntity<String> createTopic(@RequestParam String topicName){
        //NewTopic newTopic = new NewTopic(topicName, 1, (short) 1);
        dynamicTopicConfig.createTopicDynamic(topicName);
        return ResponseEntity.ok("Topic " + topicName + " created successfully.");
    }
    @ResponseBody
    @DeleteMapping("deleteTopic")
    public ResponseEntity<String> deleteTopic(@RequestParam String topicName) {
        dynamicTopicConfig.deleteTopicDynamic(topicName);
        return new ResponseEntity(HttpStatus.NO_CONTENT);
    }
}
