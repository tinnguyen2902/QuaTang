# Research: Tối ưu hóa UI với Thymeleaf Fragments & Fetch API

## Bối cảnh
Dự án Spring Boot Monolithic cần xây dựng màn hình Danh sách sản phẩm và Chi tiết sản phẩm, dựa trên kiến trúc SSR kết hợp với Fetch API để tải danh sách động mà không phải reload toàn bộ trang.

## Phân tích Thymeleaf Fragments
Theo tài liệu `code-standards.md`, thay vì lặp lại Header/Footer trên mọi trang (hiện tại cả 4 file HTML `home.html`, `local.html`... đều đang copy paste code Header/Footer), ta cần sử dụng `th:fragment` và `th:replace` (hoặc `th:insert`).
- **Lợi ích**: Giảm thiểu dư thừa mã nguồn, dễ dàng chỉnh sửa giao diện tổng thể sau này.
- **Áp dụng**: Tạo file `src/main/resources/templates/fragments/layout.html` hoặc `header.html`, `footer.html`.

## Kết hợp SSR và CSR (Fetch API) cho Product List
Trang danh sách sản phẩm cần phân trang và bộ lọc.
Nếu dùng Fetch API (CSR):
- Controller trả về dữ liệu dạng JSON thông qua `@ResponseBody` hoặc `@RestController`.
- JS phía client render HTML từ JSON. Việc này làm mất đi khả năng sử dụng Thymeleaf templates cho product cards.

**Giải pháp tối ưu cho Spring MVC**: Htmx hoặc Fetch API lấy partial HTML (HTML fragments).
- Controller vẫn trả về một file HTML nhưng không chứa layout (chỉ trả về phần `div` chứa danh sách sản phẩm).
- Thymeleaf hỗ trợ render fragment trực tiếp từ controller: `return "products :: productList";`.
- JS Fetch lấy chuỗi HTML này và đắp thẳng vào DOM bằng `element.innerHTML = responseHTML`.

=> Cách này giúp giữ toàn bộ logic render UI ở server (Thymeleaf), mà client vẫn có trải nghiệm mượt mà không reload trang. Trang chi tiết thì sử dụng SSR truyền thống.
