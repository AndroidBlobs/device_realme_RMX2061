#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:1bca290834eabded9d5a92b6afbbea650a114464; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:18041559b33c9ca3e065c82f6d879a34a5e0e489 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:1bca290834eabded9d5a92b6afbbea650a114464 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
