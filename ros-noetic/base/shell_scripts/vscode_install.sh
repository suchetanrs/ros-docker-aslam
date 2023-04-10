#installing visual studio code
cd /home/suchetan/ros_ws
echo u | sudo -S apt-get install wget gpg -y
echo u | sudo -S wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
echo u | sudo -S install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo u | sudo -S sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
echo u | sudo -S rm -f packages.microsoft.gpg
echo u | sudo -S apt install apt-transport-https
echo u | sudo -S apt update
echo u | sudo -S apt update --fix-missing
echo u | sudo -S apt install code -y