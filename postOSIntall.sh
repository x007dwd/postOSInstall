sudo ./flash.sh -S 14580MiB jetson-tk1 mmcblk0p1
sudo apt-mark hold xserver-xorg-core

## config bash-completion
sudo apt-get install bash-completion command-not-found
sudo apt-file update &>/dev/null
sudo update-command-not-found &>/dev/null


## install some drivers
cd /tmp/
mkdir GrinchKernel
cd GrinchKernel
## Download Grinch Kernel

wget http://www.jarzebski.pl/files/jetsontk1/grinch-21.3.4/zImage
wget http://www.jarzebski.pl/files/jetsontk1/grinch-21.3.4/jetson-tk1-grinch-21.3.4-modules.tar.bz2
wget http://www.jarzebski.pl/files/jetsontk1/grinch-21.3.4/jetson-tk1-grinch-21.3.4-firmware.tar.bz2
### Update kernel

sudo tar -C /lib/modules -vxjf jetson-tk1-grinch-21.3.4-modules.tar.bz2
sudo tar -C /lib -vxjf jetson-tk1-grinch-21.3.4-firmware.tar.bz2
sudo cp zImage /boot/zImage


## config timezone and update time
sudo dpkg-reconfigure tzdata
sudo service ntp stop
sudo ntpdate pool.ntp.org
sudo service ntp start

## config vim
## sh <(curl https://j.mp/spf13-vim3 -L)

## config ssh
## sudo apt-get install openssh-server

## install chrome
cd /tmp/
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb; sudo apt-get -f install

## config git
sudo apt-get install git

## config hosts
git clone https://github.com/lennylxx/ipv6-hosts.git
sudo cat ipv6-hosts/hosts >> /etc/hosts

## config nautilus
sudo apt-get install nautilus-open-terminal
nautilus -q

## install build system for c/cpp
sudo apt-get install build-essential cmake cmake-curses-gui


## install some cpp package
sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
sudo apt-get install --no-install-recommends libboost-all-dev   libatlas-base-dev
sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev

## install ros
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 0xB01FA116
sudo apt-get update
sudo apt-get install ros-indigo-desktop-full
sudo rosdep init
rosdep update

echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo apt-get install python-rosinstall

cd ~
mkdir -p catkin_ws/src
catkin_init_workspace
## get DJI OnBoard sdk ros
git clone https://github.com/dji-sdk/Onboard-SDK-ROS.git
cd ..
catkin_make

## config ros compatible with opencvtegta
sudo cp /opt/ros/indigo/lib/pkgconfig/cv_bridge.pc /opt/ros/indigo/lib/pkgconfig/cv_bridge.pc-bak
sudo cp /opt/ros/indigo/lib/pkgconfig/image_geometry.pc  /opt/ros/indigo/lib/pkgconfig/image_geometry.pc-bak
sudo cp /opt/ros/indigo/share/cv_bridge/cmake/cv_bridgeConfig.cmake  /opt/ros/indigo/share/cv_bridge/cmake/cv_bridgeConfig.cmake-bak
sudo cp /opt/ros/indigo/share/image_geometry/cmake/image_geometryConfig.cmake /opt/ros/indigo/share/image_geometry/cmake/ image_geometryConfig.cmake-bak

## these files are in foleder of ros-opencvtegra
sudo cp ros-opencvtegra/cv_bridge.pc /opt/ros/indigo/lib/pkgconfig/cv_bridge.pc
sudo cp ros-opencvtegra/image_geometry.pc /opt/ros/indigo/lib/pkgconfig/image_geometry.pc
sudo cp ros-opencvtegra/cv_bridgeConfig.cmake /opt/ros/indigo/share/cv_bridge/cmake/cv_bridgeConfig.cmake
sudo cp ros-opencvtegra/image_geometryConfig.cmake /opt/ros/indigo/share/image_geometry/cmake/image_geometryConfig.cmake


## config Eigen and sophus, g2o
sudo apt-get install libeigen3-dev

cd ~/Documents/
mkdir libraries
cd linraries
git clone https://github.com/strasdat/Sophus.git
cd Sophus
mkdir build
cd build
cmake ..
make

cd ../../
git clone https://github.com/RainerKuemmerle/g2o.git
cd g2o
sudo apt-get install libeigen3-dev libsuitesparse-dev libqt4-dev qt4-qmake libqglviewer-dev
mkdir build
cd build
cmake ../
make

## config caffe
sudo apt-get install python-pip
cd ~/Documents/
mkdir -p /dnn/
cd dnn
git clone https://github.com/BVLC/caffe.git
cd caffe/python
for req in $(cat requirements.txt); do sudo pip install $req; done
cd ..
cp Makefile.config.example Makefile.config
# Adjust Makefile.config (for example, if using Anaconda Python, or if cuDNN is desired)
make all
make test
make runtest
make pycaffe
echo "export PYTHONPATH=~/Documents/dnn//caffe/python:$PYTHONPATH" >> ~/.bashrc
