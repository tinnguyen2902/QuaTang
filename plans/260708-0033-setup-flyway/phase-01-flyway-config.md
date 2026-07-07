# Phase 1: Flyway Configuration

## Overview
Status: **Not Started**
Priority: **High**

Configure Flyway dependencies and update Spring Boot properties to stop Hibernate from modifying the schema.

## Related Code Files
- [build.gradle](file:///Users/thienphan/Project/tinnguyen/build.gradle)
- [application.properties](file:///Users/thienphan/Project/tinnguyen/src/main/resources/application.properties)

## Implementation Steps

1. **Add Dependencies:**
   - In `build.gradle`, add `implementation 'org.flywaydb:flyway-core'`
   - In `build.gradle`, add `implementation 'org.flywaydb:flyway-mysql'`

2. **Update JPA Configuration:**
   - In `application.properties`, change `spring.jpa.hibernate.ddl-auto=${DB_DDL_AUTO:update}` to `spring.jpa.hibernate.ddl-auto=${DB_DDL_AUTO:validate}`. This ensures Hibernate will only validate the schema, not change it.

3. **Configure Flyway Properties (Optional but Recommended):**
   - In `application.properties`, add `spring.flyway.baseline-on-migrate=true` to handle existing databases safely.

## Todo List
- [ ] Add dependencies
- [ ] Update `application.properties`
