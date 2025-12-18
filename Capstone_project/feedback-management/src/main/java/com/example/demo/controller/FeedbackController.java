package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.entity.Feedback;
import com.example.demo.repository.EventRepository;
import com.example.demo.service.FeedbackService;

@Controller
public class FeedbackController {

    @Autowired
    private FeedbackService service;

    @Autowired
    private EventRepository eventRepo;

    @GetMapping("/")
    public String feedbackForm(Model model) {
        model.addAttribute("feedback", new Feedback());

        // ✅ ONLY PUBLISHED EVENTS
        model.addAttribute("events", eventRepo.findByPublishedTrue());

        return "feedback-form";
    }


    @PostMapping("/submit")
    public String submitFeedback(@ModelAttribute Feedback feedback,
                                 RedirectAttributes ra) {
        service.saveFeedback(feedback);
        ra.addFlashAttribute("success", true);
        return "redirect:/";
    }
}
