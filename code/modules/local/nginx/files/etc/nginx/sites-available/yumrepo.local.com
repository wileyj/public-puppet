server {
    listen          <ip>:80;
    server_name     yumrepo.local.com;

    access_log /var/log/nginx/yumrepo.local.com_access_log main;
    error_log /var/log/nginx/yumrepo.local.com_error_log info;

    location / {
    root         /yumrepo;
    autoindex on;
    }
}