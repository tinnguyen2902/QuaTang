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
- **Database**: TiDB Cloud (MySQL 8.0 Compatible), Flyway (Migration)
- **Build Tool**: Gradle

## Cách Chạy Dự Án
1. Copy file `.env.example` thành `.env` và điền thông tin kết nối database TiDB Cloud:
   ```bash
   cp .env.example .env
   ```
2. Chạy ứng dụng bằng Gradle:
   ```bash
   ./gradlew bootRun
   ```
   (Ứng dụng sẽ tự động chạy migration để tạo bảng và nạp dữ liệu mẫu thông qua Flyway)

### Kiểm Tra Kết Nối Database (Test DB)
Sau khi ứng dụng khởi chạy thành công, bạn có thể kiểm tra xem hệ thống đã kết nối với database TiDB Cloud và nạp dữ liệu mẫu thành công hay chưa bằng cách:
1. Mở trình duyệt web.
2. Truy cập vào địa chỉ: [http://localhost:8080/test-db](http://localhost:8080/test-db)
3. Giao diện sẽ hiển thị trạng thái kết nối và danh sách các sản phẩm mẫu nếu kết nối thành công.

## Tài Liệu
Xem thêm chi tiết tại thư mục `docs/`.
