#IMAGE NAME: ubuntu-ros2-foxy:20.04

## This Dockerfile installs the following:
## [ros2-foxy,gazebo,ros2-nav2,turtlebot3,zsh,oh-my-zsh,powerlevel10k]
## The username is set to 'suchetan'

FROM ubuntu:20.04


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
RUN apt-get install git-all -y


#installing basic utilities
RUN apt-get install nautilus -y
RUN apt-get install -y lsb-release
RUN apt-get install curl -y
RUN apt-get install nano


#installing tmux
RUN apt-get install tmux -y
COPY .tmux.conf /home/suchetan/


#installing ROS 2
RUN locale
RUN apt update && sudo apt install locales
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN export LANG=en_US.UTF-8

RUN apt install software-properties-common -y
RUN add-apt-repository universe -y

RUN apt update
RUN sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
RUN apt update && apt-get upgrade -y
RUN apt install ros-foxy-desktop -y
RUN apt install ros-foxy-desktop python3-argcomplete -y


#colcon
RUN sudo apt install python3-colcon-common-extensions -y
RUN echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> /opt/ros/foxy/setup.bash
RUN echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.zsh" >> /opt/ros/foxy/setup.zsh


#cartographer and rosdep
RUN apt install ros-foxy-cartographer -y
RUN apt install ros-foxy-cartographer-ros -y
RUN echo u | sudo -S apt-get install python3-rosdep -y
RUN echo u | sudo -S rosdep init


#navigation2
USER suchetan
WORKDIR "/home/suchetan/"
RUN mkdir -p ros2_ws/src
WORKDIR "/home/suchetan/ros2_ws/src"
RUN git clone -b foxy-devel https://github.com/ros-planning/navigation2.git
WORKDIR "/home/suchetan/ros2_ws/"
RUN echo u | sudo -S rosdep update
RUN echo u | sudo -S rosdep install -y -r -q --from-paths src --ignore-src --rosdistro foxy -y
RUN . /opt/ros/foxy/setup.sh && colcon build --symlink-install


#gazebo11 --classic
USER suchetan
WORKDIR "/home/suchetan/ros2_ws/src"
RUN git clone -b foxy https://github.com/ros-simulation/gazebo_ros_pkgs.git
RUN git clone -b foxy https://github.com/ros-controls/gazebo_ros2_control.git
WORKDIR "/home/suchetan/ros2_ws/"
RUN echo u | sudo -S rosdep update
RUN echo u | sudo -S rosdep install -y -r -q --from-paths src --ignore-src --rosdistro foxy -y
RUN . /opt/ros/foxy/setup.sh && colcon build --symlink-install


#turtlebot3
USER suchetan
WORKDIR "/home/suchetan/ros2_ws/src"
RUN echo u | sudo -S sudo apt remove ros-foxy-turtlebot3-msgs
RUN echo u | sudo -S sudo apt remove ros-foxy-turtlebot3
RUN echo u | sudo -S git clone -b foxy-devel https://github.com/ROBOTIS-GIT/DynamixelSDK.git
RUN echo u | sudo -S git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
RUN echo u | sudo -S git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
RUN echo u | sudo -S git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
WORKDIR "/home/suchetan/ros2_ws/"
RUN echo u | sudo -S rosdep update
RUN echo u | sudo -S rosdep install -y -r -q --from-paths src --ignore-src --rosdistro foxy -y
RUN . /opt/ros/foxy/setup.sh && colcon build --symlink-install


#ros setup, bash and zsh
USER root
RUN echo 'source /home/suchetan/ros2_ws/install/setup.bash' >> /opt/ros/foxy/setup.bash
RUN echo 'source /home/suchetan/ros2_ws/install/setup.zsh' >> /opt/ros/foxy/setup.zsh
RUN echo 'source /opt/ros/foxy/setup.bash' >> /home/suchetan/.bashrc
RUN echo 'source /opt/ros/foxy/setup.zsh' >> /home/suchetan/.zshrc

RUN echo "export TURTLEBOT3_MODEL=burger" >> /home/suchetan/.bashrc
RUN echo "export GAZEBO_MODEL_PATH=:/home/suchetan/ros2_ws/install/turtlebot3_gazebo/share/turtlebot3_gazebo/models/" >> /home/suchetan/.bashrc
RUN echo "export ROS_DOMAIN_ID=11" >> /home/suchetan/.bashrc
RUN echo "export TURTLEBOT3_MODEL=burger" >> /home/suchetan/.zshrc
RUN echo "export GAZEBO_MODEL_PATH=:/home/suchetan/ros2_ws/install/turtlebot3_gazebo/share/turtlebot3_gazebo/models/" >> /home/suchetan/.zshrc
RUN echo "export ROS_DOMAIN_ID=11" >> /home/suchetan/.zshrc


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
WORKDIR /home/suchetan/ros2_ws
RUN apt-get install wget gpg -y
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
RUN install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
RUN rm -f packages.microsoft.gpg
RUN apt install apt-transport-https
RUN apt update
RUN apt install code -y


#some more basic utilities
RUN apt-get install mlocate -y

#ros2 custom workspace /dev_ws (move to new file)

#twist-mux

# #env variables
RUN echo 'zsh' >> /home/suchetan/.bashrc
RUN echo 'export DISPLAY=:0.0' >> /home/suchetan/.zshrc
RUN echo 'export DISPLAY=:0.0' >> /home/suchetan/.bashrc
RUN echo 'export XDG_RUNTIME_DIR=/tmp/runtime-suchetan' >>/home/suchetan/.zshrc
RUN echo 'export XDG_RUNTIME_DIR=/tmp/runtime-suchetan' >>/home/suchetan/.bashrc

# #restore DEBIAN_FRONTEND
ENV DEBIAN_FRONTEND="dialog"
USER root
WORKDIR "/"
