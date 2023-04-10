sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
apt update
apt install ros-noetic-desktop-full -y

apt-get install python3-catkin-tools -y

# #rosdep
apt-get update
apt-get install python3-rosdep -y
echo u | sudo -S rosdep init