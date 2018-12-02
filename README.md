# README

* THIS APP IS UNDER DEVELOPMENT.

* Ruby version
2.5.3

* Rails version
5.2.1

* For start in local development
Prepare google OAuth API key and added `.env` like following.

```
GOOGLE_CLIENT_ID=YOUR GOOGLE_CLIENT_ID
GOOGLE_CLIENT_SECRET=YOUR_COOGLE_CLIERNT_SECRET
```

And command following.

```
docker-compose build
docker-compose up -d
docker-compose exec web rails db:create
docker-compose exec web rails db:migrate
docker-compose exec web rails db:seed_fu
```

To localhost:3000 you get 「うされこ」.

But now this app need to add first Rabbit data thoroguh rails console ! 


