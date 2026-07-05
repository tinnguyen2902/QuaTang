---
title: QuaTang E-Commerce Architecture Implementation
description: Xây dựng ứng dụng web bán quà tặng với Spring Boot + Thymeleaf SSR, MySQL, Spring Security
status: planned
priority: high
effort: large
branch: feature/ecommerce-architecture
tags: [spring-boot, thymeleaf, mysql, spring-security, mvc, e-commerce]
created: 2026-07-05T23:12:00+07:00
---

# QuaTang E-Commerce - Implementation Plan

## Tổng Quan

Web bán quà tặng dùng Spring Boot 4.1 + Thymeleaf (SSR) + MySQL + Spring Security.
Kiến trúc 3-layer MVC: Controller → Service → Repository.

## Trạng Thái Các Phase

| Phase | Tên | Status |
|-------|-----|--------|
| 01 | Project Foundation & Database Setup | ✅ Completed |
| 02 | Product Listing & Detail | 🔲 Planned |
| 03 | Authentication & User Management | 🔲 Planned |
| 04 | Shopping Cart & Order | 🔲 Planned |
| 05 | Review & Rating | 🔲 Planned |
| 06 | Admin Panel | 🔲 Planned |
| 07 | Deploy to Railway | 🔲 Planned |

## Tech Stack

- Framework: Spring Boot 4.1 + Spring MVC
- Template Engine: Thymeleaf + Thymeleaf Security dialect
- Database: MySQL 8 + Spring Data JPA (Hibernate)
- Security: Spring Security (session-based)
- Build: Gradle
- Deploy: Railway (Cloud free tier)
- Java: 17

## Dependencies (Phase Order)

Phase 01 → Phase 02 → Phase 03 → Phase 04 → Phase 05 → Phase 06 → Phase 07
