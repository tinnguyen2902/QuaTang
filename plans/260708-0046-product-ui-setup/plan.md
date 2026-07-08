---
title: Thiết lập Giao diện Sản phẩm (Product UI Setup)
description: Refactor layout, xây dựng UI Danh sách Sản phẩm và Chi tiết Sản phẩm tích hợp kiến trúc SSR.
status: pending
priority: high
effort: medium
branch: main
tags: frontend, ui, thymeleaf
created: 2026-07-08T00:46:00Z
---

# Kế hoạch Triển khai (Overview)

Dựa trên kết quả nghiên cứu và trinh sát mã nguồn, việc thiết lập UI cần bắt đầu từ việc chuẩn hóa Layout hiện hành (Header/Footer), sau đó mới xây dựng UI mới cho Product List và Product Detail để đảm bảo tuân thủ nguyên tắc DRY (Don't Repeat Yourself).

## Các Giai Đoạn (Phases)

- **[x] Phase 01: Chuẩn hóa Layout và CSS (Refactor Layout)**
  - Tách Header, Footer thành các Thymeleaf Fragments riêng biệt.
  - Tách các class dùng chung từ `home.css` ra file `common.css`.
  - Link file [phase-01-setup-layout.md](./phase-01-setup-layout.md)

- **[x] Phase 02: Xây dựng UI Danh sách Sản phẩm**
  - Thiết kế Grid Layout, Sidebar Lọc.
  - Xây dựng component Product Card.
  - Chuẩn bị nền tảng HTML/CSS cho Fetch API lấy Partial HTML.
  - Link file [phase-02-product-list-ui.md](./phase-02-product-list-ui.md)

- **[x] Phase 03: Xây dựng UI Chi tiết Sản phẩm**
  - Giao diện gồm phần hình ảnh, thông tin sản phẩm nổi bật (giá, trạng thái), nút điều khiển số lượng và các Tabs mô tả/đánh giá.
  - Chèn logic Thymeleaf cơ bản.
  - Link file [phase-03-product-detail-ui.md](./phase-03-product-detail-ui.md)

## Dependencies
- Cấu trúc DB bảng `products`, `categories` đã hoàn thiện.
- Không yêu cầu thay đổi về Server (chỉ thêm file HTML/CSS).
