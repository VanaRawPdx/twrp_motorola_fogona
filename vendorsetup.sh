#!/bin/bash

# OrangeFox fox_12.1 build variables for the first, boot-focused bring-up.
export ALLOW_MISSING_DEPENDENCIES=true
export TARGET_ARCH=arm64

export FOX_AB_DEVICE=1
export FOX_VIRTUAL_AB_DEVICE=1
export OF_AB_DEVICE_WITH_RECOVERY_PARTITION=1

# This is a Motorola target, so do not enable Xiaomi/MIUI patching behavior.
export FOX_VANILLA_BUILD=1
export OF_NO_ADDITIONAL_MIUI_PROPS_CHECK=1

# Match the stock ramdisk compression and acknowledge the deliberately empty
# recovery kernel placeholder.
export OF_USE_LZ4_COMPRESSION=1
export OF_FORCE_PREBUILT_KERNEL=1

# Early builds must prove boot/display/touch/ADB/storage before touching data
# encryption or producing a self-flashing installer.
export OF_SKIP_FBE_DECRYPTION=1
export FOX_DISABLE_UPDATEZIP=1

# 720x1600 is 20:9; OrangeFox normalizes the width to 1080 (9 * 120).
export OF_SCREEN_H=2400
export OF_ALLOW_DISABLE_NAVBAR=0

export OF_MAINTAINER=Nick

