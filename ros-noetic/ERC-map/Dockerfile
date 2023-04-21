FROM ubuntu-ros-noetic:20.04

COPY ./shell_scripts/* /home/suchetan/
RUN cd /home/suchetan/ && chmod +x * && ./erc_map_clone.sh

COPY ./worlds/inspection.world /home/suchetan/ERC-Remote-Navigation-Sim/src/leo_erc_desktop/leo_erc_gazebo_worlds/worlds/
COPY ./urdf/leo_erc.xacro /home/suchetan/ERC-Remote-Navigation-Sim/src/leo_erc_common/leo_erc_description/urdf/
COPY ./launch/* /home/suchetan/ERC-Remote-Navigation-Sim/src/leo_erc_desktop/leo_erc_gazebo/launch/
ADD models /home/suchetan/ERC-Remote-Navigation-Sim/src/leo_erc_desktop/leo_erc_gazebo_worlds/models