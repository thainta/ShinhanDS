package com.likelion.week81_82.service.Impl;

import com.likelion.week81_82.dto.EmployeeDto;
import com.likelion.week81_82.service.EmployeeService;
import org.springframework.stereotype.Service;

@Service
public class EmployeeServiceImpl implements EmployeeService{
    @Override
    public EmployeeDto getEmployeeDto(EmployeeDto employeeDto) {
        return employeeDto;
    }
}
