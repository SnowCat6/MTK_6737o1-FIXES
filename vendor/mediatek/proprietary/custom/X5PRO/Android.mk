LOCAL_PATH:= $(call my-dir)
ifeq ($(MTK_PROJECT), X5PRO)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
