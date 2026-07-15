package com.example.quatang.controller;

import com.example.quatang.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class ProductController {

    private final ProductService productService;

    @GetMapping("/products")
    public String showProductList(
            Model model,
            @RequestParam(defaultValue = "0") int page) {
        model.addAttribute("products", productService.getAllProducts(page));
        model.addAttribute("currentPage", page);
        return "product/product-list";
    }

    @GetMapping("/products/{id}")
    public String showProductDetail(@PathVariable Long id, Model model) {
        productService.getProductById(id).ifPresent(product ->
            model.addAttribute("product", product)
        );
        return "product/product-detail";
    }
}
