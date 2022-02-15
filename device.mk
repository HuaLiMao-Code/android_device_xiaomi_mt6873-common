#
# Copyright (C) 2022 The PixelExperience Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Interfaces
include $(LOCAL_PATH)/vendor_prop.mk
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Boot animation
TARGET_BOOT_ANIMATION_RES := 1080

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 29

# VNDK
PRODUCT_EXTRA_VNDK_VERSIONS := 29 30

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# Overlay
PRODUCT_PACKAGES := \
    FrameworkResOverlay \
    TelephonyOverlay \
    SystemUIOverlay \
    SettingsOverlay \
    TelephonyOverlay \
    TetheringConfigOverlay \
    WifiResCommon

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio.common@6.0-util \
    android.hardware.audio.service \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.soundtrigger@2.3-impl \
    android.hardware.bluetooth.audio@2.1-impl \
    android.hardware.audio.effect@5.0-impl \
    android.hardware.soundtrigger@2.2-impl \
    android.hardware.bluetooth.audio@2.0-impl \
    audio.a2dp.default \
    audio.bluetooth.default \
    audio.r_submix.default \
    audio.usb.default \
    audio_policy.stub \
    libaudiopreprocessing \
    libbundlewrapper \
    libdownmix \
    libdynproc \
    libeffectproxy \
    libldnhncr \
    libreverbwrapper \
    libvisualizer \
    libtinycompress \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_effects.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration_bluetooth_legacy_hal.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_configuration_bluetooth_legacy_hal.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration_stub.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_configuration_stub.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_engine_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_engine_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_engine_default_stream_volumes.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_engine_default_stream_volumes.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_engine_product_strategies.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_engine_product_strategies.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_engine_stream_volumes.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_engine_stream_volumes.xml \
    $(LOCAL_PATH)/configs/audio/hearing_aid_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/hearing_aid_audio_policy_configuration.xml \

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# Bluetooth
PRODUCT_PACKAGES += \
    btremoted \
    libldacBT_dec \
    libbt-vendor \
    libbluetooth_mtk \
    libldacBT_bco

# Sensors
PRODUCT_PACKAGES += \
    libsensorndkbridge

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl \
    android.hardware.thermal@2.0-impl

# TinyXML
PRODUCT_PACKAGES += \
    libtinyxml

# UDFPS
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.mapper@2.0-impl-2.1 \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    libvulkan

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl:64 \
    android.hardware.drm@1.0-service-lazy \
    android.hardware.drm@1.3-service.clearkey

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.gatekeeper@1.0-impl

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

# IR
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6873:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6873

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    libhidltransport \
    libhwbinder \

# IMS
PRODUCT_PACKAGES += \
	vendor.mediatek.hardware.mtkradioex@1.0 \
	vendor.mediatek.hardware.videotelephony@1.0 \

# Ramdisk
PRODUCT_PACKAGES += \
    init.mt6873.rc \
    init.mt6873.usb.rc \
    fstab.mt6873 \
    ueventd.mt6873.rc 

# RCS
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    PresencePolling \
    RcsService