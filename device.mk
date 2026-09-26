# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# ===========================
# CORE
# ===========================
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

PRODUCT_SHIPPING_API_LEVEL := 33
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    device/infinix/X6525

# ===========================
# KEYMASTER
# ===========================
PRODUCT_PACKAGES += lib_android_keymaster_keymint_utils

# ===========================
# BOOT / A/B
# ===========================
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

# ===========================
# HEALTH HAL
# ===========================
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health-service.example

# ===========================
# A/B UPDATE ENGINE
# ===========================
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier \
    checkpoint_gc \
    otapreopt_script

# ===========================
# FASTBOOTD / RECOVERY
# ===========================
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd \
    adbd.recovery

# ===========================
# PROPERTIES
# ===========================
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb

PRODUCT_OPTIONAL_USES_LIBRARIES += \
    org.apache.http.legacy \
    androidx.window.extensions \
    androidx.window.sidecar

PRODUCT_BROKEN_VERIFY_USES_LIBRARIES := true

# ===========================
# A/B POSTINSTALL
# ===========================
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

# ===========================
# VINTF
# ===========================
DEVICE_MANIFEST_FILE += device/infinix/X6525/manifest.xml
PRODUCT_ENFORCE_VINTF_MANIFEST := true

# ===========================
# VENDOR BLOBS
# Commented out for first build — recovery doesn't need them
# ===========================
# $(call inherit-product, vendor/infinix/X6525/X6525-vendor.mk)

# ===========================
# DTB
# ===========================
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/dtb.img:$(TARGET_COPY_OUT)/dtb.img

# ===========================
# PLATFORM
# ===========================
PRODUCT_PLATFORM := ums9230

# ===========================
# SELINUX PERMISSIVE
# ===========================
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
PRODUCT_PROPERTY_OVERRIDES += ro.boot.selinux=permissive