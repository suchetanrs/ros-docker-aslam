# install 
# 1. Navigation
# 2. Gazebo 11
# 3. Turtlebot3
# 4. Velodyne 3D Lidar

cd "/home/suchetan/"
mkdir -p ros_ws/src
cd "/home/suchetan/ros_ws/src"
git clone -b noetic-devel https://github.com/ros-planning/navigation.git
cd "/home/suchetan/ros_ws/"
echo u | sudo -S rosdep fix-permissions
echo u | sudo -S rosdep update
source /opt/ros/noetic/setup.sh
echo u | sudo -S rosdep install -y -r -q --from-paths src --ignore-src --rosdistro noetic -y
. /opt/ros/noetic/setup.sh
catkin init
catkin build
. /opt/ros/noetic/setup.sh

cd "/home/suchetan/ros_ws/src"
git clone -b noetic-devel https://github.com/ros-simulation/gazebo_ros_pkgs.git
cd "/home/suchetan/ros_ws/"
echo u | sudo -S rosdep update
. /opt/ros/noetic/setup.sh
echo u | sudo -S rosdep install -y -r -q --from-paths src --ignore-src --rosdistro noetic -y
. /opt/ros/noetic/setup.sh
catkin build
. /opt/ros/noetic/setup.sh

cd "/home/suchetan/ros_ws/src"
echo u | sudo -S sudo apt remove ros-noetic-turtlebot3-msgs
echo u | sudo -S sudo apt remove ros-noetic-turtlebot3
echo u | sudo -S git clone -b noetic-devel https://github.com/ROBOTIS-GIT/DynamixelSDK.git
echo u | sudo -S git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
echo u | sudo -S git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
echo u | sudo -S git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
cd "/home/suchetan/ros_ws/"
echo u | sudo -S rosdep update
. /opt/ros/noetic/setup.sh
echo u | sudo -S rosdep install -y -r -q --from-paths src --ignore-src --rosdistro noetic -y
. /opt/ros/noetic/setup.sh
catkin build
. /opt/ros/noetic/setup.sh

cd "/home/suchetan/ros_ws/src"
echo u | sudo -S git clone -b melodic-devel https://github.com/ros-drivers/velodyne.git
cd "/home/suchetan/ros_ws/src/velodyne"
echo u | sudo -S git clone https://bitbucket.org/DataspeedInc/velodyne_simulator.git
cd "/home/suchetan/ros_ws/"
echo u | sudo -S rosdep update
. /opt/ros/noetic/setup.sh
echo u | sudo -S rosdep install -y -r -q --from-paths src --ignore-src --rosdistro noetic -y
. /opt/ros/noetic/setup.sh
catkin build
. /opt/ros/noetic/setup.sh