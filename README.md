router.db 格式
name:ip:model:username:password:group:enable
group默认存储配置目录为configs，如果你定义了新的group名称，那么你需要在
/home/roc/.config/oxidized/下创建新的文件夹
例如：
yx-c4948-01:172.20.1.75:ios:Bryn01:xp199512:ios
我定义了该设备group为ios的组，那么我需要创建ios文件夹来存储该设备的配置
roc@oxidized:~/.config/oxidized$ mkdir ios  



设备巡检脚本存储目录（Ubuntu）：
cd /var/lib/gems/3.2.0/gems/oxidized-0.30.1/lib/oxidized/model/

按照设备对应的系统进行修改，列如：
Cisco Catalyst系列使用的“IOS”系统
Cisco WAN 系列使用的是“IOS XE"系统
Cisco ASR、Cisco NCS系列使用的是"IOS XR"系统
Cisco Nexus系列使用的是"NXOS"系统

在修改完配置以后，一定要对进行进行重启
sudo vim config  修改文件
sudo systemctl restart oxidized.service 重启进程
sudo systemctl status oxidized.service  查看进程
sudo systemctl start oxidized.service  启动进程

3、修改脚本内容
只需要复制粘贴，然后修改对应的命令
  cmd 'show running-config' do |cfg|
    cfg = cfg.each_line.to_a[1..-1].join
    cfg
  end

4、oxidized 安装目录为：
/home/roc/.config/oxidized/  或者是 cd .config/oxidized/  进入到文件目录下

tree /home/oxidized/.config/  文件目录结构
/home/oxidized/.config/
└── oxidized
├── config
├── configs
├── crash
├── logs
├── oxidized.git
└── router.db

