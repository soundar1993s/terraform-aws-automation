#!/bin/bash

dnf update -y
dnf install nginx -y

systemctl enable nginx
systemctl start nginx

cat > /usr/share/nginx/html/index.html <<'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>AWS Terraform Project</title>
</head>
<body>
    <h1>AWS Infrastructure Automation</h1>
    <p>Deployed using Terraform and GitHub Actions</p>
</body>
</html>
EOF