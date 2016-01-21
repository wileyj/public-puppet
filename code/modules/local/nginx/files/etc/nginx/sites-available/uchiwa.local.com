map $http_upgrade $connection_upgrade {
    default upgrade;
    '' close;
}

upstream uchiwa_server {
    server 127.0.0.1:3000 fail_timeout=0;
}

server {
    listen 80;
    server_name uchiwa.local.com;

    access_log /var/log/nginx/uchiwa.local.com_access_log main;
    error_log /var/log/nginx/uchiwa.local.com_error_log info;

    location / {
        proxy_pass http://uchiwa_server;
        proxy_set_header Host $host;
        proxy_redirect off;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }
}