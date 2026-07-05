# System Architecture

## 1. Overview
Hệ thống QuaTang được xây dựng trên nền tảng **Java Spring Boot**, cung cấp ứng dụng Web nguyên khối (Monolithic). Rendering HTML diễn ra trực tiếp tại Server sử dụng **Thymeleaf** (Server-Side Rendering), phù hợp với quy mô nhỏ, giúp SEO tốt và giảm độ phức tạp ở phía Frontend.

## 2. Các Thành Phần Hệ Thống (System Components)

### 2.1. Client
- Trình duyệt web giao tiếp với server qua HTTP/HTTPS.
- Nhận về toàn bộ HTML/CSS đã được render sẵn.

### 2.2. Web Server (Embedded Tomcat)
- Spring Boot nhúng sẵn Tomcat server.
- Xử lý Routing, Session, Authentication (Spring Security).

### 2.3. Application Layer (Spring MVC)
- **Presentation (Controllers)**: Điểm tiếp nhận request. Chặn quyền bằng Spring Security. Chuyển DTO thành Model attributes đưa lên View.
- **Business (Services)**: Logic tính toán đơn hàng, tổng tiền giỏ hàng, xác thực người dùng.
- **Data Access (Repositories)**: Spring Data JPA kết nối CSDL, đóng gói các câu lệnh SQL dưới dạng OOP.

### 2.4. Database
- **MySQL 8.0**: Lưu trữ toàn bộ dữ liệu cấu trúc (Categories, Products, Users, Orders, Reviews).
- Sử dụng Hibernate ORM để map Entity Class với Database Table.

## 3. Kiến trúc Bảo Mật (Security)
- Sử dụng **Session-Based Authentication** với Cookie `JSESSIONID`.
- Mật khẩu lưu trong Database được băm (hash) bằng **BCrypt**.
- Phân quyền (Role-Based Access Control) cho 2 đối tượng: `USER` và `ADMIN`.
- Dialect `thymeleaf-extras-springsecurity6` để ẩn/hiện thành phần UI dựa trên Role trực tiếp ở code HTML.

## 4. Quản Lý Trạng Thái (State Management)
- **Giỏ Hàng (Cart)**: Lưu trữ tạm thời trong User Session (cấu trúc `Map<Long, CartItem>`). Dữ liệu giỏ hàng sẽ bị xóa khi Session hết hạn hoặc khi user Checkout thành công.
- **Đơn Hàng (Order)**: Khi checkout, dữ liệu giỏ hàng sẽ được chuyển thành Order Entities và persist vào MySQL.
