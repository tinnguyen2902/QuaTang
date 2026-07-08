package com.example.quatang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping("home")
    public String home(){
        return "home/home";
    }
    @GetMapping("/international")
    public String internationalPage() {
        return "regions/international"; // Trả về file international.html trong templates
    }
    @GetMapping("/local")
    public String localPage() {
        return "regions/local"; // Trả về file local.html trong templates khi click vào banner địa phương
    }
    @GetMapping("/domestic")
    public String domesticPage() {
        return "regions/domestic";// Trả về file domestic.html trong thư mục templates
    }
    @GetMapping("/pay")
    public String showPayPage() {
        return "pay/pay";
    }
    @GetMapping("/product-detail")
    public String showProductDetailPage() {
        return "product/product-detail";
    }
}