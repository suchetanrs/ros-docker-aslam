#IMAGE NAME: ubuntu-ros-melodic:18.04

## This Dockerfile installs the following:
## [ros2-melodic,gazebo,ros2-nav2,turtlebot3,zsh,oh-my-zsh,powerlevel10k]
## The username is set to 'suchetan'

FROM ubuntu:18.04


RUN apt-get update
RUN apt-get -y upgrade


#create user
RUN apt-get install -y sudo
RUN adduser --disabled-password --gecos '' suchetan
RUN echo 'suchetan:u' | chpasswd
RUN sudo usermod -a -G sudo suchetan


#setup
ENV DEBIAN_FRONTEND="noninteractive" 


#installing git
RUN apt-get install git -y


#installing basic utilities
RUN apt-get install nautilus -y
RUN apt-get install -y lsb-release
RUN apt-get install curl -y
RUN apt-get install nano


#installing tmux
RUN apt-get install tmux -y
COPY .tmux.conf /home/suchetan/


#installing ROS
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
RUN apt update
RUN apt install ros-melodic-desktop-full -y
RUN apt-get install python3-catkin-tools -y


# --- ROS PACKAGE ---
#cartographer and rosdep
RUN apt install ros-melodic-cartographer -y
RUN apt install ros-melodic-cartographer-ros -y
RUN echo u | sudo -S apt-get install python3-rosdep -y
RUN echo u | sudo -S rosdep init

#can be removed, is redundant
USER suchetan
WORKDIR /home/
RUN echo u | sudo -S chmod -R a+rw *
USER root


# --- ROS PACKAGE ---
#navigation
USER suchetan
WORKDIR "/home/suchetan/"
RUN mkdir -p ros_ws/src
WORKDIR "/home/suchetan/ros_ws/src"
RUN git clone -b melodic-devel https://github.com/ros-planning/navigation.git
WORKDIR "/home/suchetan/ros_ws/"
RUN echo u | sudo -S rosdep fix-permissions
RUN rosdep update
RUN echo u | sudo -S rosdep install -y -r -q --from-paths src --ignore-src --rosdistro melodic -y
RUN . /opt/ros/melodic/setup.sh && catkin init && catkin build


# --- ROS PACKAGE ---
#gazebo11 --classic
USER suchetan
WORKDIR "/home/suchetan/ros_ws/src"
RUN git clone -b melodic-devel https://github.com/ros-simulation/gazebo_ros_pkgs.git
WORKDIR "/home/suchetan/ros_ws/"
RUN rosdep update
RUN echo u | sudo -S rosdep install -y -r -q --from-paths src --ignore-src --rosdistro melodic -y
RUN . /opt/ros/melodic/setup.sh && catkin build


# --- ROS PACKAGE ---
#turtlebot3
USER suchetan
WORKDIR "/home/suchetan/ros_ws/src"
RUN echo u | sudo -S sudo apt remove ros-melodic-turtlebot3-msgs
RUN echo u | sudo -S sudo apt remove ros-melodic-turtlebot3
RUN echo u | sudo -S git clone -b melodic-devel https://github.com/ROBOTIS-GIT/DynamixelSDK.git
RUN echo u | sudo -S git clone -b melodic-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
RUN echo u | sudo -S git clone -b melodic-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
RUN echo u | sudo -S git clone -b melodic-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
WORKDIR "/home/suchetan/ros_ws/"
RUN rosdep update
RUN echo u | sudo -S rosdep install -y -r -q --from-paths src --ignore-src --rosdistro melodic -y
RUN . /opt/ros/melodic/setup.sh && catkin build


# --- ROS PACKAGE ---
# installing velodyne
USER suchetan
WORKDIR "/home/suchetan/ros_ws/src"
RUN echo u | sudo -S git clone -b melodic-devel https://github.com/ros-drivers/velodyne.git
WORKDIR "/home/suchetan/ros_ws/src/velodyne"
RUN echo u | sudo -S git clone https://bitbucket.org/DataspeedInc/velodyne_simulator.git
WORKDIR "/home/suchetan/ros_ws/"
RUN rosdep update
RUN echo u | sudo -S rosdep install -y -r -q --from-paths src --ignore-src --rosdistro melodic -y
RUN . /opt/ros/melodic/setup.sh && catkin build


# --- ROS PACKAGE ---
#ros-controllers
USER suchetan
WORKDIR "/home/suchetan/ros_ws/src"
RUN git clone -b melodic-devel https://github.com/ros-controls/ros_control
WORKDIR "/home/suchetan/ros_ws/"
RUN rosdep update
RUN echo u | sudo -S rosdep install -y -r -q --from-paths src --ignore-src --rosdistro melodic -y
RUN . /opt/ros/melodic/setup.sh && catkin build



# #installing zsh
USER root
RUN apt-get install zsh -y
USER suchetan
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
COPY .zshrc /home/suchetan
COPY .p10k.zsh /home/suchetan
USER root


#installing visual studio code
WORKDIR /home/suchetan/ros_ws
RUN apt-get install wget gpg -y
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
RUN install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
RUN rm -f packages.microsoft.gpg
RUN apt install apt-transport-https
RUN apt update
RUN apt update --fix-missing
RUN apt install code -y


#some more basic utilities
RUN apt-get install mlocate -y


#vim
USER root
RUN apt-get install vim -y
RUN apt-get install ranger -y


# #env variables
USER root
RUN echo 'zsh' >> /home/suchetan/.bashrc
RUN echo 'export DISPLAY=:0.0' >> /home/suchetan/.zshrc
RUN echo 'export DISPLAY=:0.0' >> /home/suchetan/.bashrc
RUN echo 'export XDG_RUNTIME_DIR=/tmp/runtime-suchetan' >>/home/suchetan/.zshrc
RUN echo 'export XDG_RUNTIME_DIR=/tmp/runtime-suchetan' >>/home/suchetan/.bashrc
WORKDIR "/tmp"
RUN mkdir runtime-suchetan
RUN chmod a+rw runtime-suchetan
WORKDIR "/home/suchetan"


#ros setup, bash and zsh
USER root
RUN echo 'source /home/suchetan/ros_ws/devel/setup.bash' >> /opt/ros/melodic/setup.bash
RUN echo 'source /home/suchetan/ros_ws/devel/setup.zsh' >> /opt/ros/melodic/setup.zsh
RUN echo 'source /opt/ros/melodic/setup.bash' >> /home/suchetan/.bashrc
RUN echo 'source /opt/ros/melodic/setup.zsh' >> /home/suchetan/.zshrc


RUN echo "export TURTLEBOT3_MODEL=waffle" >> /home/suchetan/.bashrc
RUN echo "export TURTLEBOT3_MODEL=waffle" >> /home/suchetan/.zshrc

RUN echo "alias ranger='ranger --choosedir=/home/suchetan/.rangerdir; LASTDIR=\`cat /home/suchetan/.rangerdir\`; cd ""\$LASTDIR""'" >> /home/suchetan/.zshrc


USER suchetan
WORKDIR /home/suchetan/
RUN echo u | sudo -S chmod -R a+rw *
RUN echo u | sudo -S chmod -R a+rw .*
USER root


# #restore DEBIAN_FRONTEND
ENV DEBIAN_FRONTEND="dialog"
USER suchetan
WORKDIR "/home/suchetan"