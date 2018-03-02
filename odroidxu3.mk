#
# Copyright (C) 2013 The CyanogenMod Project
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
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

LOCAL_PATH := device/hardkernel/odroidxu3

# overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.odroidxu3 \
    fstab.odroidxu3.sdboot \
    init.odroidxu3.rc \
    init.odroidxu3.usb.rc \
    init.odroidxu3.wifi.rc \
    lpm.rc \
    ueventd.odroidxu3.rc

# Recovery
#PRODUCT_PACKAGES += \
#    init.recovery.odroidxu3.rc

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/mixer_paths.xml:system/etc/mixer_paths.xml

# audio
PRODUCT_PACKAGES += \
	audio.primary.odroidxu3 \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	tinyplay \
	tinymix \
	tinycap

# wifi
PRODUCT_PACKAGES += \
        hostapd \
        wpa_supplicant.conf \
        dhcpcd.conf \
        wpa_supplicant

PRODUCT_PACKAGES += \
    camera.odroidxu3 \
    libhwjpeg

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs \
    su

# GPS
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/configs/gps.cer:system/etc/gps.cer \
#    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
#    $(LOCAL_PATH)/configs/gps.xml:system/etc/gps.xml

# HW composer
PRODUCT_PACKAGES += \
    gralloc.exynos5 \
    hwcomposer.exynos5 \
    libion \
    hdmi_cec.odroidxu3

# HAL blob compatibility
PRODUCT_PACKAGES += \
    libstlport

# DVB
PRODUCT_PACKAGES += \
    mumudvb \
    libavfilter \
    libavresample \
    libiconv \

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/odroid-ts.idc:system/usr/idc/odroid-ts.idc \
    $(LOCAL_PATH)/idc/Vendor_0eef_Product_0005.idc:system/usr/idc/Vendor_0eef_Product_0005.idc \
    $(LOCAL_PATH)/idc/Vendor_03fc_Product_05d8.idc:system/usr/idc/Vendor_03fc_Product_05d8.idc \
    $(LOCAL_PATH)/idc/Vendor_1870_Product_0119.idc:system/usr/idc/Vendor_1870_Product_0119.idc \
    $(LOCAL_PATH)/idc/Vendor_1870_Product_0100.idc:system/usr/idc/Vendor_1870_Product_0100.idc \
    $(LOCAL_PATH)/idc/Vendor_2808_Product_81c9.idc:system/usr/idc/Vendor_2808_Product_81c9.idc \
    $(LOCAL_PATH)/idc/Vendor_16b4_Product_0704.idc:system/usr/idc/Vendor_16b4_Product_0704.idc \
    $(LOCAL_PATH)/idc/Vendor_16b4_Product_0705.idc:system/usr/idc/Vendor_16b4_Product_0705.idc \
    $(LOCAL_PATH)/idc/Vendor_04d8_Product_0c03.idc:system/usr/idc/Vendor_04d8_Product_0c03.idc \
    $(LOCAL_PATH)/idc/Vendor_04DD_Product_9570.idc:system/usr/idc/Vendor_04DD_Product_9570.idc \
    $(LOCAL_PATH)/idc/VNCINPUT.idc:system/usr/idc/VNCINPUT.idc \
    $(LOCAL_PATH)/keylayout/odroid-ts.kl:system/usr/keylayout/odroid-ts.kl \
    $(LOCAL_PATH)/keylayout/Vendor_054c_Product_05c4.kl:system/usr/keylayout/Vendor_054c_Product_05c4.kl \
    $(LOCAL_PATH)/keylayout/odroid-keypad.kl:system/usr/keylayout/odroid-keypad.kl

# Hdmi CEC: Odroid-XU3 works as a playback device (4).
PRODUCT_PROPERTY_OVERRIDES += ro.hdmi.device_type=4


# Keystore
#PRODUCT_PACKAGES += \
#    keystore.exynos5

# Memtrack
PRODUCT_PACKAGES += \
    memtrack.exynos5

# Lights
#PRODUCT_PACKAGES += \
#    lights.odroidxu3

# Media profile
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml  \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# MobiCore
PRODUCT_PACKAGES += \
	libMcClient \
	libMcRegistry \
	libgdmcprov \
	mcDriverDaemon


# OMX
PRODUCT_PACKAGES += \
    libExynosOMX_Core \
    libOMX.Exynos.AVC.Decoder \
    libOMX.Exynos.AVC.Encoder \
    libOMX.Exynos.MPEG2.Decoder \
    libOMX.Exynos.MPEG4.Decoder \
    libOMX.Exynos.MPEG4.Encoder \
    libOMX.Exynos.VP8.Decoder \
    libOMX.Exynos.VP8.Encoder \
    libstagefrighthw

# Radio
PRODUCT_PACKAGES += \
	rild \
	chat \
	mngblt

# Telephony-ext
PRODUCT_PACKAGES += telephony-ext
PRODUCT_BOOT_JARS += telephony-ext

#USB 3g support
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml \
    $(LOCAL_PATH)/usb3g/etc/ppp/ip-down:system/etc/ppp/ip-down \
    $(LOCAL_PATH)/usb3g/etc/ppp/ip-up:system/etc/ppp/ip-up \
    $(LOCAL_PATH)/usb3g/etc/ppp/call-pppd:system/etc/ppp/call-pppd \
    $(LOCAL_PATH)/usb3g/etc/operator_table:system/etc/operator_table \
    $(LOCAL_PATH)/usb3g/bin/usb_modeswitch.sh:system/bin/usb_modeswitch.sh \
    $(LOCAL_PATH)/usb3g/bin/usb_modeswitch:system/bin/usb_modeswitch \
    $(LOCAL_PATH)/usb3g/lib/libril-rk29-dataonly.so:system/lib/libril-rk29-dataonly.so

modeswitch_files := $(shell ls $(LOCAL_PATH)/usb3g/etc/usb_modeswitch.d)
PRODUCT_COPY_FILES += \
    $(foreach file, $(modeswitch_files), \
    $(LOCAL_PATH)/usb3g/etc/usb_modeswitch.d/$(file):system/etc/usb_modeswitch.d/$(file))

PRODUCT_PROPERTY_OVERRIDES += \
    ril.function.dataonly=1 \
    ro.radio.noril=1 \
    ro.disable.ethernet=0 \
    touchscreen.reverse=false


#Bluetooth
PRODUCT_PACKAGES += \
    btattach \
    hciconfig \
    hcitool \

#USB GPS support
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/usb3g/lib/gps.default.so:system/lib/hw/gps.default.so \
#    $(LOCAL_PATH)/configs/init.gps.sh:system/etc/init.gps.sh

PRODUCT_PACKAGES += \
    gps.odroidxu3

PRODUCT_PACKAGES += \
    sensors.odroidxu3

#RT5370 module firmware
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/configs/rt2870.bin:system/etc/firmware/rt2870.bin

PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.gps=ttyGPS0 \
    ro.kernel.android.gps.speed=9600

#Hardkernel
PRODUCT_PACKAGES += \
	OdroidUpdater \
	Utility

# Samsung
#PRODUCT_PACKAGES += \
#    SamsungServiceMode


ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0



# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp \
    ro.kernel.android.checkjni=0 

# Enable repeatable keys in CWM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true \
    ro.cwm.repeatable_keys=114,115

# System properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608 \
    mouse.right.click=back \
    ro.rfkilldisabled=1

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-filter=speed \
    dalvik.vm.dex2oat-swap=false

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardwardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_CHARACTERISTICS := tablet

# inherit the opengapps config
-include $(LOCAL_PATH)/opengapps.mk

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# call the proprietary setup
$(call inherit-product-if-exists, vendor/samsung_slsi/exynos5422/exynos5422-vendor.mk)
