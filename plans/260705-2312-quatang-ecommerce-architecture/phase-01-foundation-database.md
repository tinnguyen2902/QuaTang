# Phase 01 - Project Foundation & Database Setup

## Overview

- **Priority**: Critical (blocker cho tất cả phase khác)
- **Status**: 🔲 Planned
- **Effort**: Medium

## Mục tiêu

Thiết lập nền tảng project: cấu trúc package chuẩn 3-layer MVC, thêm dependencies còn thiếu, định nghĩa tất cả JPA Entities và tạo schema MySQL.

## Dependencies Cần Thêm Vào build.gradle

```gradle
implementation 'org.springframework.boot:spring-boot-starter-data-jpa'
implementation 'org.springframework.boot:spring-boot-starter-security'
implementation 'org.thymeleaf.extras:thymeleaf-extras-springsecurity6'
implementation 'org.springframework.boot:spring-boot-starter-validation'
```

## Cấu Trúc Package Cần Tạo

```
com.example.quatang
├── QuaTangApplication.java          [CÓ SẴN]
├── controller/                      [TẠO MỚI]
│   ├── HomeController.java          [CHUYỂN TỪ Controller/]
│   ├── ProductController.java
│   ├── CartController.java
│   ├── OrderController.java
│   ├── ReviewController.java
│   ├── AuthController.java
│   └── admin/
│       └── AdminController.java
├── service/                         [TẠO MỚI]
│   ├── ProductService.java
│   ├── CartService.java
│   ├── OrderService.java
│   ├── ReviewService.java
│   └── UserService.java
├── repository/                      [TẠO MỚI]
│   ├── ProductRepository.java
│   ├── CategoryRepository.java
│   ├── OrderRepository.java
│   ├── OrderItemRepository.java
│   ├── ReviewRepository.java
│   └── UserRepository.java
├── entity/                          [TẠO MỚI]
│   ├── Product.java
│   ├── Category.java
│   ├── Order.java
│   ├── OrderItem.java
│   ├── Review.java
│   ├── User.java
│   └── enums/
│       ├── OrderStatus.java
│       └── Role.java
├── dto/                             [TẠO MỚI]
│   ├── ProductDTO.java
│   ├── OrderDTO.java
│   └── ReviewDTO.java
├── config/                          [TẠO MỚI]
│   └── SecurityConfig.java          (placeholder - cấu hình đầy đủ ở Phase 03)
└── exception/                       [TẠO MỚI]
    └── GlobalExceptionHandler.java
```

## Database Schema (ERD)

```
categories
  - id (PK, AUTO_INCREMENT)
  - name VARCHAR(100)
  - slug VARCHAR(100) UNIQUE
  - description TEXT
  - created_at

products
  - id (PK, AUTO_INCREMENT)
  - name VARCHAR(255)
  - description TEXT
  - price DECIMAL(12,2)
  - stock_quantity INT
  - image_url VARCHAR(500)
  - category_id (FK → categories.id)
  - is_active BOOLEAN DEFAULT TRUE
  - created_at, updated_at

users
  - id (PK, AUTO_INCREMENT)
  - username VARCHAR(50) UNIQUE
  - email VARCHAR(100) UNIQUE
  - password VARCHAR(255)   -- BCrypt hashed
  - full_name VARCHAR(150)
  - phone VARCHAR(20)
  - address TEXT
  - role ENUM('USER', 'ADMIN')
  - created_at

orders
  - id (PK, AUTO_INCREMENT)
  - user_id (FK → users.id)
  - total_amount DECIMAL(12,2)
  - status ENUM('PENDING','CONFIRMED','SHIPPING','DELIVERED','CANCELLED')
  - shipping_address TEXT
  - note TEXT
  - created_at, updated_at

order_items
  - id (PK, AUTO_INCREMENT)
  - order_id (FK → orders.id)
  - product_id (FK → products.id)
  - quantity INT
  - price DECIMAL(12,2)    -- giá tại thời điểm đặt hàng

reviews
  - id (PK, AUTO_INCREMENT)
  - product_id (FK → products.id)
  - user_id (FK → users.id)
  - rating INT (1-5)
  - comment TEXT
  - created_at
```

## Files Cần Tạo / Sửa

### Sửa
- `build.gradle` — thêm dependencies JPA, Security, Validation
- `application.properties` — thêm JPA config, Hibernate dialect
- Đổi tên thư mục `Controller/` → `controller/`, rename `HomeController.java`

### Tạo mới
- Tất cả entities trong `entity/`
- Tất cả repositories trong `repository/`
- Placeholder services và controllers (interface + empty class)
- `config/SecurityConfig.java` (tạm thời permit all, hoàn thiện ở Phase 03)
- `exception/GlobalExceptionHandler.java`

## Implementation Steps

1. Sửa `build.gradle`: thêm 4 dependencies còn thiếu
2. Cập nhật `application.properties`: thêm `spring.jpa.hibernate.dialect`, `spring.jpa.hibernate.ddl-auto=update`
3. Refactor: đổi tên package `Controller` → `controller`
4. Tạo `entity/enums/Role.java` và `OrderStatus.java`
5. Tạo 6 entity classes với đầy đủ JPA annotations (@Entity, @Table, @ManyToOne, @OneToMany,...)
6. Tạo 6 repository interfaces (extends JpaRepository)
7. Tạo placeholder service interfaces + implementations
8. Tạo placeholder controller classes
9. Tạo `SecurityConfig.java` tạm thời (permit all để không block dev)
10. Tạo `GlobalExceptionHandler.java`
11. Build và verify: `./gradlew build` — kiểm tra không có lỗi compile
12. Chạy app, verify Hibernate tự tạo bảng trong MySQL

## Todo List

- [ ] Thêm dependencies vào build.gradle
- [ ] Cập nhật application.properties
- [ ] Refactor tên package Controller → controller
- [ ] Tạo enums (Role, OrderStatus)
- [ ] Tạo Entity: Category
- [ ] Tạo Entity: Product
- [ ] Tạo Entity: User
- [ ] Tạo Entity: Order + OrderItem
- [ ] Tạo Entity: Review
- [ ] Tạo tất cả Repository interfaces
- [ ] Tạo placeholder Services
- [ ] Tạo placeholder Controllers
- [ ] Tạo SecurityConfig (permit all)
- [ ] Tạo GlobalExceptionHandler
- [ ] Build & verify

## Success Criteria

- `./gradlew build` thành công, không có lỗi compile
- App khởi động được, MySQL tự tạo đủ 6 bảng
- Trang home vẫn hoạt động bình thường
