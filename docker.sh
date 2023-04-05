#!/bin/sh
docker run --rm \
  -p 0.0.0.0:8888:80 \
  -p 0.0.0.0:8889:443/tcp \
  -p 0.0.0.0:8889:443/udp \
  \
  -v "$PWD/default-config":/static:ro \
  -v "$PWD/default-config/modules.conf":/etc/nginx/main.d/modules.conf:ro \
  -v "$PWD/default-config/perl_rewrite.conf":/etc/nginx/conf.d/perl_rewrite.conf:ro \
  \
  -v "$PWD/default-config/static.conf":/etc/nginx/conf.d/static.conf:ro \
  -v "$PWD/default-config/https.conf":/etc/nginx/conf.d/https.conf:ro \
  \
  -v "$PWD/default-config/njs.conf":/etc/nginx/conf.d/njs.conf:ro \
  -v "$PWD/default-config/njs":/opt/njs:ro \
  \
  -v "$PWD/default-config/localhost.crt":/etc/nginx/ssl/localhost.crt:ro \
  -v "$PWD/default-config/localhost.key":/etc/nginx/ssl/localhost.key:ro \
  \
  --name nginx-http3-test \
  -t nginx-http3
