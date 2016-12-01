## 设置shaodowsocks 开机启动
在dash（直接按Windows徽标键）中输入“启动应用程序”，然后点击进入如下界面

![](assets/startup-app-33380.png)

点击添加按键填写如下

![](assets/startup-app-009ce.png)

名称随意填写，指令是ss-qt5 然后保存即可。


## wechat 添加入dash菜单
新建一个文件 命名为wechat.desktop， 打开文件 写入如下
```
[Desktop Entry]
Encoding=UTF-8
Exec=/home/bobin/Downloads/soft/wechat/electronic-wechat-linux-x64/electronic-wechat
Icon=/home/bobin/Downloads/soft/wechat/electronic-wechat-linux-x64/resources/images.jpg
Type=Application
Terminal=false
Comment=wechat
Name=wechat
GenericName=wechat
StartupNotify=false
Categories=wechat
```
其中Exec=后边的内容需要改为自己的可执行程序所在的目录，Icon也是相应的图标所在的目录（如果没有的话可以网上down一个，格式jpg就行），然后保存，文件的图标会标称所选的Icon对应的图像，然后执行命令
```
sudo cp wechat.desktop /usr/share/applications/
```
然后dash菜单中搜索wechat就会出现该程序。

## dropbox 开机启动
![](assets/startup-app-ec2dd.png)
