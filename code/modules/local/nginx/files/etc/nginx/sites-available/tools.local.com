server {
    listen 10.20.1.150:80;
    root /u/docroot/data-tool;
    index index.html index.htm;
    server_name tools.local.com;

        access_log /var/log/nginx/tools.local.com_access_log main;
        error_log /var/log/nginx/tools.local.com_error_log info;

    location / {
        try_files $uri $uri/ /index.html?/$request_uri;
    }
}

server {
    listen 10.20.1.150:1337;

    location / {
        proxy_pass http://localhost:8888;
    }
}