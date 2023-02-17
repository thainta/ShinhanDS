package com.likelion.week81_82.controller;

import com.likelion.week81_82.dto.DepartmentDto;
import com.likelion.week81_82.dto.EmployeeDto;
import com.likelion.week81_82.service.DepartmentService;
import com.likelion.week81_82.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;
@RestController
@RequestMapping(value = "/api")
public class DepartmentController {
    @Autowired
    DepartmentService departmentService;
    @GetMapping("/department")
    public ResponseEntity getEmployee(@RequestBody @Valid DepartmentDto departmentDto, BindingResult bindingResult) {
        if(bindingResult.hasErrors()){
            Map<String, String> errors = new HashMap<>();
            bindingResult.getAllErrors().forEach((error) ->{

                String fieldName = ((FieldError) error).getField();
                String message = error.getDefaultMessage();
                errors.put(fieldName, message);
            });
            return new ResponseEntity<>(errors, HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(departmentService.getDepartmentDto(departmentDto), HttpStatus.OK);
    }
}
