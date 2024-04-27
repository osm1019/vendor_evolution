# Evolution X packages
PRODUCT_PACKAGES += \
    EvoEgg

ifeq ($(EVO_BUILD_TYPE),Official)
PRODUCT_PACKAGES += \
    Updater

ifeq ($(WITH_GMS),false)
PRODUCT_PACKAGES += \
    UpdaterVanillaOverlay
endif
endif

# Face Unlock

ifeq ($(TARGET_SUPPORTS_64_BIT_APPS),true)
TARGET_FACE_UNLOCK_SUPPORTED ?= true

ifeq ($(TARGET_FACE_UNLOCK_SUPPORTED),true)
PRODUCT_PACKAGES += \
    ParanoidSense
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.face.sense_service=true
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
endif
endif
# Cloned app exemption
PRODUCT_COPY_FILES += \
    vendor/lineage/prebuilt/common/etc/sysconfig/preinstalled-packages-platform-evolution-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/preinstalled-packages-platform-evolution-product.xml

# Private keys
ifeq ($(EVO_BUILD_TYPE),Official)
include vendor/evolution-priv/keys/keys.mk
else
-include vendor/evolution-priv/keys/keys.mk
endif
