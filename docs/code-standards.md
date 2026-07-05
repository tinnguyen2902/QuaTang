# Code Standards & Structure

## 1. Naming Conventions

- **Packages**: `lowercase` (VD: `controller`, `service`, `repository`)
- **Classes/Interfaces**: `PascalCase` (VD: `ProductController`, `UserService`)
- **Methods/Variables**: `camelCase` (VD: `findByCategory`, `totalAmount`)
- **Constants**: `UPPER_SNAKE_CASE` (VD: `MAX_UPLOAD_SIZE`)
- **Database Tables**: `snake_case` số nhiều (VD: `products`, `users`, `order_items`)
- **Database Columns**: `snake_case` (VD: `created_at`, `stock_quantity`)

## 2. Kiến Trúc 3-Layer (MVC)

Mọi flow xử lý phải đi theo đường một chiều:
`Client Request -> Controller -> Service -> Repository -> Database`

### 2.1. Controller Layer
- Chỉ đóng vai trò nhận request, validation data, gọi logic từ Service và trả về View (Thymeleaf template) hoặc redirect.
- **Tuyệt đối không** chứa logic tính toán, hay gọi trực tiếp Repository.

### 2.2. Service Layer
- Chứa toàn bộ "Business Logic" (tính toán tổng tiền, kiểm tra quyền hạn, apply mã giảm giá...).
- Không nên import các classes liên quan đến giao diện như `HttpServletRequest` (trừ Session cho giỏ hàng ở project này).

### 2.3. Repository Layer
- Chỉ làm việc liên quan đến CSDL thông qua JPA/Hibernate.
- Viết các custom query method name theo chuẩn Spring Data (VD: `findByNameContainingIgnoreCase`).

## 3. Quản Lý Dữ Liệu
- Dùng **DTO (Data Transfer Object)** khi dữ liệu đẩy ra view/nhận từ form có sự khác biệt lớn với Entity. Tuy nhiên với dự án quá nhỏ, có thể tạm truyền Entity, nhưng nếu form đăng ký/đăng nhập thì bắt buộc dùng DTO (`RegisterDTO`, `LoginDTO`).
- Không trả về mật khẩu hoặc dữ liệu nhạy cảm ra view.

## 4. Frontend & Templates
- Sử dụng Thymeleaf tags (`th:href`, `th:text`, `sec:authorize`) chuẩn mực.
- Đặt toàn bộ css tĩnh trong `src/main/resources/static/css/`.
- Tách các component dùng chung ra thành Fragment (VD: `header`, `footer`, `product-card`) thay vì copy/paste code HTML.
