# Description

**docker-redmine-plugins** Dockerfile to build a container image with plugins for Redmine.

## List of plugins

### Easy Redmine

 * Chat
 * WBS plugin

### RedmineUp

 * Agile plugin
 * Checklist plugin
 * CRM plugin
 * Favorite projects plugin
 * Finance plugin
 * Invoces plugin
 * People plugin
 * Products plugin
 * Redmine questions
 * Tags plugin

### RM+

 * Extra queries
 * Global roles
 * Issue tabs
 * Under construction
 * Unread issues
 * Usability
 * User mentions


# Installation

Here is an example of how you can use the image.

Docker-Compose:
```
version: '2'

volumes:
  redmine-themes:
  redmine-plugins:
  redmine-initdb:
  redmine-database:

services:
  redmine-themes:
    image: dmitriiageev/redmine-themes
    volumes:
      - redmine-themes:/usr/src/redmine/public/themes

  redmine-plugins:
    image: dmitriiageev/redmine-plugins
    volumes:
      - redmine-plugins:/usr/src/redmine/plugins
      - redmine-initdb:/docker-entrypoint-initdb.d

  # PostgreSQL database service, to use it
  # uncomment lines below, and remove MySQL service.
  # postgres:
  #   image: postgres
  #   restart: always
  #   depends_on:
  #     - redmine-plugins
  #   environment:
  #     POSTGRES_DATABASE: redmine
  #     POSTGRES_USER: redmine
  #     POSTGRES_PASSWORD: password
  #   volumes:
  #     - redmine-initdb:/docker-entrypoint-initdb.d
  #     - redmine-database:/var/lib/postgresql/data

  mysql:
    image: mysql
    command: --default-authentication-plugin=mysql_native_password
    restart: always
    environment:
      MYSQL_DATABASE: redmine
      MYSQL_USER: redmine
      MYSQL_PASSWORD: password
      MYSQL_RANDOM_ROOT_PASSWORD: "yes"
    volumes:
      - redmine-initdb:/docker-entrypoint-initdb.d
      - redmine-database:/var/lib/mysql

  redmine:
    image: redmine
    restart: always
    depends_on:
      #- postgres
      - mysql
      - redmine-plugins
      - redmine-themes
    environment:
      #REDMINE_DB_POSTGRES: postgres
      #REDMINE_DB_PORT: 5432

      REDMINE_DB_MYSQL: mysql
      REDMINE_DB_PORT: 3306
      REDMINE_DB_DATABASE: redmine
      REDMINE_DB_USERNAME: redmine
      REDMINE_DB_PASSWORD: password
      REDMINE_PLUGINS_MIGRATE: "yes"
    ports:
      - 80:3000
    volumes:
      - redmine-themes:/usr/src/redmine/public/themes
      - redmine-plugins:/usr/src/redmine/plugins
```

# Upgrading

To upgrade to newer releases, simply pull the new image from the Docker hub, recreate and restart docker-compose containers.


# References

 * [Redmine](https://www.redmine.org)
 * [Easy Redmine](https://www.easyredmine.com)
 * [RedmineUP](https://www.redmineup.com)
 * [RM+](https://rmplus.pro)

# Author

 **Dmitrii Ageev** [(d.ageev@gmail.com)](mailto:d.ageev@gmail.com)

