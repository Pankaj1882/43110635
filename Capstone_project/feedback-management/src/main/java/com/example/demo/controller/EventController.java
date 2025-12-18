package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;   // ✅ CORRECT IMPORT
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.entity.Event;
import com.example.demo.repository.EventRepository;

@Controller
@RequestMapping("/admin/events")
public class EventController {

    @Autowired
    private EventRepository eventRepo;

    @GetMapping
    public String eventPage(Model model) {
        model.addAttribute("event", new Event());
        model.addAttribute("events", eventRepo.findAll());
        return "event-form";
    }

    @PostMapping
    public String saveEvent(@ModelAttribute Event event) {
        eventRepo.save(event);
        return "redirect:/admin/events";
    }
}
