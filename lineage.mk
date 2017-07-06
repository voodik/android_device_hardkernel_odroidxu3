$(call inherit-product, device/hardkernel/odroidxu3/full_odroidxu3.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

PRODUCT_NAME := lineage_odroidxu3
PRODUCT_DEVICE := odroidxu3

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_MODEL=ODROID-XU3
