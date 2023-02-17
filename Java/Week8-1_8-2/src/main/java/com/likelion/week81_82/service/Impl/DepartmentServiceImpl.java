package com.likelion.week81_82.service.Impl;

import com.likelion.week81_82.dto.DepartmentDto;
import com.likelion.week81_82.service.DepartmentService;
import org.springframework.stereotype.Service;

@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Override
    public DepartmentDto getDepartmentDto(DepartmentDto departmentDto) {
        return departmentDto;
    }
}
