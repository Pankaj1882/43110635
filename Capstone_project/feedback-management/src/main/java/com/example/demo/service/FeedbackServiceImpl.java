package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Feedback;
import com.example.demo.repository.FeedbackRepository;

@Service
public class FeedbackServiceImpl implements FeedbackService {

    @Autowired
    private FeedbackRepository repository;   // ✅ THIS MUST EXIST

    @Override
    public void saveFeedback(Feedback feedback) {
        repository.save(feedback);
    }

    @Override
    public List<Feedback> getAllFeedback() {
        return repository.findAll();
    }

    @Override
    public void deleteFeedback(Long id) {
        repository.deleteById(id);
    }

    @Override
    public List<Feedback> searchFeedback(String keyword) {
        return repository
                .findByNameContainingIgnoreCaseOrEmailContainingIgnoreCase(
                        keyword, keyword);
    }

    @Override
    public List<Feedback> filterByRating(int rating) {
        return repository.findByRating(rating);
    }

    @Override
    public List<Feedback> getFeedbackByEvent(Long eventId) {
        return repository.findByEventId(eventId);
    }

	@Override
	public List<Feedback> getFeedbackByRating(int rating) {
		// TODO Auto-generated method stub
		return null;
	}
}
