package com.likelion.shinhandsweek93.entity;

import lombok.*;

import javax.persistence.*;

@Entity
@Data
@Table(name = "user_db")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class User {
    @Id
    @GeneratedValue
    private Long id;

    @Column(nullable = false, unique = true)
    private String username;

    @Column(nullable = false, unique = true)
    private String password;
}
