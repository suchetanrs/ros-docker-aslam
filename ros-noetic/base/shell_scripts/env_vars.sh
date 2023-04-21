#ROOT
echo 'zsh' >> /root/.bashrc

echo 'export DISPLAY=:0.0' >> /root/.zshrc
echo 'export DISPLAY=:0.0' >> /root/.bashrc
echo 'export XDG_RUNTIME_DIR=/tmp/runtime-suchetan' >>/root/.zshrc
echo 'export XDG_RUNTIME_DIR=/tmp/runtime-suchetan' >>/root/.bashrc

echo "alias ranger='ranger --choosedir=/root/.rangerdir; LASTDIR=\`cat /root/.rangerdir\`; cd ""\$LASTDIR""'" >> /root/.zshrc
echo "alias ranger='ranger --choosedir=/root/.rangerdir; LASTDIR=\`cat /root/.rangerdir\`; cd ""\$LASTDIR""'" >> /root/.bashrc
echo "alias cdros='cd /home/suchetan/ros_ws/'" >> /root/.zshrc
echo "alias cdros='cd /home/suchetan/ros_ws/'" >> /root/.bashrc
#ROS!
echo "alias cdros='cd /home/suchetan/ros_ws/'" >> /home/suchetan/.zshrc
echo "alias cdros='cd /home/suchetan/ros_ws/'" >> /home/suchetan/.bashrc
echo 'source /opt/ros/noetic/setup.bash' >> /root/.bashrc
echo 'source /opt/ros/noetic/setup.zsh' >> /root/.zshrc
echo "export TURTLEBOT3_MODEL=waffle" >> /root/.bashrc
echo "export TURTLEBOT3_MODEL=waffle" >> /root/.zshrc



#SUCHETAN
echo 'zsh' >> /home/suchetan/.bashrc

echo 'export DISPLAY=:0.0' >> /home/suchetan/.zshrc
echo 'export DISPLAY=:0.0' >> /home/suchetan/.bashrc
echo 'export XDG_RUNTIME_DIR=/tmp/runtime-suchetan' >>/home/suchetan/.zshrc
echo 'export XDG_RUNTIME_DIR=/tmp/runtime-suchetan' >>/home/suchetan/.bashrc

echo "alias ranger='ranger --choosedir=/home/suchetan/.rangerdir; LASTDIR=\`cat /home/suchetan/.rangerdir\`; cd ""\$LASTDIR""'" >> /home/suchetan/.zshrc
echo "alias ranger='ranger --choosedir=/home/suchetan/.rangerdir; LASTDIR=\`cat /home/suchetan/.rangerdir\`; cd ""\$LASTDIR""'" >> /home/suchetan/.bashrc
echo "alias cdros='cd /home/suchetan/ros_ws/'" >> /home/suchetan/.zshrc
echo "alias cdros='cd /home/suchetan/ros_ws/'" >> /home/suchetan/.bashrc
#ROS!
echo 'source /home/suchetan/ros_ws/devel/setup.bash' >> /opt/ros/noetic/setup.bash
echo 'source /home/suchetan/ros_ws/devel/setup.zsh' >> /opt/ros/noetic/setup.zsh
echo 'source /opt/ros/noetic/setup.bash' >> /home/suchetan/.bashrc
echo 'source /opt/ros/noetic/setup.zsh' >> /home/suchetan/.zshrc
echo "export TURTLEBOT3_MODEL=waffle" >> /home/suchetan/.bashrc
echo "export TURTLEBOT3_MODEL=waffle" >> /home/suchetan/.zshrc
