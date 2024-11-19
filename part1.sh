echo '添加Passwall依赖feeds'
sed -i '1 i src-git-full passwall https://github.com/xiaorouji/openwrt-passwall-packages;main' feeds.conf.default
echo '=========Add passwall feeds source OK!========='
