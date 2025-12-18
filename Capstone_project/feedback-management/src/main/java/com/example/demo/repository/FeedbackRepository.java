package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.demo.entity.Feedback;

public interface FeedbackRepository extends JpaRepository<Feedback, Long> {

    List<Feedback> findByNameContainingIgnoreCaseOrEmailContainingIgnoreCase(
        String name, String email
    );

    List<Feedback> findByRating(int rating);

    // 🔴 THIS METHOD MUST EXIST
    List<Feedback> findByEventId(Long eventId);
}
