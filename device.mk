LOCAL_PATH := device/motorola/fogona

PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \
    android.hardware.health-service.qti_recovery \
    bootctrl.bengal \
    fastbootd \
    fsck.f2fs \
    libgptutils \
    liblp \
    make_f2fs \
    sload_f2fs \
    update_engine_sideload

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/system/etc/recovery.fstab:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/recovery.fstab \
    $(LOCAL_PATH)/recovery/root/init.recovery.qcom.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.qcom.rc \
    $(LOCAL_PATH)/recovery/root/android.hardware.health-service.qti_recovery.rc:$(TARGET_COPY_OUT_RECOVERY)/root/android.hardware.health-service.qti_recovery.rc \
    $(LOCAL_PATH)/recovery/root/servicemanager.recovery.rc:$(TARGET_COPY_OUT_RECOVERY)/root/servicemanager.recovery.rc
