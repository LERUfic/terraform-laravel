resource "kubernetes_config_map" "nginx_config" {
  metadata {
    name      = "nginx-config"
    namespace = "default"

    labels = {
      name = "nginx-config"
    }
  }

  data = {
    "default.conf" = "# nginx configuration\n\nupstream allworker {\n    server php:9000;\n}\n\nserver {\n\n    listen 80 default_server;\n    listen [::]:80 default_server;\n\n    server_name localhost;\n\n    root /var/www/public;\n    index index.php index.html;\n\n    location / {\n        try_files $uri /index.php?$args;\n    }\n\n    location ~ \\.php$ {\n        #fastcgi_keep_conn on;\n        fastcgi_pass   allworker;\n        fastcgi_index  index.php;\n        fastcgi_param  SCRIPT_FILENAME $document_root$fastcgi_script_name;\n        include        fastcgi_params;\n    }\n}"
  }
}

