package com.example.quatang.controller;

import com.example.quatang.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DbTestController {

    @Autowired
    private ProductRepository productRepository;

    @GetMapping("/test-db")
    public String testDbConnection(Model model) {
        try {
            model.addAttribute("products", productRepository.findAll());
            model.addAttribute("status", "Kết nối thành công!");
            model.addAttribute("isSuccess", true);
        } catch (Exception e) {
            model.addAttribute("status", "Lỗi kết nối: " + e.getMessage());
            model.addAttribute("isSuccess", false);
        }
        return "test-db";
    }
}
