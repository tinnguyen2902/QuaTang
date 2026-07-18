package com.example.quatang.controller;

import com.example.quatang.entity.enums.RegionType;
import com.example.quatang.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final ProductService productService;

    @GetMapping("home")
    public String home() {
        return "home/home";
    }

    @GetMapping("/local")
    public String localPage(
            Model model,
            @RequestParam(defaultValue = "0") int page) {
        model.addAttribute("products", productService.getProductsByRegion(RegionType.LOCAL, page));
        model.addAttribute("currentPage", page);
        model.addAttribute("region", "local");
        return "regions/local";
    }

    @GetMapping("/domestic")
    public String domesticPage(
            Model model,
            @RequestParam(defaultValue = "0") int page) {
        model.addAttribute("products", productService.getProductsByRegion(RegionType.DOMESTIC, page));
        model.addAttribute("currentPage", page);
        model.addAttribute("region", "domestic");
        return "regions/domestic";
    }

    @GetMapping("/international")
    public String internationalPage(
            Model model,
            @RequestParam(defaultValue = "0") int page) {
        model.addAttribute("products", productService.getProductsByRegion(RegionType.INTERNATIONAL, page));
        model.addAttribute("currentPage", page);
        model.addAttribute("region", "international");
        return "regions/international";
    }

    @GetMapping("/pay")
    public String showPayPage() {
        return "pay/pay";
    }

    @GetMapping("/product-detail")
    public String showProductDetailPage() {
        return "product/product-detail";
    }
    @GetMapping({"/admin"})
    public String viewHomePage() {
        return "seller/sellerHome1";
    }
    @GetMapping("/hieu-qua")
    public String getHome2() {
        return "seller/sellerHome2";
    }
    @GetMapping("/don-hang")
    public String getHome3() {
        return "seller/sellerHome3";
    }

    @GetMapping("/san-pham")
    public String getHome4() {
        return "seller/sellerHome4";
    }
}