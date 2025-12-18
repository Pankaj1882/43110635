package com.example.demo.service;

import java.util.List;
import com.example.demo.entity.Feedback;

public interface FeedbackService {

    void saveFeedback(Feedback feedback);

    List<Feedback> getAllFeedback();

    void deleteFeedback(Long id);

    List<Feedback> searchFeedback(String keyword);

    List<Feedback> filterByRating(int rating);
    
    List<Feedback> getFeedbackByRating(int rating);
    
    List<Feedback> getFeedbackByEvent(Long eventId);
}
