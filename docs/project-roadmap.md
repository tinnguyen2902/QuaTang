# Development Roadmap

Dự án phát triển nền tảng thương mại điện tử QuaTang được chia thành 7 giai đoạn (Phases) chính.

## Phase 1: Project Foundation & Database Setup (✅ Hoàn thành)
- Setup cấu trúc package chuẩn 3-layer MVC.
- Định nghĩa Database Schema (ERD).
- Khởi tạo JPA Entities & Repositories.
- Tích hợp các dependencies cần thiết (JPA, Security, Validation).
- Cấu hình Flyway Migration & Baseline Data.

## Phase 2: Product Listing & Detail (🔲 Planned)
- Xây dựng layout Master/Fragment bằng Thymeleaf.
- Hiển thị danh sách sản phẩm.
- Tính năng lọc sản phẩm theo Category/Giá.
- Chức năng tìm kiếm sản phẩm.
- Trang chi tiết sản phẩm.

## Phase 3: Authentication & User Management (🔲 Planned)
- Cấu hình Spring Security (Session-based).
- Đăng ký tài khoản (mã hóa password BCrypt).
- Đăng nhập, đăng xuất.
- Phân quyền USER và ADMIN.
- Tích hợp Auth info vào giao diện (ẩn/hiện nút Đăng nhập).

## Phase 4: Shopping Cart & Order (🔲 Planned)
- Xây dựng Giỏ hàng lưu trữ bằng Session.
- Thêm/sửa/xóa sản phẩm khỏi giỏ hàng.
- Quy trình Checkout (Thanh toán/Đặt hàng).
- Lưu thông tin đơn hàng vào Database.
- Trang lịch sử mua hàng của User.

## Phase 5: Review & Rating (🔲 Planned)
- Chức năng đánh giá sao (1-5) và bình luận.
- Ràng buộc: Phải login mới được đánh giá, mỗi user 1 review/sản phẩm.
- Hiển thị điểm rating trung bình ở danh sách và chi tiết sản phẩm.

## Phase 6: Admin Panel (🔲 Planned)
- Trang Dashboard cơ bản.
- Quản lý danh mục và sản phẩm (Thêm, Sửa, Ẩn).
- Quản lý trạng thái đơn hàng (PENDING, SHIPPING, DELIVERED).
- Giới hạn quyền truy cập chỉ dành cho Role `ADMIN`.

## Phase 7: Deployment (🔲 Planned)
- Tách file cấu hình `application-prod.properties`.
- Viết `Dockerfile` (tùy chọn).
- Triển khai miễn phí lên Railway.app.
- Kết nối với MySQL trên Cloud.
