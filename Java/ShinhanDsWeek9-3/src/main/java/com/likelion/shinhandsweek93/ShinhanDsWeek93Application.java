package com.likelion.shinhandsweek93;

import com.likelion.shinhandsweek93.entity.User;
import com.likelion.shinhandsweek93.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootApplication
public class ShinhanDsWeek93Application implements CommandLineRunner {

    public static void main(String[] args) {
        SpringApplication.run(ShinhanDsWeek93Application.class, args);
    }

    @Autowired
    UserRepository userRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Override
    public void run(String... args) throws Exception {
        User user = new User();

        user.setUsername("username");
        user.setPassword(passwordEncoder.encode("123"));
        userRepository.save(user);

        System.out.println(user);
    }
}
