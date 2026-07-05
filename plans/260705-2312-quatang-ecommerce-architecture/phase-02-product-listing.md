# Phase 02 - Product Listing & Detail

## Overview

- **Priority**: High
- **Status**: 🔲 Planned
- **Depends on**: Phase 01

## Mục tiêu

Xây dựng tính năng hiển thị danh sách sản phẩm với lọc danh mục/giá, tìm kiếm, và trang chi tiết sản phẩm. Đây là core feature của web.

## Templates Cần Tạo/Sửa

| Template | Mô tả |
|----------|-------|
| `templates/fragments/header.html` | Header dùng chung (Thymeleaf fragment) |
| `templates/fragments/footer.html` | Footer dùng chung |
| `templates/fragments/product-card.html` | Card sản phẩm tái sử dụng |
| `templates/product/list.html` | Trang danh sách sản phẩm |
| `templates/product/detail.html` | Trang chi tiết sản phẩm |
| `templates/home.html` | Sửa lại: nhúng fragment + hiển thị sản phẩm nổi bật |

## API Endpoints (Controller → View)

| URL | Method | Mô tả |
|-----|--------|-------|
| `/products` | GET | Danh sách sản phẩm (có phân trang) |
| `/products?category={slug}` | GET | Lọc theo danh mục |
| `/products?search={keyword}` | GET | Tìm kiếm |
| `/products?minPrice={}&maxPrice={}` | GET | Lọc theo giá |
| `/products/{id}` | GET | Chi tiết sản phẩm |

## Implementation Steps

1. Tạo `ProductService` với methods:
   - `findAll(Pageable)` — phân trang
   - `findByCategory(String slug, Pageable)` — lọc theo danh mục
   - `search(String keyword, Pageable)` — tìm kiếm theo tên
   - `findByPriceRange(BigDecimal min, BigDecimal max, Pageable)`
   - `findById(Long id)`
   - `getAverageRating(Long productId)`

2. Tạo `ProductRepository` với custom queries:
   - `findByCategorySlug(String slug, Pageable)`
   - `findByNameContainingIgnoreCase(String keyword, Pageable)`
   - `findByPriceBetween(BigDecimal min, BigDecimal max, Pageable)`

3. Tạo `ProductController`:
   - `@GetMapping("/products")` — xử lý tất cả query params, đẩy model vào view
   - `@GetMapping("/products/{id}")` — chi tiết

4. Tạo Thymeleaf fragments (header, footer, product-card)

5. Tạo `templates/product/list.html`:
   - Grid hiển thị sản phẩm
   - Sidebar lọc (danh mục, giá)
   - Search bar
   - Phân trang (Thymeleaf + Spring Pageable)

6. Tạo `templates/product/detail.html`:
   - Ảnh sản phẩm
   - Tên, giá, mô tả, tồn kho
   - Rating trung bình
   - Nút "Thêm vào giỏ hàng" (sẽ active ở Phase 04)
   - Section review (sẽ active ở Phase 05)

7. Sửa `home.html`: thêm section "Sản phẩm nổi bật" load từ database

8. Tạo seed data: 10-20 sản phẩm mẫu qua SQL script hoặc `data.sql`

## Todo List

- [ ] Implement ProductRepository (custom queries)
- [ ] Implement ProductService
- [ ] Implement ProductController
- [ ] Tạo Thymeleaf fragments (header, footer)
- [ ] Tạo product-card fragment
- [ ] Tạo product/list.html
- [ ] Tạo product/detail.html
- [ ] Sửa home.html: thêm featured products
- [ ] Tạo seed data (categories + products)
- [ ] Test phân trang, tìm kiếm, lọc

## Success Criteria

- Truy cập `/products` → danh sách sản phẩm từ DB
- Lọc theo danh mục, giá hoạt động
- Tìm kiếm theo tên hoạt động
- Phân trang hoạt động (default 12 items/page)
- Trang chi tiết `/products/{id}` hiển thị đúng thông tin
