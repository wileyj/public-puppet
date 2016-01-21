upstream myapp {
    server 127.0.0.1:3031;
}

server {
    listen 8000;
    server_name graphite.local.com;
    access_log /var/log/nginx/graphite.local.com/access_log;
    error_log /var/log/nginx/graphite.local.com/error_log;
    root /opt/graphite/webapp/graphite;
    location / {
        add_header Access-Control-Allow-Origin "*";
        add_header Access-Control-Allow-Methods "GET, OPTIONS";
        add_header Access-Control-Allow-Headers "origin, authorization, accept";
        uwsgi_pass myapp;
        include uwsgi_params;
    }
}