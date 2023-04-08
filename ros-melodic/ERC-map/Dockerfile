FROM ubuntu-ros-melodic:18.04

USER suchetan
WORKDIR /home/suchetan/
RUN echo u | sudo -S git clone --recurse-submodules https://github.com/EuropeanRoverChallenge/ERC-Remote-Navigation-Sim.git
WORKDIR /home/suchetan/ERC-Remote-Navigation-Sim
RUN rosdep update
RUN echo u | sudo -S rosdep install -y -r -q --from-paths src --ignore-src --rosdistro melodic -y
RUN echo u | sudo -S chmod -R a+rw *
RUN echo u | sudo -S chmod -R a+rw .*
RUN . /opt/ros/melodic/setup.sh && catkin init && catkin build

USER root
RUN echo 'source /home/suchetan/ERC-Remote-Navigation-Sim/devel/setup.bash --extend' >> /opt/ros/melodic/setup.bash
RUN echo 'source /home/suchetan/ERC-Remote-Navigation-Sim/devel/setup.zsh --extend' >> /opt/ros/melodic/setup.zsh

USER suchetan
WORKDIR /home/suchetan/