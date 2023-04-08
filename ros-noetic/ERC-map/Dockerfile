FROM ubuntu-ros-noetic:20.04

USER suchetan
WORKDIR /home/suchetan/
RUN echo u | sudo -S git clone --recurse-submodules https://github.com/EuropeanRoverChallenge/ERC-Remote-Navigation-Sim.git
WORKDIR /home/suchetan/ERC-Remote-Navigation-Sim
RUN echo u | rosdep update
RUN echo u | sudo -S rosdep install -y -r -q --from-paths src --ignore-src --rosdistro noetic -y
RUN echo u | sudo -S chmod -R a+rw *
RUN echo u | sudo -S chmod -R a+rw .*
RUN . /opt/ros/noetic/setup.sh && catkin init && catkin build

USER root
RUN echo 'source /home/suchetan/ERC-Remote-Navigation-Sim/devel/setup.bash --extend' >> /opt/ros/noetic/setup.bash
RUN echo 'source /home/suchetan/ERC-Remote-Navigation-Sim/devel/setup.zsh --extend' >> /opt/ros/noetic/setup.zsh

# Copying the files
COPY ./worlds/inspection.world /home/suchetan/ERC-Remote-Navigation-Sim/src/leo_erc_desktop/leo_erc_gazebo_worlds/worlds/

WORKDIR /home/suchetan/ERC-Remote-Navigation-Sim/src/leo_erc_common/leo_erc_description/urdf/
RUN rm -rdf leo_erc.xacro
COPY ./urdf/leo_erc.xacro /home/suchetan/ERC-Remote-Navigation-Sim/src/leo_erc_common/leo_erc_description/urdf/

WORKDIR /home/suchetan/ERC-Remote-Navigation-Sim/src/leo_erc_desktop/leo_erc_gazebo/launch/
RUN rm -rf leo_gazebo.launch
RUN rm -rf leo_spawn_controllers.launch
RUN rm -rf spawn_model.launch
COPY ./launch/leo_gazebo.launch /home/suchetan/ERC-Remote-Navigation-Sim/src/leo_erc_desktop/leo_erc_gazebo/launch/
COPY ./launch/spawn_controllers.launch /home/suchetan/ERC-Remote-Navigation-Sim/src/leo_erc_desktop/leo_erc_gazebo/launch/
COPY ./launch/spawn_model.launch /home/suchetan/ERC-Remote-Navigation-Sim/src/leo_erc_desktop/leo_erc_gazebo/launch/
COPY ./launch/leo_inspection.launch /home/suchetan/ERC-Remote-Navigation-Sim/src/leo_erc_desktop/leo_erc_gazebo/launch/

ADD models /home/suchetan/ERC-Remote-Navigation-Sim/src/leo_erc_desktop/leo_erc_gazebo_worlds/models


USER suchetan
WORKDIR /home/suchetan/