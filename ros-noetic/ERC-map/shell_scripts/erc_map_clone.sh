cd /home/suchetan/
echo u | sudo -S git clone --recurse-submodules https://github.com/EuropeanRoverChallenge/ERC-Remote-Navigation-Sim.git
cd /home/suchetan/ERC-Remote-Navigation-Sim
echo u | rosdep update
. /opt/ros/noetic/setup.sh
echo u | sudo -S rosdep install -y -r -q --from-paths src --ignore-src --rosdistro noetic -y
echo u | sudo -S chmod -R a+rw *
echo u | sudo -S chmod -R a+rw .*
. /opt/ros/noetic/setup.sh && catkin init && catkin build