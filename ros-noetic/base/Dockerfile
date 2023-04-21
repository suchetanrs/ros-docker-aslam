#IMAGE NAME: ubuntu-ros-noetic:20.04

## This Dockerfile installs the following:
## [ros2-noetic,gazebo,ros2-nav2,turtlebot3,zsh,oh-my-zsh,powerlevel10k]
## The username is set to 'suchetan'

FROM ubuntu:20.04
RUN apt-get update && apt-get -y upgrade && apt update --fix-missing

#setup
ENV DEBIAN_FRONTEND="noninteractive" 

#create user
RUN apt-get install -y sudo && adduser --disabled-password --gecos '' suchetan && echo 'suchetan:u' | chpasswd && sudo usermod -a -G sudo suchetan

COPY ./shell_scripts/ros_install.sh ./shell_scripts/zsh.sh ./shell_scripts/vscode_install.sh ./shell_scripts/basic_util.sh /home/suchetan/
COPY ./shell_scripts/ros_install.sh ./shell_scripts/zsh.sh ./shell_scripts/vscode_install.sh ./shell_scripts/basic_util.sh /root/
RUN cd /home/suchetan/ && chmod +x * && cd /root/ && chmod +x * && ./basic_util.sh && ./ros_install.sh && ./zsh.sh && ./vscode_install.sh

USER suchetan
RUN cd /home/suchetan/ && ./zsh.sh

# #copy files, must be done before env_vars
COPY .zshrc .p10k.zsh .tmux.conf /root/
COPY .zshrc .p10k.zsh .tmux.conf /home/suchetan/

USER root
COPY ./shell_scripts/env_vars.sh ./shell_scripts/ros_package_install.sh /home/suchetan/
RUN cd /home/suchetan && chmod +x * && ./env_vars.sh && ./ros_package_install.sh