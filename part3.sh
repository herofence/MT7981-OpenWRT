#参数设置
echo '修改主机名'
sed -i "s/hostname='ImmortalWrt'/hostname='NX30PRO'/g" package/base-files/files/bin/config_generate
cat package/base-files/files/bin/config_generate |grep hostname=
echo '=========Alert hostname OK!========='

echo '修改默认IP'
sed -i 's/ipad=${ipaddr:-"192.168.1.1"}/ipad=${ipaddr:-"192.168.5.1"}/g' package/base-files/files/bin/config_generate
sed -i 's/addr_offset=2/addr_offset=6/g' package/base-files/files/bin/config_generate
sed -i 's/${ipaddr:-"192.168.$((addr_offset++)).1"}/${ipaddr:-"192.168.$((addr_offset++)).1"}/g' package/base-files/files/bin/config_generate
cat package/base-files/files/bin/config_generate |grep hostname=
echo '=========Alert Default IP OK!========='

echo '修改NTP服务器'
sed -i "s/time1.apple.com/ntp.aliyun.com/g" package/base-files/files/bin/config_generate
sed -i "s/time1.google.com/ntp.tencent.com/g" package/base-files/files/bin/config_generate
sed -i "s/time.cloudflare.com/time.ustc.edu.cn/g" package/base-files/files/bin/config_generate
sed -i "s/pool.ntp.org/cn.pool.ntp.org/g" package/base-files/files/bin/config_generate
echo '=========Alert NTP Server OK!========='

echo '修改闭源驱动2G wifi名称'
sed -i 's/ssid="ImmortalWrt-2.4G"/ssid="herofence-2.4G"/g' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i 's/ssid="OpenWRT-2.4G/ssid="herofence-2.4G/g' package/mtk/drivers/wifi-profile/files/common/mt7981/lib/wifi/mtk.sh
echo '=========Alert 2.4G wifi name OK!========='

echo '修改闭源驱动5G wifi名称'
sed -i 's/ssid="ImmortalWrt-5G"/ssid="herofence-5G"/g' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i 's/ssid="OpenWRT-5G/ssid="herofence-5G/g' package/mtk/drivers/wifi-profile/files/common/mt7981/lib/wifi/mtk.sh
echo '=========Alert 5G wifi name OK!========='
