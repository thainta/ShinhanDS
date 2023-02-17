package com.likelion.week81_82.dto;

import lombok.*;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class EmployeeDto {
    @NotNull(message="Id cannot be null")
    private long employeeId;
    @NotEmpty(message = "Name cannot be empty")
    @Size(min = 10, max = 50, message="Department name must be at least 10 characters and at most 50 characters")
    private String name;
    private Date birthDate;
    private String gender;
    @Email(message = "Email is not valid"   )
    @NotEmpty(message = "Email cannot be empty")
    private String email;
}
