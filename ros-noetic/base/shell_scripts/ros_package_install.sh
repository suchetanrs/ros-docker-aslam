# install 
# 1. Navigation
# 2. Gazebo 11
# 3. Turtlebot3
# 4. Velodyne 3D Lidar

apt-get install python3-rosdep -y
rosdep init


cd "/home/suchetan/"
mkdir -p ros_ws/src

cd "/home/suchetan/ros_ws/src"
git clone -b noetic-devel https://github.com/ros-planning/navigation.git

cd "/home/suchetan/ros_ws/src"
git clone -b noetic-devel https://github.com/ros-simulation/gazebo_ros_pkgs.git

cd "/home/suchetan/ros_ws/src"
git clone -b noetic-devel https://github.com/ros/geometry2.git

cd "/home/suchetan/ros_ws/src"
sudo apt remove ros-noetic-turtlebot3-msgs
sudo apt remove ros-noetic-turtlebot3
git clone -b noetic-devel https://github.com/ROBOTIS-GIT/DynamixelSDK.git
git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git

cd "/home/suchetan/ros_ws/src"
git clone -b melodic-devel https://github.com/ros-drivers/velodyne.git
cd "/home/suchetan/ros_ws/src/velodyne"
git clone https://bitbucket.org/DataspeedInc/velodyne_simulator.git


cd "/home/suchetan/ros_ws/"
apt-get update
apt update --fix-missing
rosdep update
. /opt/ros/noetic/setup.sh
rosdep install -y -r -q --from-paths src --ignore-src --rosdistro noetic -y
. /opt/ros/noetic/setup.sh


apt-get install -y build-essential
cd "/home/suchetan/ros_ws"
catkin init
catkin build
. /opt/ros/noetic/setup.sh