http://www.viseator.com/2017/07/02/arch_more/
http://www.viseator.com/2017/05/19/arch_setup/
http://www.viseator.com/2017/05/17/arch_install/
[Usage of AUR](   )

1. timedatectl set-ntp true
2. mkfs.ext4 /dev/
3. mount /dev /
4. vim /etc/pacman.d/pacman.conf # add



安装Gnome后无法打开terminal 是因为 /etc/local.conf 没有配置好。

# Software
  + Enable ssh
    ``` bash
    sudo pacman -S openssh
    systemctl enable sshd
    ```

# To do
+ Backup in LVM

---------
20170923
问题：
+ 用U盘安装，无法启动到cli。换了一个U盘后就好了
+
fdisk /dev/sda

分区表可能不会更新，需要重启。


can not find
lvm vgchange -a y
sudo pacman -S gonme all

-----
20171223
refind-install --usedefault /dev/sdXY --alldrivers

# References
[LVM setting]https://wiki.archlinux.org/index.php/LVM#Installing_Arch_Linux_on_LVM)

https://askubuntu.com/questions/26886/fixing-unbootable-installation-on-lvm-root-from-desktop-livecd

https://unix.stackexchange.com/questions/105389/arch-grub-asking-for-run-lvm-lvmetad-socket-on-a-non-lvm-disk

https://wiki.archlinux.org/index.php/REFInd


---
20180401
卡死在
``` bash
[] A start job is running for Hold until boot process finishers up(22s/no limit)
```
Solve:
``` bash
sudo pacman -R plymouth
```

----
20180402
Set VNC Server, just edit ~/.vnc/xstartup as following:
``` bash
#!/bin/sh
export XKL_XMODMAP_DISABLE=1
exec i3

```


----
20180408
solve the problem: lvm partions cannot by mount auto
``` bash
# /etc/mkinitcpio.conf
#HOOKS="base udev autodetect modconf block sd-lvm2 filesystems keyboard fsck"
HOOKS="base udev autodetect modconf block lvm2 filesystems keyboard fsck"
# sd-lvm2--> lvm2
``` bash


----
20180414
``` bash
# pacman -S $(pacman -Qq --dbpath /newarch/var/lib/pacman) --root /newarch --dbpath /newarch/var/lib/pacman
```
https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#Recovering_a_USB_key_from_existing_install
https://unix.stackexchange.com/questions/355689/manjaro-fails-to-boot-modules-devname-not-found-then-unknown-disk-uuid-error
https://www.soimort.org/notes/170407/

When many modules can't be found during mkinitcpio.
So I copy all files and folder in /lib/modules/ of another arch to
broken arch.
Then work!

-------
20180520
Q: Screen, keyboard and mouse are freezd after install nvidia driver
instead of noveaou. I try many method about nvidia driver in Internet,
but no one work.
A: It maybe the problem of Xorg during start. So I remove gdm and 
start gnome-session by xinit. Then so far so well. :)
``` bash
sudo pacman -R gdm
vim .xinitrc
exec gnome-session

```

---------
20180521
Q: During update, system lost power. Then,
``` bash
[root@surface hf]# pacman -S --force linux
resolving dependencies...
looking for conflicting packages...
warning: could not fully load metadata for package linux-4.15.15-1
error: failed to prepare transaction (invalid or corrupted package)
```
A: I install the linux-lts, and find the files on /var/lib/pacman/local/linux../
Then I copy these files to linux folder from linx-lts folder.
https://bbs.archlinux.org/viewtopic.php?id=230357

--------
20180528
Q: startx don't work, the log show err "[   520.688] xf86EnableIOPorts: failed to set IOPL for I/O (Operation not permitted)"
A:
