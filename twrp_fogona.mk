$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
$(call inherit-product, vendor/twrp/config/common.mk)

$(call inherit-product, device/motorola/fogona/device.mk)

PRODUCT_DEVICE := fogona
PRODUCT_NAME := twrp_fogona
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g play - 2024
PRODUCT_MANUFACTURER := motorola

PRODUCT_SHIPPING_API_LEVEL := 33

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=fogona \
    PRODUCT_NAME=fogona

