LOCAL_PATH:=$(call my-dir)

include $(CLEAR_VARS)
include $(LOCAL_PATH)/../pcre.mk
LOCAL_MODULE := libenv
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := \
	constants.c \
        sysinfo.c \
        time_classes.c \
	unix_iface.c \
        zones.c

LOCAL_C_INCLUDES := \
        external/cfengine/libutils \
        external/cfengine/libcfnet \
        external/cfengine/libpromises \
        external/openssl/include \
	$(pcre_intermediatesInc)

LOCAL_CFLAGS += -DHAVE_CONFIG_H -std=c99
include $(BUILD_STATIC_LIBRARY)
