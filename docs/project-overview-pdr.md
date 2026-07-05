# Project Overview and PDR (Product Development Requirements)

## 1. Project Overview
QuaTang là một ứng dụng web thương mại điện tử nhỏ, phục vụ mục đích bán lẻ quà tặng (quà sinh nhật, quà kỷ niệm, đồ thủ công). Hệ thống được thiết kế hướng đến sự tinh gọn, dễ bảo trì, với mô hình Server-Side Rendering (SSR) sử dụng Thymeleaf kết hợp với sức mạnh của Spring Boot Backend.

Mục tiêu chính: Tạo ra một nền tảng mua bán quà tặng trực tuyến, tập trung vào trải nghiệm người dùng, khả năng tìm kiếm dễ dàng và quy trình đặt hàng tối giản.

## 2. Target Audience
- Khách hàng cá nhân tìm mua quà tặng vào các dịp lễ, kỷ niệm.
- Người dùng không có quá nhiều yêu cầu phức tạp về công nghệ, cần một UI/UX rõ ràng, mua hàng nhanh chóng.

## 3. Product Development Requirements (PDR)

### 3.1. Chức Năng Cốt Lõi (Core Features)
- **Hiển thị Sản Phẩm**: Trang chủ nổi bật, danh sách sản phẩm theo danh mục, trang chi tiết sản phẩm rõ ràng.
- **Tìm Kiếm & Lọc**: Tìm theo keyword, giá, danh mục.
- **Giỏ Hàng (Cart)**: Quản lý qua Session, dễ dàng tùy chỉnh số lượng.
- **Đặt Hàng (Order)**: Checkout lưu đơn hàng vào Database.
- **Người Dùng (User)**: Đăng nhập/Đăng ký để đánh giá sản phẩm và xem lịch sử mua hàng.
- **Đánh Giá (Review)**: Rate 1-5 sao kèm bình luận.

### 3.2. Chức Năng Quản Trị (Admin Features)
- Dashboard cơ bản.
- Quản lý danh mục và sản phẩm (Thêm, sửa, xóa/ẩn).
- Quản lý đơn hàng (Cập nhật trạng thái giao hàng: PENDING, SHIPPING, DELIVERED...).

### 3.3. Yêu Cầu Phi Chức Năng (Non-Functional Requirements)
- **Kiến trúc**: 3-layer MVC (Controller, Service, Repository).
- **Giao diện**: HTML/CSS thuần túy, responsive cơ bản.
- **Hiệu năng**: Tải trang nhanh nhờ cơ chế SSR.
- **Triển khai (Deployment)**: Deploy dễ dàng lên Railway hoặc các nền tảng Cloud tương tự.
