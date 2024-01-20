# Notes
The `composer` utility container can be used from local machine to create the laravel project:
```sh
docker compose run --rm composer create-project --prefer-dist laravel/laravel:^8.0 .
```
Note: Unable to make this work properly in Linux I have used `chmod 777 src` in my local before running the above command. I hope to understand the correct way to do this.
The root user from the composer service is creating the files using the root user. I don't understand why changing it to use the LARAVEL user is not working. But this means that all files created in the src folder belong to the user root and can't be edited without super user privileges.

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