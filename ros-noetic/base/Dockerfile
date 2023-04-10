#IMAGE NAME: ubuntu-ros-noetic:20.04

## This Dockerfile installs the following:
## [ros2-noetic,gazebo,ros2-nav2,turtlebot3,zsh,oh-my-zsh,powerlevel10k]
## The username is set to 'suchetan'

FROM ubuntu:20.04
RUN apt-get update && apt-get -y upgrade

#create user
RUN apt-get install -y sudo && adduser --disabled-password --gecos '' suchetan && echo 'suchetan:u' | chpasswd && sudo usermod -a -G sudo suchetan

#setup
ENV DEBIAN_FRONTEND="noninteractive" 

COPY ./shell_scripts/* /home/suchetan/
RUN cd /home/suchetan/ && echo u | sudo -S chmod +x *
RUN cd /home/suchetan && ./basic_util.sh && ./ros_install.sh && ./ros_package_install.sh

USER suchetan
RUN cd /home/suchetan && ./zsh.sh

#copy files, must be done before env_vars
COPY .zshrc .p10k.zsh .tmux.conf /home/suchetan/

USER root
RUN cd /home/suchetan && ./vscode_install.sh && ./env_vars.sh && ./read_write.sh