# Overview


http://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-commands.html
http://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-part-two.html


# 如何在启动的时候，运行自定义的一个脚本？
在/etc/systemd/system 中新建一个文件(名称可以为 myscript.service) 然后在其中写入如下内容：
``` bash
[Unit]
Description=My script

[Service]
ExecStart=/usr/bin/my-script

[Install]
WantedBy=multi-user.target
```
然后开启该守护进程
```bash
systemctl enable myscript.service
```
本例是说当目标multi-usr载入的时候，会启动你这个自定义脚本。脚本需要有可执行权限。
