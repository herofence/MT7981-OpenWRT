#添加源
# lucky
git clone https://github.com/gdy666/luci-app-lucky.git package/lucky

#替换源
echo '替换jerrykuku的luci argon主题'
rm -rf feeds/luci/themes/luci-theme-argon
git clone -b master --single-branch https://github.com/jerrykuku/luci-theme-argon feeds/luci/themes/luci-theme-argon
echo '=========Replace luci theme argon OK!========='
echo '替换golang到1.22.x'
rm -rf feeds/packages/lang/golang
git clone -b 22.x --single-branch https://github.com/sbwml/packages_lang_golang feeds/packages/lang/golang
echo '=========Replace golang OK!========='

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
