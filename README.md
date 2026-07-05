# QuaTang (Quà Tặng)

Dự án phát triển nền tảng thương mại điện tử chuyên cung cấp và bán lẻ quà tặng trực tuyến. Được xây dựng dựa trên kiến trúc Spring Boot MVC nhiều tầng.

## Tính Năng Chính
- **Quản Lý Sản Phẩm**: Danh mục, chi tiết, lọc, và tìm kiếm sản phẩm.
- **Giỏ Hàng & Đặt Hàng**: Giỏ hàng lưu theo session, quy trình checkout đơn giản.
- **Thành Viên & Bảo Mật**: Đăng ký, đăng nhập, phân quyền người dùng và quản trị viên (Spring Security).
- **Đánh Giá & Nhận Xét**: Hệ thống cho phép người dùng đăng nhập đánh giá sản phẩm.
- **Trang Quản Trị (Admin Panel)**: CRUD sản phẩm, cập nhật trạng thái đơn hàng.

## Công Nghệ Sử Dụng
- **Backend**: Java 17, Spring Boot 4.1.0, Spring MVC, Spring Data JPA, Spring Security
- **Frontend**: Thymeleaf, HTML5, CSS3
- **Database**: MySQL 8.0
- **Build Tool**: Gradle

## Cách Chạy Dự Án
```bash
./gradlew bootRun
```
(Yêu cầu có MySQL đang chạy ở localhost:3306 với database tên `QuaTang`, username `root`, password `123`)

## Tài Liệu
Xem thêm chi tiết tại thư mục `docs/`.
