cd ./ros-melodic/base
sudo docker build -t ubuntu-ros-melodic:18.04 .
echo "ROS-MELODIC on UBUNTU:18.04 COMPLETED!!"

cd ../..

cd ./ros-melodic/Velodyne3DLidar
sudo docker build -t ubuntu-ros-melodic:18.04 .
echo "VELODYNE3D LIDAR added to TURTLEBOT3!!"

cd ../..

cd ./ros-melodic/ERC-map
sudo docker build -t ubuntu-ros-melodic:18.04 .
echo "ERC2020/21/22 MAP Added!!"

cd ../..

echo "RUN THE IMAGE ubuntu-ros-melodic:18.04 to TRY!"
