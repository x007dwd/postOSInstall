# postOSInstall
Ubuntu 崩溃之后，原来花了许多离去配置的环境和工具都没了，因此这里给出了一个script，当你装完系统之后，可以使用这个文件自动配置一下.

根目录下给出了2个sh文件，一个是设置86架构的Ubuntu，另外一个设置TK1的。这里假设TK1刷了jetpack之后的配置。
## 主要内容
- diver for tk1 ubuntu
- vim
- nautilus
- code packages
  - ros(catkin_ws setup， dji-onboard-ros， in tk1 solve the problen of compatiblility of opencvtegta and ros)
  - opencv for normal ubuntu
  - boost
  - cuda for normal x86/x64 ubuntu
  - Eigen3
  - g2o
  - sophus
  - caffe
