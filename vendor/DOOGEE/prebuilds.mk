PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.debuggable=1 \
	ro.adb.secure=0 \
	ro.secure=0 \
	persist.sys.usb.config=mtp,adb

# Add proprietary binary files
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(LOCAL_PATH)/system/common,system)

PRODUCT_PACKAGES += \
	busybox

########################################################
# GAPPS apps
GAPPS_VARIANT := pico
GAPPS_FORCE_PACKAGE_OVERRIDES := true
#GAPPS_FORCE_MATCHING_DPI := true
DONT_DEXPREOPT_PREBUILTS := true
GAPPS_FORCE_WEBVIEW_OVERRIDES := true
GAPPS_FORCE_BROWSER_OVERRIDES := true

PRODUCT_PACKAGES += \
        GoogleTTS \
        GoogleHome \
	PixelLauncher \
        LatinImeGoogle \
        Chrome \
        Velvet \
	CalendarGooglePrebuilt

GAPPS_EXCLUDED_PACKAGES := \
	Video \
	Videos \
	GooglePackageInstaller \
	SetupWizard

ifneq ($(MTK_K64_SUPPORT), yes)
WITH_DEXPREOPT := true
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(LOCAL_PATH)/system/x32,system)
else
WITH_DEXPREOPT := false
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(LOCAL_PATH)/system/x64,system)
endif

$(call inherit-product-if-exists, vendor/opengapps/build/opengapps-packages.mk)

