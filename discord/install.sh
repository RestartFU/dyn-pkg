download_url=$(curl -w "%{redirect_url}" -o /dev/null -s "https://discord.com/api/download?platform=linux&format=tar.gz")
curl -o discord.tar.gz $download_url
tar -xf discord.tar.gz
rm -rf discord.tar.gz

if [ ! -d Discord/ ]; then
    echo "Directory not found!"
    exit 1
fi

killall Discord > /dev/null 2>&1 &
rm -rf ~/.discord
sudo rm -rf /usr/bin/discord

mv Discord ~/.discord
discord_path=$(realpath ~/.discord/Discord)
sudo ln -s $discord_path /usr/bin/discord
echo "symlink created for $discord_path to /usr/bin/discord"
