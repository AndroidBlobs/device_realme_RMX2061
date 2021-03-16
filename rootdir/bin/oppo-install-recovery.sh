#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:17f64e222fef883b8a632f4ea67fc8e0f637d428; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:fb86a9896f600f6a3404cd39e6a4285f676c26b5 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:17f64e222fef883b8a632f4ea67fc8e0f637d428 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
