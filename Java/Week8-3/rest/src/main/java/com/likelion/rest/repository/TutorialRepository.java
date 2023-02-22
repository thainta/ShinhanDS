package com.likelion.rest.repository;

import com.likelion.rest.entity.Tutorial;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TutorialRepository extends JpaRepository<Tutorial, Long> {
    List<Tutorial> findByPublishedStatus(boolean published);

    List<Tutorial> findAllByTitleContaining(String keyword);
}
