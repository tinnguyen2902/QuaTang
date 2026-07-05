# Phase 03 - Authentication & User Management

## Overview

- **Priority**: High
- **Status**: 🔲 Planned
- **Depends on**: Phase 01

## Mục tiêu

Triển khai đăng ký, đăng nhập, đăng xuất dùng Spring Security session-based. Phân quyền USER/ADMIN.

## Cơ chế: Spring Security + Session (phù hợp Thymeleaf SSR)

- Không dùng JWT (JWT dành cho REST API + SPA frontend)
- Session lưu trên server, cookie JSESSIONID gửi về browser
- Thymeleaf Security dialect cho phép kiểm tra auth trong template: `sec:authorize`

## Files Cần Tạo

| File | Mô tả |
|------|-------|
| `config/SecurityConfig.java` | Cấu hình full Spring Security |
| `config/CustomUserDetailsService.java` | Load user từ DB theo username |
| `controller/AuthController.java` | Handle login/register/logout |
| `dto/RegisterDTO.java` | Form data đăng ký |
| `service/UserService.java` | Logic tạo user, mã hóa password |
| `templates/auth/login.html` | Form đăng nhập |
| `templates/auth/register.html` | Form đăng ký |
| `templates/user/profile.html` | Trang thông tin cá nhân |

## SecurityConfig — Luồng Phân Quyền

```
Public (tất cả):     /, /home, /products/**, /css/**, /images/**
Authenticated only:  /cart/**, /orders/**, /reviews/post
Admin only:          /admin/**
```

## Implementation Steps

1. Tạo `CustomUserDetailsService` implements `UserDetailsService`:
   - Load `User` entity từ DB bằng username/email
   - Map sang `UserDetails` của Spring Security

2. Cập nhật `SecurityConfig.java`:
   - `PasswordEncoder`: BCryptPasswordEncoder
   - `formLogin()`: loginPage="/auth/login", loginProcessingUrl="/auth/login"
   - `logout()`: logoutUrl="/auth/logout", logoutSuccessUrl="/"
   - `authorizeHttpRequests()`: cấu hình public/private/admin routes
   - Disable CSRF cho đơn giản (hoặc cấu hình đúng)

3. Tạo `RegisterDTO` với validation annotations (@NotBlank, @Email, @Size)

4. Implement `UserService`:
   - `register(RegisterDTO)`: kiểm tra username/email trùng, hash password, lưu DB
   - `findByUsername(String)`

5. Tạo `AuthController`:
   - `GET /auth/login` → trả view login.html
   - `POST /auth/register` → xử lý đăng ký, redirect
   - Spring Security tự xử lý POST /auth/login và /auth/logout

6. Tạo `templates/auth/login.html`: form đăng nhập, hiển thị lỗi nếu sai
7. Tạo `templates/auth/register.html`: form đăng ký có validation
8. Cập nhật header fragment: hiển thị username nếu đã login, nút Đăng nhập/Đăng xuất

## Todo List

- [ ] Implement CustomUserDetailsService
- [ ] Cấu hình SecurityConfig đầy đủ
- [ ] Tạo RegisterDTO với validation
- [ ] Implement UserService
- [ ] Implement AuthController
- [ ] Tạo login.html
- [ ] Tạo register.html
- [ ] Tạo profile.html
- [ ] Cập nhật header fragment (sec:authorize)
- [ ] Test login/logout/register flow

## Success Criteria

- Đăng ký → tài khoản lưu vào DB với password đã hash BCrypt
- Đăng nhập đúng → redirect về trang chủ, hiển thị tên user
- Đăng nhập sai → hiển thị thông báo lỗi
- Truy cập `/cart` khi chưa login → redirect về `/auth/login`
- User thường không truy cập được `/admin/**`
