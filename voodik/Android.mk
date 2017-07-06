LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE    := hdmi_cec.$(TARGET_BOOTLOADER_BOARD_NAME)
LOCAL_SRC_FILES := hdmi_cec.odroidxu3.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH             := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE_TAGS             := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_SHARED_LIBRARIES        := liblog libutils libcutils libhardware_legacy

include $(BUILD_PREBUILT)


