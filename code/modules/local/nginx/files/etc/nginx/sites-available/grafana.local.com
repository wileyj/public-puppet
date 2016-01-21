server {
    listen  8001;
    server_name grafana.local.com;
    charset utf-8;
    access_log /var/log/nginx/grafana.local.com/access_log;
    error_log /var/log/nginx/grafana.local.com/error_log;

    location / {
        proxy_pass http://localhost:3000;
    }
}
