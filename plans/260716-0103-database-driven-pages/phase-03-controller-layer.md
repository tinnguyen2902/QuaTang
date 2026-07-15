# Phase 03: Controller Layer

## Overview
- Priority: HIGH
- Status: pending
- Effort: ~30 phút
- Depends on: Phase 02 (ProductService)

## Context Links
- [HomeController.java](../src/main/java/com/example/quatang/controller/HomeController.java)
- [ProductController.java](../src/main/java/com/example/quatang/controller/ProductController.java)

## Implementation Steps

### Step 1: Update HomeController

**File**: `src/main/java/com/example/quatang/controller/HomeController.java`

```java
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
}
```

### Step 2: Update ProductController

**File**: `src/main/java/com/example/quatang/controller/ProductController.java`

```java
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
```

> **Note**: Nếu product không tìm thấy (`ifPresent` không chạy), template sẽ nhận `product = null`.
> Cần xử lý trong template với `th:if="${product != null}"`.

## Todo

- [ ] Update `HomeController.java` — inject ProductService + 3 region endpoints
- [ ] Update `ProductController.java` — inject ProductService + 2 endpoints
- [ ] Chạy `./gradlew compileJava` kiểm tra compile
- [ ] Test thủ công: `GET /local` → response 200

## Success Criteria

- Không có compile error
- `GET /local?page=0` → template nhận `products` model attribute
- `GET /products/1` → template nhận `product` model attribute
