# Inherit common mobile Lineage stuff
$(call inherit-product, vendor/lineage/config/common.mk)

# Include AOSP audio files
$(call inherit-product-if-exists, frameworks/base/data/sounds/AudioPackage14.mk)
include vendor/lineage/config/aosp_audio.mk

# Include Lineage audio files
include vendor/lineage/config/lineage_audio.mk

# Default notification/alarm sounds
ifeq ($(WITH_GMS),true)
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.notification_sound=Eureka.ogg \
    ro.config.alarm_alert=Fresh_start.ogg
else
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Hassium.ogg
endif

# Apps
PRODUCT_PACKAGES += \
    AvatarPicker \
    Backgrounds \
    Glimpse \
    LatinIME

# Charger
PRODUCT_PACKAGES += \
    product_charger_res_images \
    product_charger_res_images_vendor

# Customizations
PRODUCT_PACKAGES += \
    NavigationBarMode2ButtonOverlay

# Legal
PRODUCT_SYSTEM_PROPERTIES += \
    ro.evolutionlegal.url=https://evolution-x.org/legal.php

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet

# TextClassifier
PRODUCT_PACKAGES += \
    libtextclassifier_annotator_en_model \
    libtextclassifier_annotator_universal_model \
    libtextclassifier_actions_suggestions_universal_model \
    libtextclassifier_lang_id_model

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/etc/textclassifier/actions_suggestions.universal.model \
    system/etc/textclassifier/lang_id.model \
    system/etc/textclassifier/textclassifier.en.model \
    system/etc/textclassifier/textclassifier.universal.model

# TFLite service.
PRODUCT_PACKAGES += libtensorflowlite_jni

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/lib/libtensorflowlite_jni.so \
    system/lib64/libtensorflowlite_jni.so

# Themes
PRODUCT_PACKAGES += \
    ThemePicker \
    ThemesStub
