redirect=$(curl -w "%{redirect_url}" -o /dev/null -s "https://github.com/RestartFU/dyn/releases/latest/download/dyn")
download_url=$(curl -w "%{redirect_url}" -o /dev/null -s $redirect)
curl -o dyn $download_url
chmod +x dyn
sudo mv dyn /usr/bin/dyn
