#
# Copyright (C) 2012 The Android-x86 Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#

TARGET_ALSA_CONF_DIR := system/usr/share/alsa
LOCAL_ALSA_CONF_DIR  := external/alsa-lib/src/conf

copy_conf := \
	alsa.conf \
	pcm/dsnoop.conf \
	pcm/modem.conf \
	pcm/dpl.conf \
	pcm/default.conf \
	pcm/surround51.conf \
	pcm/surround41.conf \
	pcm/surround50.conf \
	pcm/dmix.conf \
	pcm/center_lfe.conf \
	pcm/surround40.conf \
	pcm/side.conf \
	pcm/iec958.conf \
	pcm/rear.conf \
	pcm/surround71.conf \
	pcm/front.conf \
	cards/aliases.conf

LOCAL_ALSA_INIT_DIR  := external/alsa-utils/alsactl/init

copy_init := \
	00main \
	default \
	hda \
	help \
	info \
	test

PRODUCT_COPY_FILES := \
	$(foreach f,$(copy_conf),$(LOCAL_ALSA_CONF_DIR)/$(f):$(TARGET_ALSA_CONF_DIR)/$(f)) \
	$(foreach f,$(copy_init),$(LOCAL_ALSA_INIT_DIR)/$(f):$(TARGET_ALSA_CONF_DIR)/init/$(f)) \
	$(if $(wildcard $(PRODUCT_DIR)audio_policy.conf),$(PRODUCT_DIR),$(LOCAL_PATH)/)audio_policy.conf:system/etc/audio_policy.conf \

PRODUCT_PACKAGES := \
	alsa_amixer \
	alsa_aplay \
	alsa_ctl \
	audio.primary.x86 \
	audio.a2dp.default \
	audio.usb.default \
	audio_policy.default \
	audio.r_submix.default \
