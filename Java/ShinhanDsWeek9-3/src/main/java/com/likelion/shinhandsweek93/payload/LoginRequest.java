package com.likelion.shinhandsweek93.payload;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

@Getter
@Setter
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginRequest {
    private String username;

    private String password;
}