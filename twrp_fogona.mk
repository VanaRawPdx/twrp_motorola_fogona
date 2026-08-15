#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from AOSP / TWRP generic configurations
$(call inherit-product,$(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product,$(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
$(call inherit-product,$(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit TWRP extra build features
$(call inherit-product, vendor/twrp/config/common.mk)

# Device identifier
PRODUCT_DEVICE := fogona
PRODUCT_NAME := twrp_fogona
PRODUCT_BRAND := Motorola
PRODUCT_MODEL := Moto G Play 2024
PRODUCT_MANUFACTURER := Motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=fogona \
    PRODUCT_NAME=fogona
