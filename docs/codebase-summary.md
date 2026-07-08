# Codebase Summary

Dự án có quy mô cực kỳ gọn nhẹ (khoảng ~3000 LOC tính cả HTML/CSS/Config).

## Cấu Trúc Thư Mục

```text
QuaTang/
├── build.gradle              # Cấu hình dependency và build tools của Gradle
├── src/
│   ├── main/
│   │   ├── java/com/example/quatang/
│   │   │   ├── config/       # Cấu hình Spring Security, Database
│   │   │   ├── controller/   # Web layer (xử lý request, trả về template)
│   │   │   ├── dto/          # Data Transfer Objects
│   │   │   ├── entity/       # JPA Entities đại diện cho DB tables (Category, Product, User, Order...)
│   │   │   ├── exception/    # Global Error Handling
│   │   │   ├── repository/   # Interfaces kế thừa JpaRepository tương tác với DB
│   │   │   └── service/      # Business logic layer
│   │   └── resources/
│   │       ├── application.properties  # Database, JPA, App config
│   │       ├── db/migration/ # Các script Flyway tự động khởi tạo bảng và dữ liệu mẫu
│   │       ├── static/css/   # CSS styles (home.css, local.css...)
│   │       └── templates/    # HTML pages sử dụng Thymeleaf
├── docs/                     # Tài liệu thiết kế và kiến trúc dự án
├── .env.example              # Mẫu file biến môi trường cho database kết nối TiDB Cloud
└── plans/                    # Kế hoạch triển khai chia theo Phase
```

## Các Thành Phần Chính

- **Thymeleaf Templates**: HTML renders ở server. Đang có các trang `home.html`, `domestic.html`, `international.html`, `local.html`.
- **Entities**: Đã được định nghĩa hoàn thiện ở Phase 1 (Category, Product, User, Order, OrderItem, Review).
- **Repositories**: JPA interfaces kết nối DB MySQL cho tất cả entities.
- **Controllers & Services**: Hiện đang là các placeholder rỗng, chuẩn bị cho việc implement ở các Phase tiếp theo.
- **Security**: Tích hợp Spring Security, hiện tại đang cấu hình `permitAll()` tạm thời.
