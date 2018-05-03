#
# Copyright (C) 2011 The Android Open-Source Project
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

# .rc
PRODUCT_COPY_FILES := \
	device/sanyo/40TL04/init.freescalemx53bej2board.rc:root/init.freescalemx53bej2board.rc \
	device/sanyo/40TL04/ueventd.freescalemx53bej2board.rc:root/ueventd.freescalemx53bej2board.rc \
	device/sanyo/40TL04/init.tsmode.rc:root/init.tsmode.rc \
        device/sanyo/40TL04/fstab.freescalemx53bej2board:root/fstab.freescalemx53bej2board

#cmd
PRODUCT_COPY_FILES += \
        device/sanyo/40TL04/cmd/mlan_tool:system/bin/mlan_tool \
        device/sanyo/40TL04/cmd/set_macaddr:system/bin/set_macaddr

# other
PRODUCT_COPY_FILES += \
        device/sanyo/40TL04/other/mlan.ko:system/wifi/mlan.ko \
        device/sanyo/40TL04/other/sd8787.ko:system/wifi/sd8787.ko\
        device/sanyo/40TL04/other/sd8787_uapsta.bin:system/wifi/sd8787_uapsta.bin \
device/sanyo/40TL04/other/hostapd.conf:system/etc/wifi/hostapd.conf \
device/sanyo/40TL04/other/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf


# These are the hardware-specific features
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
        frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
        frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml

PRODUCT_PACKAGES := \
        libasound\
        make_ext4fs \
	com.android.future.usb.accessory \
	librs_jni \
        libGLES_android

PRODUCT_PROPERTY_OVERRIDES := \
	hwui.render_dirty_regions=false \
        ro.config.low_ram=true \
        ro.sf.lcd_density=160 \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=15

PRODUCT_TAGS += dalvik.gc.type-precise

