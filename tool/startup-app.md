## How-To Operating Systems Linux Distributions Ubuntu Charter

User-defined tasks can be done by executing a script at startup and shutdown for Linux. To execute script at startup of Ubuntu, the rc.local can be modified to include additional commands. To execute script when rebooting Ubuntu, the script has to be copied to the relevant directory. Once the permissions of the script have been changed to executable, it will run when rebooting the Linux operating system. Scripts are run in the alphabetical order in the directories and the scripts should be named following the nomenclature rules when executing a script at startup and shutdown with all distributions of Linux.
- To execute a script at startup of Ubuntu
- To execute a script upon rebooting Ubuntu
- To execute a script at shutdown

### To execute a script at startup of Ubuntu

Edit /etc/rc.local and add your commands
The script must always end with exit 0

### To execute a script upon rebooting Ubuntu

Put your script in /etc/rc0.d
Make it executable (sudo chmod +x myscript)
Note: The scripts in this directory are executed in alphabetical order

The name of your script must begin with K99 to run at the right time.
### To execute a script at shutdown

Put your script in /etc/rc6.d
Make it executable (sudo chmod +x myscript)
Note: The scripts in this directory are executed in alphabetical order

The name of your script must begin with K99 to run at the right time.
### dash
## 设置shaodowsocks 开启启动
在dash（直接按Windows徽标键）中输入“启动应用程序”，然后点击进入如下界面
![](assets/startup-app-33380.png)
选择新建 命令中 填写如下

![](assets/startup-app-009ce.png)

名称随意填写，指令要是ss-qt5 然后保存即可。


## wechat 添加如dash菜单
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
其中Exec=后边的内容需要改为自己的可执行程序所在的目录
Icon也是相应的图标所在的目录
然后保存，文件的图标会标称所选的Icon对应的图像
然后执行命令
```
sudo cp wechat.desktop /usr/share/applications/
```
然后dash菜单中搜索wechat就会出现该程序。

## dropbox 开机启动
![](assets/startup-app-ec2dd.png)
