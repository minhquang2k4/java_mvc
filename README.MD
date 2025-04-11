# Laptopshop

Laptopshop là một dự án mẫu được xây dựng bằng Java, sử dụng kiến trúc MVC (Model-View-Controller) và tích hợp với Maven để quản lý các thư viện và build project. Dự án này sử dụng Spring Boot để phát triển ứng dụng web nhanh chóng và hiệu quả.

## Công nghệ sử dụng

- **Java 17**: Ngôn ngữ lập trình chính.
- **Spring Boot**: Framework để xây dựng ứng dụng web.
- **Maven**: Công cụ quản lý dự án và phụ thuộc.
- **MySQL**: Cơ sở dữ liệu quan hệ.
- **JSP**: Công nghệ hiển thị giao diện.
- **Spring Security**: Bảo mật ứng dụng.


## Chức năng chính

- Hiển thị giao diện người dùng cơ bản.
- Kết nối cơ sở dữ liệu MySQL.
- Cấu hình bảo mật cơ bản với Spring Security.
- Sử dụng JSP làm công cụ hiển thị giao diện.

## Hướng dẫn chạy dự án

1. Cài đặt **Java 17** và **Maven** trên máy tính.
2. Cấu hình cơ sở dữ liệu MySQL và cập nhật thông tin trong file `application.properties`.
3. Chạy lệnh sau để khởi động ứng dụng:
   ```bash
   ./mvnw spring-boot:run