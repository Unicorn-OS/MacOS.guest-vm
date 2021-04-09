#!/bin/bash

OSK="ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VMDIR=$PWD
OVMF=$VMDIR/firmware
#export QEMU_AUDIO_DRV=pa
#QEMU_AUDIO_DRV=pa

qemu-system-x86_64 \
    -enable-kvm \
-m 12G \
    -machine q35,accel=kvm \
-smp cores=8,threads=2,sockets=1 \
    -cpu Penryn,vendor=GenuineIntel,kvm=on,+sse3,+sse4.2,+aes,+xsave,+avx,+xsaveopt,+xsavec,+xgetbv1,+avx2,+bmi2,+smep,+bmi1,+fma,+movbe,+invtsc \
    -device isa-applesmc,osk="$OSK" \
    -smbios type=2 \
    -drive if=pflash,format=raw,readonly,file="$OVMF/OVMF_CODE.fd" \
    -drive if=pflash,format=raw,file="$OVMF/OVMF_VARS-1024x768.fd" \
    -device ich9-intel-hda -device hda-output \
    -usb \
    -netdev user,id=net0 \
    -device e1000-82545em,netdev=net0,id=net0,mac=52:54:00:c9:18:27 \
    -device ich9-ahci,id=sata \
    -drive id=ESP,if=none,format=qcow2,file=ESP.qcow2 \
    -device ide-hd,bus=sata.2,drive=ESP \
    -drive id=SystemDisk,if=none,file=/home/me/.uni/cloud/macos/img/MacOS-catalina.qcow2 \
    -device ide-hd,bus=sata.4,drive=SystemDisk \
    -vga none \
    -device pcie-root-port,bus=pcie.0,multifunction=on,port=1,chassis=1,id=port.1 \
    -device vfio-pci,host=01:00.0,bus=port.1,multifunction=on \
    -device vfio-pci,host=01:00.1,bus=port.1 \
    -device vfio-pci,host=01:00.2,bus=port.1 \
    -device vfio-pci,host=01:00.3,bus=port.1 \
-vnc :1 \
-device usb-host,hostbus=1,hostport=8 \
-device usb-host,hostbus=1,hostport=6

#    -drive id=InstallMedia,format=raw,if=none,file=BaseSystem.img \
#    -device ide-hd,bus=sata.3,drive=InstallMedia \
