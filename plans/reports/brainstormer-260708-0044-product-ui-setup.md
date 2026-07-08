# Brainstorm: Thiết lập UI Danh sách Sản phẩm và Chi tiết Sản phẩm

## 1. Bài toán và Yêu cầu (Problem Statement & Requirements)
**Mục tiêu:** Thiết kế giao diện (UI) và kiến trúc frontend cho hai trang: "Danh sách sản phẩm" và "Chi tiết sản phẩm" dựa trên kiến trúc hiện tại (Spring Boot + Thymeleaf + Vanilla CSS) và database schema đã có.

**Dữ liệu từ Database (Products & Categories):**
- **Products:** `id`, `name`, `description`, `price`, `stock_quantity`, `image_url`, `is_active`, `category_id`
- **Reviews:** `rating`, `comment`

**Giao diện hiện tại (tham chiếu từ `home.html`):**
- Layout cơ bản: Header (có thanh tìm kiếm, menu, lịch sử), Main Content, Footer (4 cột).
- Phong cách: Đơn giản, HTML/CSS thuần (Vanilla CSS), có sử dụng biến CSS hoặc class tiện ích cơ bản.

## 2. Phân tích các hướng tiếp cận (Evaluated Approaches)

### A. Phương án 1: Render hoàn toàn ở Server (Server-side Rendering - SSR) với Thymeleaf
Toàn bộ logic lọc, phân trang, hiển thị chi tiết đều được xử lý ở backend trả về HTML tĩnh.

*   **Pros (Ưu điểm):** 
    - Phù hợp với kiến trúc MVC hiện tại.
    - SEO tốt (do HTML đã render đầy đủ).
    - Ít phụ thuộc vào JavaScript ở phía client.
*   **Cons (Nhược điểm):**
    - Trải nghiệm người dùng (UX) khi lọc/phân trang sẽ bị gián đoạn vì phải tải lại trang (reload).
    - Khó tạo ra các hiệu ứng UI động mượt mà (vd: quick view sản phẩm, thêm vào giỏ hàng không reload).

### B. Phương án 2: Kết hợp SSR (Thymeleaf) và Client-side API (AJAX/Fetch API)
Render khung giao diện và dữ liệu ban đầu bằng Thymeleaf, nhưng các tác vụ tương tác như: Lọc sản phẩm, chuyển trang, thêm vào giỏ hàng sẽ dùng JavaScript (Fetch API) gọi đến RESTful API để cập nhật UI.

*   **Pros:** 
    - Giữ được lợi thế SEO cho lần tải đầu.
    - Trải nghiệm mượt mà không cần tải lại trang khi thao tác lọc/thêm giỏ hàng.
    - Tận dụng được Vanilla JS, không cần cài đặt framework nặng (như React/Vue).
*   **Cons:**
    - Cần xây dựng thêm các endpoint REST API trong Controller.
    - Phải viết thêm mã JavaScript để cập nhật DOM.

## 3. Đề xuất kiến trúc UI và Giải pháp cuối cùng (Final Recommended Solution)

**Khuyến nghị: Chọn Phương án 2 (Thymeleaf SSR + Vanilla JS Fetch API)** cho một sự cân bằng tuyệt vời giữa SEO, UX, và sự đồng nhất với kiến trúc hiện tại.

### Cấu trúc Giao diện Danh sách Sản phẩm (`product-list.html`)
*   **Layout:** Kế thừa Header/Footer từ `home.html`. 
*   **Sidebar (Bên trái):** 
    - Bộ lọc danh mục (từ bảng `categories`).
    - Lọc theo khoảng giá.
    - Sắp xếp (Mới nhất, Giá tăng/giảm).
*   **Grid Sản phẩm (Bên phải):**
    - Grid layout (CSS Grid: `grid-template-columns: repeat(auto-fill, minmax(250px, 1fr))`).
    - **Product Card:** Ảnh sản phẩm (`image_url`), Tên, Giá, Đánh giá trung bình (tính từ bảng `reviews`), Nút "Thêm vào giỏ" nhanh.

### Cấu trúc Giao diện Chi tiết Sản phẩm (`product-detail.html`)
*   **Breadcrumb:** `Trang chủ > [Tên Danh Mục] > [Tên Sản phẩm]`.
*   **Phần trên (Top Section - 2 cột):**
    - **Cột Trái:** Hình ảnh sản phẩm (có thể nâng cấp thành thư viện ảnh mini nếu sau này mở rộng database).
    - **Cột Phải:** 
        - Tên sản phẩm, Giá (hiển thị nổi bật).
        - Trạng thái kho (`stock_quantity` > 0 ? "Còn hàng" : "Hết hàng").
        - Bộ chọn số lượng (+/-) và Nút "Thêm vào giỏ hàng" (To to, nổi bật).
        - Thông tin mô tả ngắn (lấy 1 đoạn đầu từ `description`).
*   **Phần dưới (Bottom Section):**
    - Tabs hoặc Sections: "Mô tả chi tiết" (toàn bộ `description`), "Đánh giá của khách hàng" (Hiển thị list từ bảng `reviews`).
    - "Sản phẩm liên quan" (Các sản phẩm cùng `category_id`).

## 4. Những điểm cần lưu ý khi triển khai (Implementation Considerations & Risks)

- **UI/UX Design:** Đảm bảo `product.css` và `product-detail.css` tái sử dụng được các component chung từ `home.css` để giữ tính đồng nhất (Ví dụ: `.section-divider`, nút bấm `.btn-primary`).
- **Hình ảnh:** Cần có logic xử lý ảnh mặc định (fallback image) nếu `image_url` bị null hoặc lỗi link để không làm vỡ layout.
- **Tính năng Giỏ hàng:** Nếu người dùng nhấn "Thêm vào giỏ", nên hiển thị một Toast Notification (thông báo nhỏ góc màn hình) thay vì chuyển hướng ngay sang trang giỏ hàng.
- **Bảo mật & Hiệu suất:**
    - Cần phân trang (Pagination) ở backend cho trang danh sách (vd: 12-16 sản phẩm/trang) để tránh quá tải tải dữ liệu.
    - Cần cache (nếu có thể) cho các truy vấn đếm rating/review để tăng tốc render.

## 5. Các bước tiếp theo (Next Steps)
1. Thống nhất về cấu trúc layout và hướng tiếp cận AJAX/SSR.
2. Thiết lập DTO (Data Transfer Object) để truyền dữ liệu cho View hoặc API.
3. Tạo HTML/CSS tĩnh (Mockup) để chốt thẩm mỹ.
4. Tích hợp dữ liệu động từ Thymeleaf.

---
**Bạn có đồng ý với phương án tiếp cận này không? Nếu bạn muốn, tôi có thể chuyển sang bước `/plan` để lên kế hoạch chi tiết từng bước tạo HTML/CSS và kết nối backend.**
