## config vim
sh <(curl https://j.mp/spf13-vim3 -L)

## config ssh
sudo apt-get install openssh-server

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

## install dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd
## install shadowsocks
sudo add-apt-repository ppa:hzwhuang/ss-qt5
sudo apt-get update
sudo apt-get install shadowsocks-qt5

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

## config cuda
sudo dpkg -i cuda-repo-ubuntu1404-8-0-local_8.0.44-1_amd64.deb
sudo apt-get update
sudo apt-get install cuda
echo "export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}" >> ~/.bashrc
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
