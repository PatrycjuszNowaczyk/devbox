#!/usr/bin/bash

# Hide the output of the commands
set +x

# Set variables START
script_dir="$(dirname "$(readlink -f "$0")")"
app_folder="$script_dir/../../app"
cert_path="$script_dir/../docker/nginx/ssl/localhost.cert.pem"
cert_key_path="$script_dir/../docker/nginx/ssl/localhost.key.pem"
compose_file="$script_dir/../compose.yml"

is_app_folder=0
is_cert=0
is_cert_key=0
# Set variables END

# Check if app folder exists START
if [ -d "$app_folder" ]; then
  is_app_folder=1
fi
# Check if app folder exists END

# Check if cert exist START
if [ -f "$cert_path" ]; then
  is_cert=1
fi
# Check if cert exist END


# Check if cert key exist START
if [ -f "$cert_key_path" ]; then
  is_cert_key=1
fi
# Check if cert key exist END

# Echo the results START
if [ $is_app_folder -eq 0 ]; then
  echo "app folder does not exist"
fi

if [ $is_cert -eq 0 ]; then
  echo "cert file does not exist"
fi

if [ $is_cert_key -eq 0 ]; then
  echo "cert key file does not exist"
fi
# Echo the results END

# Check if all the necessary files exist START
if [ $is_app_folder -eq 0 ] || [ $is_cert -eq 0 ] || [ $is_cert_key -eq 0 ]; then
  echo -e "\n"
  echo "In order to create the necessary files, please run the following command:"
  echo "make init"
  exit 0
fi
# Check if all the necessary files exist END

# Start the containers
docker compose -f "$compose_file" up -d
