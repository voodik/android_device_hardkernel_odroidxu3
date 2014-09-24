#
# Copyright (C) 2011 The CyanogenMod Project
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

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
LOCAL_SRC_FILES:= \
	CameraHal_Module.cpp \
        V4L2Camera.cpp \
        CameraHardware.cpp \
        convert.S \
        rgbconvert.c

LOCAL_C_INCLUDES += \
	$(TOP)/frameworks/base/include/android_runtime \
	$(TOP)/bionic \
    $(TOP)/external/expat/lib \
    $(TOP)/external/stlport/stlport \
    $(TOP)/external/jpeg \
    $(TOP)/external/jhead

LOCAL_SHARED_LIBRARIES:= \
	liblog \
    libui \
    libbinder \
    libutils \
    libcutils \
    libcamera_client \
    libcameraservice \
    libgui \
    libjpeg \
    libexif

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE:= camera.$(TARGET_BOOTLOADER_BOARD_NAME)
LOCAL_MODULE_TAGS:= optional

include $(BUILD_SHARED_LIBRARY)
