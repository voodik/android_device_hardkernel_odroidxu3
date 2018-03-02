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

LOCAL_PATH := device/hardkernel/odroidxu3

BOARD_VENDOR := samsung

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include


# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := odroidxu3
TARGET_NO_BOOTLOADER := true

#SU
WITH_SU := true

# Platform
TARGET_BOARD_PLATFORM := exynos5
TARGET_SOC := exynos5422
TARGET_SLSI_VARIANT := cm

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a15
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a15

TARGET_BOARD_PLATFORM_GPU := mali-t628mp6
# big.LITTLE load balancing
# ENABLE_CPUSETS := true

# RENDERSCRIPT
BOARD_OVERRIDE_RS_CPU_VARIANT_32 := cortex-a15

# Kernel
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_CONFIG := odroidxu3_defconfig
TARGET_KERNEL_SOURCE := kernel/hardkernel/odroidxu3
TARGET_LINUX_KERNEL_VERSION := 3.10
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
#TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androidkernel-
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-
#BOARD_KERNEL_SEPARATED_DT := true

#WITH_DEXPREOPT := true

# Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_I2S_AUDIO := true
BOARD_USES_PCM_AUDIO := false
BOARD_USES_SPDIF_AUDIO := false

# Media
BOARD_USE_VP8ENC_SUPPORT := true

# Bionic
#TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

#
# Bluetooth
#
#BOARD_HAVE_BLUETOOTH 			:= true
#BLUETOOTH_HCI_USE_USB 			:= true
#BOARD_HAVE_BLUETOOTH_BCM 		:= true
#BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/hardkernel/odroidxu3/bluetooth
#BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL    	:= true

# Some framework code requires this to enable BT

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_LINUX := true
BOARD_BLUETOOTH_BDROID_HCILP_INCLUDED := false
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/hardkernel/odroidxu3/bluetooth


# ODROID USBIO-SENSOR
BOARD_HAVE_ODROID_SENSOR := true

# Boot animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_MULTITHREAD_DECODE := true

# Camera
#BOARD_NEEDS_MEMORYHEAPION := true
BOARD_USE_STOREMETADATA := true
BOARD_USE_METADATABUFFERTYPE := true
BOARD_USE_DMA_BUF := true
BOARD_USE_ANB_OUTBUF_SHARE := true
BOARD_USE_IMPROVED_BUFFER := true
#COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
BOARD_USE_NON_CACHED_GRAPHICBUFFER := true
BOARD_USE_GSC_RGB_ENCODER := true
BOARD_USE_CSC_HW := false
BOARD_USE_QOS_CTRL := false
BOARD_USE_S3D_SUPPORT := true
BOARD_USE_VP8ENC_SUPPORT := true

BOARD_BACK_CAMERA_ROTATION := 270
BOARD_FRONT_CAMERA_ROTATION := 90
BOARD_USE_MHB_ION := true


# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
OVERRIDE_RS_DRIVER := libRSDriverArm.so

BOARD_USE_BGRA_8888 := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 5

#HWC
BOARD_USES_HWC_SERVICES := true
TARGET_SAMSUNG_GRALLOC_EXTERNAL_USECASES := true
#TARGET_USES_HWC2 := true
TARGET_OMX_LEGACY_RESCALING := true

#HDMI
BOARD_USES_GSC_VIDEO := true
#BOARD_USES_CEC := true

# Media
#COMMON_GLOBAL_CFLAGS += -DUSE_NATIVE_SEC_NV12TILED # use format from fw/native
#COMMON_GLOBAL_CFLAGS += -DSURFACE_IS_BGR32

# GSC
BOARD_USES_ONLY_GSC0_GSC1 := true

# FIMG2D
BOARD_USES_SKIA_FIMGAPI := true
BOARD_USES_NEON_BLITANTIH := true
BOARD_USES_FIMGAPI_V4L2 := false
# SCALER
BOARD_USES_SCALER := true

# Keymaster
BOARD_USES_TRUST_KEYMASTER := false

# frameworks/native/libs/binder/Parcel.cpp
TARGET_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

#
# Wifi related defines
#
# ralink module = rt5370sta, realtek = rtl8191su
#
BOARD_WIFI_VENDOR	:= realtek
BOARD_WLAN_DEVICE	:= rtl819xxu

ifeq ($(BOARD_WLAN_DEVICE), rt5370sta)
    WPA_SUPPLICANT_VERSION              := VER_0_8_X
    BOARD_WPA_SUPPLICANT_DRIVER         := WEXT
    BOARD_WPA_SUPPLICANT_PRIVATE_LIB    := lib_driver_cmd
    WIFI_DRIVER_MODULE_NAME		        := "rt5370sta"
    WIFI_DRIVER_MODULE_PATH             := "/system/lib/modules/rt5370sta.ko"
endif

ifeq ($(BOARD_WLAN_DEVICE), rtl819xxu)
    WPA_SUPPLICANT_VERSION              := VER_0_8_X
    BOARD_WPA_SUPPLICANT_DRIVER := NL80211
    BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_rtl
    BOARD_HOSTAPD_DRIVER        := NL80211
    BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_rtl

#    WIFI_DRIVER_MODULE_NAME	:= "rtl8191su"
#    WIFI_DRIVER_MODULE_PATH	:= "/system/lib/modules/rtl8191su.ko"

    WIFI_DRIVER_MODULE_PATH := auto

#    WIFI_DRIVER_MODULE_NAME     := "8192cu"
#    WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/8192cu.ko"

#    WIFI_DRIVER_MODULE_NAME2	:= "8192cu"
#    WIFI_DRIVER_MODULE_PATH2	:= "/system/lib/modules/8192cu.ko"

#    WIFI_DRIVER_MODULE_NAME3	:= "rt2800usb"
#    WIFI_DRIVER_MODULE_PATH3	:= "/system/lib/modules/rt2800usb.ko"

    # Realtek driver has FW embedded inside, and will automatically load FW
    # at NIC initialization process. So there is no need to set these
    # 5 variables.
    WIFI_DRIVER_MODULE_ARG           := ""
    WIFI_FIRMWARE_LOADER             := ""
    WIFI_DRIVER_FW_PATH_STA          := ""
    WIFI_DRIVER_FW_PATH_AP           := ""
    WIFI_DRIVER_FW_PATH_P2P          := ""
    WIFI_DRIVER_FW_PATH_PARAM        := ""
endif

# Webkit
ENABLE_WEBGL := true

#FS
TARGET_KERNEL_HAVE_EXFAT := true

# Filesystems
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 4096

# Recovery
#BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
#BOARD_HAS_NO_SELECT_BUTTON := true
#TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.odroidxu3
TARGET_USERIMAGES_USE_EXT4 := true
#BOARD_RECOVERY_SWIPE := true

TARGET_NO_RECOVERY := true

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/hardkernel/odroidxu3/sepolicy


# Charging mode
#BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
BOARD_BATTERY_DEVICE_NAME := battery

# Releasetools
#TARGET_RELEASETOOLS_EXTENSIONS := $(LOCAL_PATH)

# inherit from the proprietary version
-include vendor/hardkernel/odroidxu3/BoardConfigVendor.mk
