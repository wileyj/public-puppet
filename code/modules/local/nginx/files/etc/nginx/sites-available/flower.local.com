map $http_upgrade $connection_upgrade {
    default upgrade;
    '' close;
}

upstream app_server {
    server 127.0.0.1:5555 fail_timeout=0;
}

server {
    listen 10.20.0.193:80;
    server_name flower.local.com;

    access_log /var/log/nginx/flower.local.com_access_log main;
    error_log /var/log/nginx/flower.local.com_error_log info;

    location / {
        proxy_pass http://app_server;
        proxy_set_header Host $host;
        proxy_redirect off;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }

    location /crm {
        root /u/docroot/crm;
        try_files $uri $uri/ /index.html?/$request_uri;
    }
}