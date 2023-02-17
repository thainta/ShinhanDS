package com.likelion.week81_82.dto;

import java.util.Date;
import java.util.List;

import lombok.*;

import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DepartmentDto {
    @NotNull(message="Id cannot be null")
    private long departmentId;
    @NotEmpty(message = "Name cannot be empty")
    @Size(min = 10, max = 50, message="Department name must be at least 10 characters and at most 50 characters")
    private String deptName;
    @NotEmpty(message = "Description cannot be empty")
    private String description;
    @Valid
    private List<EmployeeDto> employees;
}
