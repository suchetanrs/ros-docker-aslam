#Eigen - dep 1
cd /home/suchetan/ros_ws/src
apt-get install libeigen3-dev -y

#kindr - dep 2
git clone https://github.com/leggedrobotics/kindr

#grid map - dep 3
git clone https://github.com/leggedrobotics/grid_map

#elevation map - dep 4
git clone https://github.com/leggedrobotics/elevation_mapping

#any node - dep 5
git clone https://github.com/leggedrobotics/any_node

#message logger - dep 6
git clone https://github.com/ANYbotics/message_logger

#kindr_ros_wrapper - dep 7
git clone https://github.com/anybotics/kindr_ros

#TRAVERSABILITY MAP!
git clone https://github.com/leggedrobotics/traversability_estimation

cd "/home/suchetan/ros_ws/"
apt-get update
apt update --fix-missing
rosdep update
. /opt/ros/noetic/setup.sh
rosdep install -y -r -q --from-paths src --ignore-src --rosdistro noetic -y
. /opt/ros/noetic/setup.sh

cd "/home/suchetan/ros_ws"
catkin build
. /opt/ros/noetic/setup.sh