WORK IN PROGRESS!

This repository contains dockerfiles to build dockercontainers for noetic, melodic and foxy.

The containers are modified to suit the needs of conducting Active SLAM (ASLAM) on the leo-rover on a 3D gazebo map using the velodyne3D lidar.

Please follow the steps if you wish to try it out.

To clone this repository:
```git clone https://github.com/suchetanrs/ros-docker-aslam```

To build the image.
```./noetic-ros-build.sh```

To start a container:
```sudo docker run --device="/dev/video0" -env="DISPLAY" --ipc=host --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" -it -v $HOME/.Xauthority:/home/suchetan/.Xauthority --net=host --privileged -v /dev/video0:/dev/video0 ubuntu-ros-noetic:20.04 /bin/bash```

To run the simulation you can run the following commands:
```roslaunch leo_erc_gazebo leo_inspection.launch #to launch the world```
```roslaunch leo_erc_gazebo spawn_robot.launch #to spawn the robot```
