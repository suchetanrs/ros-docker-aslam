cd /home/suchetan/
git clone --recurse-submodules https://github.com/EuropeanRoverChallenge/ERC-Remote-Navigation-Sim.git
cd /home/suchetan/ERC-Remote-Navigation-Sim
rosdep update
. /opt/ros/noetic/setup.sh
rosdep install -y -r -q --from-paths src --ignore-src --rosdistro noetic -y
. /opt/ros/noetic/setup.sh && catkin init && catkin build

echo 'source /home/suchetan/ERC-Remote-Navigation-Sim/devel/setup.bash --extend' >> /opt/ros/noetic/setup.bash
echo 'source /home/suchetan/ERC-Remote-Navigation-Sim/devel/setup.zsh --extend' >> /opt/ros/noetic/setup.zsh