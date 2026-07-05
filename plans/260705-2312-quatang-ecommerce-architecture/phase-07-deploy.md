# Phase 07 - Deploy to Railway

## Overview

- **Priority**: Low (sau khi core features hoàn chỉnh)
- **Status**: 🔲 Planned
- **Depends on**: Phase 01-06

## Mục tiêu

Deploy ứng dụng lên Railway cloud (free tier), sử dụng MySQL add-on của Railway.

## Checklist Chuẩn Bị Deploy

### 1. Cấu hình môi trường
- Tách cấu hình prod ra `application-prod.properties`
- Dùng biến môi trường cho DB credentials (Railway inject tự động)
- Không hardcode password/secret vào code

### 2. application-prod.properties

```properties
spring.datasource.url=${DATABASE_URL}
spring.datasource.username=${DATABASE_USERNAME}
spring.datasource.password=${DATABASE_PASSWORD}
spring.jpa.hibernate.ddl-auto=validate  # Dùng validate thay vì update ở prod
```

### 3. Procfile hoặc Railway config

Railway tự detect Spring Boot qua `build.gradle`, nhưng cần chỉ định:
```
./gradlew build
java -jar build/libs/QuaTang-0.0.1-SNAPSHOT.jar
```

### 4. Tạo Dockerfile (optional nhưng khuyến nghị)

```dockerfile
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar", "--spring.profiles.active=prod"]
```

## Steps Deploy

1. Tạo tài khoản Railway (railway.app)
2. Tạo project mới → "Deploy from GitHub repo"
3. Thêm MySQL plugin vào project Railway
4. Set environment variables trong Railway dashboard
5. Railway tự build và deploy
6. Verify app chạy đúng trên domain Railway cấp

## Todo List

- [ ] Tạo application-prod.properties
- [ ] Kiểm tra không có hardcoded credentials trong code
- [ ] Tạo Dockerfile
- [ ] Tạo tài khoản Railway
- [ ] Connect GitHub repo với Railway
- [ ] Thêm MySQL add-on
- [ ] Set env vars
- [ ] Deploy và verify

## Success Criteria

- App accessible qua domain Railway (xxx.railway.app)
- Tất cả tính năng hoạt động bình thường với MySQL trên Railway
- Logs không có lỗi
