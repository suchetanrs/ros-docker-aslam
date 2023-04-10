echo 'zsh' >> /home/suchetan/.bashrc

echo 'export DISPLAY=:0.0' >> /home/suchetan/.zshrc
echo 'export DISPLAY=:0.0' >> /home/suchetan/.bashrc
echo 'export XDG_RUNTIME_DIR=/tmp/runtime-suchetan' >>/home/suchetan/.zshrc
echo 'export XDG_RUNTIME_DIR=/tmp/runtime-suchetan' >>/home/suchetan/.bashrc

cd "/tmp"
mkdir runtime-suchetan
chmod a+rw runtime-suchetan
cd "/home/suchetan"

echo "alias ranger='ranger --choosedir=/home/suchetan/.rangerdir; LASTDIR=\`cat /home/suchetan/.rangerdir\`; cd ""\$LASTDIR""'" >> /home/suchetan/.zshrc
echo "alias ranger='ranger --choosedir=/home/suchetan/.rangerdir; LASTDIR=\`cat /home/suchetan/.rangerdir\`; cd ""\$LASTDIR""'" >> /home/suchetan/.bashrc

#ROS!

echo 'source /home/suchetan/ros_ws/devel/setup.bash' >> /opt/ros/noetic/setup.bash
echo 'source /home/suchetan/ros_ws/devel/setup.zsh' >> /opt/ros/noetic/setup.zsh
echo 'source /opt/ros/noetic/setup.bash' >> /home/suchetan/.bashrc
echo 'source /opt/ros/noetic/setup.zsh' >> /home/suchetan/.zshrc


echo "export TURTLEBOT3_MODEL=waffle" >> /home/suchetan/.bashrc
echo "export TURTLEBOT3_MODEL=waffle" >> /home/suchetan/.zshrc