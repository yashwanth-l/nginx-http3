# nginx-http3

nginx binary is built from [`quic`](https://hg.nginx.org/nginx-quic)

## Usage

Uses the brotli module [documentation](https://github.com/google/ngx_brotli#configuration-directives)

## nginx Settings

- [built-in nginx modules](https://nginx.org/en/docs/)

- [`headers-more-nginx-module`](https://github.com/openresty/headers-more-nginx-module#readme) - sets and clears HTTP request and response headers

- [`ngx_brotli`](https://github.com/google/ngx_brotli#configuration-directives) - adds [brotli response compression](https://datatracker.ietf.org/doc/html/rfc7932)

- [`ngx_http_geoip2_module`](https://github.com/leev/ngx_http_geoip2_module#download-maxmind-geolite2-database-optional) - creates variables with values from the maxmind geoip2 databases based on the client IP

- [`nginx_cookie_flag_module`](https://github.com/AirisX/nginx_cookie_flag_module#installation) - This module for Nginx allows to set the flags "HttpOnly", "secure" and "SameSite" for cookies in the "Set-Cookie" upstream response headers. The register of letters for the flags doesn't matter as it will be converted to the correct value. The order of cookie declaration among multiple directives doesn't matter too. It is possible to set a default value using symbol "*". In this case flags will be added to the all cookies if no other value for them is overriden

- [`njs` module](https://nginx.org/en/docs/njs/) - a subset of the JavaScript language that allows extending nginx functionality


## SSL Handling

DHE ciphers fetched and stored in `/etc/ssl/dhparam.pem`:

```sh
  ssl_dhparam /etc/ssl/dhparam.pem;
```

## nginx Config Files

- `.conf` files mounted in `/etc/nginx/main.d` will be included in the `main` nginx context (e.g. you can call [`env` directive](http://nginx.org/en/docs/ngx_core_module.html#env) there)

- `.conf` files mounted in `/etc/nginx/conf.d` will be included in the `http` nginx context

## QUIC + HTTP/3 support

Refer `default-config/https.conf` config file for an example config.

Refer to `docker.sh` script on how to run this container and properly mount required config files and assets.

## Development

Building Image:

```sh
DOCKER_BUILDKIT=1 docker build . -t nginx-http3-test
```
