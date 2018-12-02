# README

* Ruby version
2.5.3

* Rails version
5.2.1

* For start in local development

```
docker-compose build
docker-compose up -d
docker-compose exec web rails db:create
docker-compose exec web rails db:migrate
docker-compose exec web rails db:seed_fu
```
