#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from device FIRST (most specific)
$(call inherit-product, device/infinix/X6525/device.mk)

# Core Android components
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# A/B partitioning
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# LineageOS common
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Force super image generation
PRODUCT_BUILD_SUPER_PARTITION := true
OVERRIDE_TARGET_FLATTEN_APEX := true

# PRODUCT IDENTIFICATION
PRODUCT_DEVICE := X6525
PRODUCT_NAME := lineage_X6525
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix X6525
PRODUCT_MANUFACTURER := Infinix

# HARDWARE PLATFORM
TARGET_BOARD_PLATFORM := ums9230
TARGET_BOOTLOADER_BOARD_NAME := ums9230

# GMS CONFIGURATION
PRODUCT_GMS_CLIENTID_BASE := android-infinix

# BUILD FINGERPRINT
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="X6525-user 13 TP1A.220624.014 release-keys"

BUILD_FINGERPRINT := Infinix/X6525/X6525:13/TP1A.220624.014:user/release-keys