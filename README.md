TO BE UPDATED SOON!

This repository contains dockerfiles to build dockercontainers for noetic, melodic and foxy

The containers are modified to suit the needs of conducting Active SLAM (ASLAM) on the leo-rover on a 3D gazebo map using the velodyne3D lidar.

TO BUILD THE IMAGES:
```./noetic-ros-build.sh```

TO RUN THE CONTAINER:
```sudo docker run --device="/dev/video0" -env="DISPLAY" --ipc=host --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" -it -v $HOME/.Xauthority:/home/suchetan/.Xauthority --net=host --privileged -v /dev/video0:/dev/video0 ubuntu-ros-noetic:20.04 /bin/bash```

