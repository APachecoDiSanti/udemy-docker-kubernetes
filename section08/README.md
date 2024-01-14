# Notes
The `composer` utility container can be used from local machine to create the laravel project:
```sh
docker compose run --rm composer create-project --prefer-dist laravel/laravel:^8.0 .
```
Note: Unable to make this work properly in Linux I have used `chmod 777 src` in my local before running the above command. I hope to understand the correct way to do this.

In `src/.env` update the variables:
```sh
DB_DATABASE=homestead
DB_USERNAME=homestead
DB_PASSWORD=secret
```

To run the project:
```sh
docker compose up mysql server php
```