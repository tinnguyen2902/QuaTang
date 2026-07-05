# Phase 05 - Review & Rating

## Overview

- **Priority**: Medium
- **Status**: 🔲 Planned
- **Depends on**: Phase 03 (cần login để review)

## Mục tiêu

Cho phép user đã đăng nhập đánh giá (1-5 sao) và bình luận về sản phẩm.

## Rules Nghiệp vụ

- Chỉ user đã đăng nhập mới được đánh giá
- Mỗi user chỉ được review 1 lần mỗi sản phẩm
- Hiển thị rating trung bình trên trang chi tiết sản phẩm
- Hiển thị danh sách review (phân trang nếu nhiều)

## Endpoints

| URL | Method | Mô tả |
|-----|--------|-------|
| `/reviews/post` | POST | Gửi review (form submit từ product detail page) |
| `/reviews/delete/{id}` | POST | Xóa review (của chính user) |

## Implementation Steps

1. Implement `ReviewRepository`:
   - `findByProductIdOrderByCreatedAtDesc(Long productId, Pageable)`
   - `findByProductIdAndUserId(Long productId, Long userId)` → Optional (kiểm tra đã review chưa)
   - `findAverageRatingByProductId(Long productId)` → Double (@Query JPQL)

2. Implement `ReviewService`:
   - `postReview(Long productId, Long userId, int rating, String comment)` → kiểm tra đã review chưa, lưu DB
   - `deleteReview(Long reviewId, Long userId)` → chỉ xóa review của chính user
   - `getReviewsByProduct(Long productId, Pageable)` → list review
   - `getAverageRating(Long productId)` → Double

3. Implement `ReviewController`:
   - `POST /reviews/post` → nhận form data, gọi ReviewService, redirect về trang sản phẩm
   - `POST /reviews/delete/{id}` → xóa review, redirect back

4. Cập nhật `templates/product/detail.html`:
   - Hiển thị rating trung bình (dạng sao)
   - Danh sách reviews (username, rating, comment, ngày)
   - Form đánh giá (chỉ hiển thị khi đã login và chưa review)

## Todo List

- [ ] Implement ReviewRepository (custom queries)
- [ ] Implement ReviewService
- [ ] Implement ReviewController
- [ ] Cập nhật product/detail.html: review section + form
- [ ] Test: đăng nhập → review → rating hiển thị
- [ ] Test: review 2 lần cùng sản phẩm → báo lỗi

## Success Criteria

- User đăng nhập có thể để lại rating 1-5 sao + bình luận
- Không thể review 2 lần cùng sản phẩm
- Rating trung bình hiển thị chính xác trên trang chi tiết
- User chưa login → không hiện form review, hiện nút "Đăng nhập để đánh giá"
