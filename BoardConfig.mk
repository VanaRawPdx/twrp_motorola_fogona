DEVICE_PATH := device/motorola/fogona

# Architecture: SM6225/Khaje in Qualcomm's bengal platform family.
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_USES_64_BIT_BINDER := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

TARGET_BOARD_PLATFORM := bengal
TARGET_BOOTLOADER_BOARD_NAME := fogona

# Stock boot/recovery images are Android boot header v4. Header v4 fixes boot
# image alignment at 4096, so legacy base/offset/cmdline values do not belong
# here. The real vendor cmdline, DTBs, bootconfig, and modules remain in the
# stock vendor_boot partition.
BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_RAMDISK_USE_LZ4 := true

# A dedicated recovery partition exists on both slots. Its stock image is a
# kernel-less header-v4 ramdisk; the kernel is supplied by boot and the
# platform ramdisk/DTB/modules by vendor_boot.
TARGET_NO_RECOVERY := false
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_FORCE_PREBUILT_KERNEL := true
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := false

# Physical sizes from the Motorola GPT (4096-byte logical blocks).
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE := 8388608
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600
BOARD_VBMETAIMAGE_PARTITION_SIZE := 65536

# Generate the same kind of unsigned per-partition hash footer used by stock.
# This does not recreate Motorola's signed top-level vbmeta descriptor.
BOARD_AVB_ENABLE := true
BOARD_AVB_RECOVERY_ALGORITHM := NONE
BOARD_AVB_RECOVERY_ADD_HASH_FOOTER_ARGS += --hash_algorithm sha256

# Dynamic partition geometry from slot-0 liblp metadata in super.
BOARD_SUPER_PARTITION_SIZE := 6710886400
BOARD_SUPER_PARTITION_GROUPS := mot_dp_group
BOARD_MOT_DP_GROUP_SIZE := 6706692096
BOARD_MOT_DP_GROUP_PARTITION_LIST := \
    system \
    system_ext \
    product \
    vendor \
    system_dlkm \
    vendor_dlkm

BOARD_USES_METADATA_PARTITION := true
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EROFS := true
TW_INCLUDE_EROFS := true

BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    init_boot \
    recovery \
    system_dlkm \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_boot \
    vendor_dlkm

# Recovery UI. Panel DTBOs describe 720x1600 variants; 255 is the safe common
# brightness ceiling because one supported panel uses 0xff while others use
# 0x665. The runtime sysfs path still needs confirmation on hardware.
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_DENSITY := 280
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := /sys/class/backlight/panel0-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 150
TW_SCREEN_BLANK_ON_BOOT := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_FASTBOOTD := true
TW_INCLUDE_LPDUMP := true
TW_INCLUDE_REPACKTOOLS := true
TW_EXCLUDE_SUPERSU := true

# Keep crypto code available, but the initial OrangeFox build deliberately
# skips decryption via vendorsetup.sh until the current ROM's /data encryption
# policy and required KeyMint/TEE blobs are proven.
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_CRYPTO_METADATA := true

TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# The boot/recovery/vendor side of this Motorola Android 14 release is still
# built against Android 13 / API 33 and advertises the July 2026 patch level.
PLATFORM_VERSION := 13
PLATFORM_VERSION_LAST_STABLE := 13
PLATFORM_SECURITY_PATCH := 2026-07-01
