# AngkorGreen: Docker Backend Image

## Usage

**Pull image from the command line**:

```sh
docker pull docker.pkg.github.com/angkorgreen/backend-docker-image/backend-docker-image:latest
```

**Use as base image in DockerFile**:

```Dockerfile
FROM docker.pkg.github.com/angkorgreen/backend-docker-image/backend-docker-image:latest
```

### Example

```Dockerfile
# Stage 1
FROM docker.pkg.github.com/angkorgreen/backend-docker-image/backend-docker-image:latest

WORKDIR /var/www

COPY . /var/www

RUN composer install \
    --no-dev \
    --optimize-autoloader

RUN chown -R www:www /var/www

EXPOSE 9000
CMD ["php-fpm"]
```

### [MIT License](LICENSE)
