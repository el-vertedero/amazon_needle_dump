#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/recovery:10659840:87fc1ec37910a4da49855d3a2b2262b56a598774; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/boot:9508864:5d27e534aaa81133ea7d6c6fef08d2637c3d3402 EMMC:/dev/block/recovery f7dad464bb0696f0dfed04d92d0a8a739d991c6d 10657792 5d27e534aaa81133ea7d6c6fef08d2637c3d3402:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/recovery bs=1 seek=10657792 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
