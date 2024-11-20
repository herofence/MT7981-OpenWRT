#参数设置
echo '修改主机名'
sed -i "s/hostname='ImmortalWrt'/hostname='NX30PRO'/g" package/base-files/files/bin/config_generate
cat package/base-files/files/bin/config_generate |grep hostname=
echo '=========Alert hostname OK!========='

echo '修改默认IP'
sed -i 's/ipad=${ipaddr:-"192.168.1.1"}/ipad=${ipaddr:-"192.168.2.1"}/g' package/base-files/files/bin/config_generate
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
