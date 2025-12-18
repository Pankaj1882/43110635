package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.demo.entity.Feedback;
import com.example.demo.service.FeedbackService;

@Controller
@RequestMapping("/admin")
public class AdminFeedbackController {

    @Autowired
    private FeedbackService feedbackService;

    // View all or filtered feedback
    @GetMapping("/feedback")
    public String viewFeedback(
            @RequestParam(value = "rating", required = false) Integer rating,
            Model model) {

        List<Feedback> feedbackList;

        if (rating != null) {
            feedbackList = feedbackService.getFeedbackByRating(rating);
            model.addAttribute("selectedRating", rating);
        } else {
            feedbackList = feedbackService.getAllFeedback();
        }

        model.addAttribute("feedbacks", feedbackList);
        return "admin-feedback";
    }

    // Delete feedback
    @GetMapping("/delete/{id}")
    public String deleteFeedback(@PathVariable Long id) {
        feedbackService.deleteFeedback(id);
        return "redirect:/admin/feedback";
    }
    
    @GetMapping("/feedback/search")
    public String searchFeedback(@RequestParam("keyword") String keyword, Model model) {
        List<Feedback> feedbackList = feedbackService.searchFeedback(keyword);
        model.addAttribute("feedbacks", feedbackList);
        model.addAttribute("keyword", keyword);
        return "admin-feedback";
    }
    
    @GetMapping("/feedback/filter")
    public String filterByRating(@RequestParam("rating") int rating, Model model) {
        List<Feedback> feedbackList = feedbackService.filterByRating(rating);
        model.addAttribute("feedbacks", feedbackList);
        model.addAttribute("selectedRating", rating);
        return "admin-feedback";
    }


}
