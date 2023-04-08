FROM ubuntu-ros-melodic:18.04

USER root
COPY turtlebot3_burger_for_velodyne3D.urdf.xacro /home/suchetan/ros_ws/src/turtlebot3/turtlebot3_description/urdf/
COPY turtlebot3_waffle_for_velodyne3D.urdf.xacro /home/suchetan/ros_ws/src/turtlebot3/turtlebot3_description/urdf/
COPY turtlebot3_velodyne3D.launch /home/suchetan/ros_ws/src/turtlebot3_simulations/turtlebot3_gazebo/launch/

USER suchetan
WORKDIR /home/suchetan/
RUN echo u | sudo -S chmod -R a+rw *
RUN echo u | sudo -S chmod -R a+rw .*

USER suchetan
WORKDIR /home/suchetan/
