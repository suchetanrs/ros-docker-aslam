cd ./ros-noetic/base
sudo docker build -t ubuntu-ros-noetic:20.04 .
echo "ROS-noetic on UBUNTU:20.04 COMPLETED!!"

cd ../..

cd ./ros-noetic/Velodyne3DLidar
sudo docker build -t ubuntu-ros-noetic:20.04 .
echo "VELODYNE3D LIDAR added to TURTLEBOT3!!"

cd ../..

cd ./ros-noetic/ERC-map
sudo docker build -t ubuntu-ros-noetic:20.04 .
echo "ERC2020/21/22 MAP Added!!"
echo "VELODYNE3D LIDAR added to LEO ROVER!!"
echo "Run the following: "
echo "roslaunch leo_erc_gazebo leo_inspection.launch"
echo "roslaunch leo_erc_gazebo spawn_robot.launch"
echo ""
echo ""

cd ../..

cd ./ros-noetic/Traversability-map
sudo docker build -t ubuntu-ros-noetic:20.04 .
echo "Elevation map added"

cd ../..

echo "RUN THE IMAGE ubuntu-ros-noetic:20.04 to TRY!"