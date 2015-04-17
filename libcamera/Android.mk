LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_CFLAGS := -fno-short-enums -DHAVE_CONFIG_H

LOCAL_C_INCLUDES := \
	system/media/camera/include \
	external/jpeg

LOCAL_SRC_FILES := \
	CameraFactory.cpp \
	CameraHal.cpp \
	CameraHardware.cpp \
	Converter.cpp \
	SurfaceDesc.cpp \
	SurfaceSize.cpp \
	Utils.cpp \
	V4L2Camera.cpp \

LOCAL_SHARED_LIBRARIES := \
	libcamera_client \
	libcutils \
	libjpeg \
	liblog \
	libui \
	libutils \

LOCAL_MODULE := camera.$(TARGET_BOOTLOADER_BOARD_NAME)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_RELATIVE_PATH := hw

include $(BUILD_SHARED_LIBRARY)

