# linux中一些常用指令
## 查看系统状态
### linux系统下，查看cpu、内存、硬盘大小
查看cpu的方法

1、 cat /proc/cpuinfo  或者 更直观的查看cpu的型号命令：

```
cat /proc/cpuinfo
```

```
dmesg |grep -i xeon
```
或者
```
lscpu
```

查看内存的方法
2、 cat /proc/meminfo  或者 更直观的查看内存的命令：

```
cat /proc/meminfo  
```

```
free -m
```

查看硬盘大小

3、df -h

```
df -h
```

最后用top命令也可以查看到cpu和内存的使用率 在输入top命令之后直接按"1" 就能很清楚的查看到cpu和内存的使用情况。

## apt 软件管理
### 简介
apt-cache search # ------(package 搜索包)
apt-cache show #------(package 获取包的相关信息，如说明、大小、版本等)
sudo apt-get install # ------(package 安装包)
sudo apt-get install # -----(package - - reinstall 重新安装包)
sudo apt-get -f install # -----(强制安装?#"-f = --fix-missing"当是修复安装吧...)
sudo apt-get remove #-----(package 删除包)
sudo apt-get remove - - purge # ------(package 删除包，包括删除配置文件等)
sudo apt-get autoremove --purge # ----(package 删除包及其依赖的软件包+配置文件等（只对6.10有效，强烈推荐）)
sudo apt-get update #------更新源
sudo apt-get upgrade #------更新已安装的包
sudo apt-get dist-upgrade # ---------升级系统
sudo apt-get dselect-upgrade #------使用 dselect 升级
apt-cache depends #-------(package 了解使用依赖)
apt-cache rdepends # ------(package 了解某个具体的依赖?#当是查看该包被哪些包依赖吧...)
sudo apt-get build-dep # ------(package 安装相关的编译环境)
apt-get source #------(package 下载该包的源代码)
sudo apt-get clean && sudo apt-get autoclean # --------清理下载文件的存档 && 只清理过时的包
sudo apt-get check #-------检查是否有损坏的依赖

### 一些命令详述
- apt-get install
下载 以及所有倚赖的包裹，同时进行包裹的安装或升级。如果某个包裹被设置了 hold (停止标志，就会被搁在一边(即不会被升级)。更多 hold 细节请看下面。

- apt-get remove [--purge]
移除 以及任何倚赖这个包裹的其它包裹。
--purge 指明这个包裹应该被完全清除 (purged) ，更多信息请看 dpkg -P。

- apt-get update
升级来自 Debian 镜像的包裹列表，如果你想安装当天的任何软件，至少每天运行一次，而且每次修改了
/etc/apt/sources.list 后，必须执行。

- apt-get upgrade [-u]
升级所以已经安装的包裹为最新可用版本。不会安装新的或移除老的包裹。如果一个包改变了倚赖关系而需要安装一个新的包裹，那么它将不会被升级，而是标志为 hold。apt-get update 不会升级被标志为 hold 的包裹 (这个也就是 hold 的意思)。请看下文如何手动设置包裹为 hold。我建议同时使用 '-u' 选项，因为这样你就能看到哪些包裹将会被升级。

- apt-get dist-upgrade [-u]
和 apt-get upgrade 类似，除了 dist-upgrade 会安装和移除包裹来满足倚赖关系。因此具有一定的危险性。

- apt-cache search
搜索满足 的包裹和描述。

- apt-cache show
显示 的完整的描述。

- apt-cache showpkg
显示 许多细节，以及和其它包裹的关系。

#### 使用 dpkg(debian and ubuntu)
- dpkg -i
安装一个 Debian 包裹文件，如你手动下载的文件。

- dpkg -c
列出 的内容。

- dpkg -I
从 中提取包裹信息。

- dpkg -r
移除一个已安装的包裹。

- dpkg -P
完全清除一个已安装的包裹。和 remove 不同的是，remove 只是删掉数据和可执行文件，purge 另外还删除所有的配制文件。

- dpkg -L
列出 安装的所有文件清单。同时请看 dpkg -c 来检查一个 .deb 文件的内容。

- dpkg -s
显示已安装包裹的信息。同时请看 apt-cache 显示 Debian 存档中的包裹信息，以及 dpkg -I 来显示从一个 .deb 文件中提取的包裹信息。

- dpkg-reconfigure
重新配制一个已经安装的包裹，如果它使用的是 debconf (debconf 为包裹安装提供了一个统一的配制界面)。你能够重新配制 debconf 它本身，如你想改变它的前端或提问的优先权。例如，重新配制 debconf，使用一个 dialog 前端，简单运行：

- dpkg-reconfigure --frontend=dialog debconf (如果你安装时选错了，这里可以改回来哟：)

- echo " hold" | dpkg --set-selections
设置 的状态为 hlod (命令行方式)

- dpkg --get-selections ""
取的 的当前状态 (命令行方式)

支持通配符，如：
Debian:~# dpkg --get-selections *wine*


### remote access 以及 进程管理等

1.检查远程端口是否对bash开放：
```
echo >/dev/tcp/8.8.8.8/53 && echo "open"
```

2.让进程转入后台：

```
Ctrl + z
```

3.将进程转到前台：

```
fg
```

4.产生随机的十六进制数，其中n是字符数：
```
openssl rand -hex n
```

5.在当前shell里执行一个文件里的命令：
```
source /home/user/file.name
```

6.截取前5个字符：
```
${variable:0:5}
```

7.SSH debug 模式:
```
ssh -vvv user@ip_address
```

8.SSH with pem key:
```
ssh user@ip_address -i key.pem
```

9.用wget抓取完整的网站目录结构，存放到本地目录中：
```
wget -r --no-parent --reject "index.html*" http://hostname/ -P /home/user/dirs
```

10.一次创建多个目录：
```
mkdir -p /home/user/{test,test1,test2}
```

11.列出包括子进程的进程树：
```
ps axwef
```

12.创建 war 文件:
```
jar -cvf name.war file
```

13.测试硬盘写入速度：
```
dd if=/dev/zero of=/tmp/output.img bs=8k count=256k; rm -rf /tmp/output.img
```

14.测试硬盘读取速度：
```
hdparm -Tt /dev/sda
```

15.获取文本的md5 hash：
```
echo -n "text" | md5sum
```
16.检查xml格式：
```
xmllint --noout file.xml
```
17.将tar.gz提取到新目录里：
```
tar zxvf package.tar.gz -C new_dir
```
18.使用curl获取HTTP头信息：
```
curl -I http://www.example.com
```
19.修改文件或目录的时间戳(YYMMDDhhmm):
```
touch -t 0712250000 file
```

20.用wget命令执行ftp下载：
```
wget -m ftp://username:password@hostname
```

21.生成随机密码(例子里是16个字符长):
```
LANG=c < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-16};echo;
```

22.快速备份一个文件：
```
cp some_file_name{,.bkp}
```

23.访问Windows共享目录：
```
smbclient -U "DOMAIN\user" //dc.domain.com/share/test/dir
```

24.执行历史记录里的命令(这里是第100行):
```
!100
```

25.解压:
```
unzip package_name.zip -d dir_name
```

26.输入多行文字(CTRL + d 退出):
```
cat > test.txt
```

27.创建空文件或清空一个现有文件：
```
\> test.txt
```

28.与Ubuntu NTP server同步时间：
```
ntpdate ntp.ubuntu.com
```

29.用netstat显示所有tcp4监听端口：
```
netstat -lnt4 | awk '{print $4}' | cut -f2 -d: | grep -o '[0-9]*'
```

30.qcow2镜像文件转换：
```
qemu-img convert -f qcow2 -O raw precise-server-cloudimg-amd64-disk1.img \precise-server-cloudimg-amd64-disk1.raw
```

31.重复运行文件，显示其输出（缺省是2秒一次）：
```
watch ps -ef
```

32.所有用户列表：
```
getent passwd
```

33.Mount root in read/write mode:
```
mount -o remount,rw /
```
34.挂载一个目录（这是不能使用链接的情况）:
```
mount --bind /source /destination
```
35.动态更新DNS server:
```nsupdate < <EOF
update add $HOST 86400 A $IP
send
EOF
```

36.递归grep所有目录：
```
grep -r "some_text" /path/to/dir
```
37.列出前10个最大的文件：
```
lsof / | awk '{ if($7 > 1048576) print $7/1048576 "MB "$9 }' | sort -n -u | tail
```

38.显示剩余内存(MB):
```
free -m | grep cache | awk '/[0-9]/{ print $4" MB" }'
```

39.打开Vim并跳到文件末：
```
vim + some_file_name
```

40.Git 克隆指定分支(master):
```
git clone git@github.com:name/app.git -b master
```

41.Git 切换到其它分支(develop):
```
git checkout develop
```

42.Git 删除分支(myfeature):
```
git branch -d myfeature
```
43.Git 删除远程分支
```
git push origin :branchName
```
44.Git 将新分支推送到远程服务器：
```
git push -u origin mynewfeature
```
45.打印历史记录中最后一次cat命令：
```
!cat:p
```
46.运行历史记录里最后一次cat命令：
```
!cat
```
47.找出/home/user下所有空子目录:
```
find /home/user -maxdepth 1 -type d -empty
```
48.获取test.txt文件中第50-60行内容：
```
< test.txt sed -n '50,60p'
```
49.运行最后一个命令(如果最后一个命令是mkdir /root/test, 下面将会运行: sudo mkdir /root/test)：

``
`sudo !!```
50.创建临时RAM文件系统 – ramdisk (先创建/tmpram目录):
```
mount -t tmpfs tmpfs /tmpram -o size=512m
```

51.Grep whole words:
```
grep -w "name" test.txt
```
52.在需要提升权限的情况下往一个文件里追加文本：
```
echo "some text" | sudo tee -a /path/file
```
53.列出所有kill signal参数:
```
kill -l
```
54.在bash历史记录里禁止记录最后一次会话：
```
kill -9 $$
```
55.扫描网络寻找开放的端口：
``nmap -p 8081 172.20.0.0/16
``
56.设置git email:
```
git config --global user.email "me@example.com"
```
57.To sync with master if you have unpublished commits:
```
git pull --rebase origin master
```
58.将所有文件名中含有”txt”的文件移入/home/user目录:
```
fi
nd -iname "*txt*" -exec mv -v {} /home/user \;
```
59.将文件按行并列显示：
```
paste test.txt test1.txt
```
60.shell里的进度条:

```
pv data.log
```
61.使用netcat将数据发送到Graphite server:
```
echo "hosts.sampleHost 10 `date +%s`" | nc 192.168.200.2 3000
```
62.将tabs转换成空格：

```
expand test.txt > test1.txt
```
63.Skip bash history:

```
< space >cmd
```
64.去之前的工作目录：

```
cd -
```
65.拆分大体积的tar.gz文件(每个100MB)，然后合并回去：

```split –b 100m /path/to/large/archive /path/to/output/files
cat
 files* > archive
```
66.使用curl获取HTTP status code:

```
curl -sL -w "%{http_code}\\n" www.example.com -o /dev/null
```
67.设置root密码，强化MySQL安全安装:

```
/usr/bin/mysql_secure_installation
```
68.当Ctrl + c不好使时:

```
Ctrl + \
```
69.获取文件owner:
```
st
at -c %U file.txt
```

70.block设备列表：
```
ls
blk -f
```

71.找出文件名结尾有空格的文件：

```fi
nd . -type f -exec egrep -l " +$" {} \;
```
72.找出文件名有tab缩进符的文件

```fi
nd . -type f -exec egrep -l $'\t' {} \;
```
73.用”=”打印出横线:全选复制放进笔记

```
printf '%100s\n' | tr ' ' =
```
