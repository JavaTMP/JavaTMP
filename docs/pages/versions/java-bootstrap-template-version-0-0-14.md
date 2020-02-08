---
title: Java Bootstrap Template Version 0.0.14 (published on February 8, 2020)
---
# {{ page.title }}

## 5f754c1 on Feb 8, 2020, 10:04 PM GMT+4
- Refactor all online documentation pages for removing `JavaTMP-User-Starter` and introducing `JavaTMP-App-Starter`
- Prepare `JavaTMP-App-Starter` project for release 0.0.14.
- Create a `JavaTMP-App-Starter` project which
is an advanced Dynamic Java Spring Boot Bootstrap LTR/RTL multi languages
App Management Web application Template
- Migrate Native Authorization to Spring Security Module
- Refactor Servlet controllers to be Spring Boot Controllers or RestControllers
- Migrate Custom JPA Repositories to Spring Data Repositories
- Create a Spring Boot Testing classes
- Update the following dependencies in package.json:
    - @fortawesome/fontawesome-free from 5.11.2 to 5.12.1
    - handlebars from 4.7.2 to 4.7.3
    - gulp-git from 2.9.0  to 2.10.0
    - gulp-rename from 1.4.0 to 2.0.0
    - async from 3.1.0 to 3.1.1
    - handlebars from 4.5.3 to 4.7.2
    - inputmask from 4.0.9 to 5.0.3
    - popper.js from 1.16.0 to 1.16.1
    - select2 from 4.0.12 to 4.0.13
    - summernote from 0.8.14 to 0.8.15
    - yargs from 15.0.2 to 15.1.0
- Run npm install to fetch new dependencies to ./node_modules folder.
- Run gulp default to regenerate dist folders.