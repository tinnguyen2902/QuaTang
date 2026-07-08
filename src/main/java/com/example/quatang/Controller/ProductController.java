package com.example.quatang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ProductController {

    @GetMapping("/products")
    public String showProductList() {
        return "product-list";
    }

    @GetMapping("/products/{id}")
    public String showProductDetail(@PathVariable Long id) {
        // Hiện tại chỉ trả về giao diện tĩnh (mockup)
        return "product-detail";
    }
}
