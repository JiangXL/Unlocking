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
refind-install --usedefault /dev/sdXY --alldriver

# References
[LVM setting]https://wiki.archlinux.org/index.php/LVM#Installing_Arch_Linux_on_LVM)

https://askubuntu.com/questions/26886/fixing-unbootable-installation-on-lvm-root-from-desktop-livecd

https://unix.stackexchange.com/questions/105389/arch-grub-asking-for-run-lvm-lvmetad-socket-on-a-non-lvm-disk

https://wiki.archlinux.org/index.php/REFInd
