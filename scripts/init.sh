#!/usr/bin/bash

# Hide the output of the commands
set +x

# Set variables START
script_dir="$(dirname "$(readlink -f "$0")")"
app_folder="$script_dir/../../app"
create_cert_path="$script_dir/../docker/nginx/ssl/dev_signed_cert.sh"
cert_path="$script_dir/../docker/nginx/ssl/localhost.cert.pem"
cert_key_path="$script_dir/../docker/nginx/ssl/localhost.key.pem"
# Set variables END

# Check if app folder exists START
if [ ! -d "$app_folder" ]; then
  mkdir -p "$app_folder"
  echo "app folder created"
fi
# Check if app folder exists END

# Check if app folder is empty START
if [ -n "$(ls -A "$app_folder")" ]; then
  echo "app folder is not empty"
else
  cp -r "$script_dir"/assets/index.php "$app_folder"
  echo "app folder is empty and has been populated with index.php file"
fi
# Check if app folder is empty END

# Create cert files START
chmod +x "$create_cert_path"

if [ -f "$cert_path" ] && [ -f "$cert_key_path" ]; then
  echo "cert files already exists"
else
  echo "cert files does not exist creating them now"
  sleep 3
  $create_cert_path localhost
fi
# Create cert files END
