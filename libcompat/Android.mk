LOCAL_PATH:=$(call my-dir)

include $(CLEAR_VARS)
include $(LOCAL_PATH)/../pcre.mk
LOCAL_MODULE := libcompat
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := \
	memdup.c \
	rpl_ctime.c \
	generic_at.c \
	getopt.c \
	getopt1.c

LOCAL_C_INCLUDES := \
        external/cfengine/libutils \
	external/openssl/include \
	$(pcre_intermediatesInc)

LOCAL_CFLAGS += -DHAVE_CONFIG_H -std=c99
include $(BUILD_STATIC_LIBRARY)
