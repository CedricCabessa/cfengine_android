LOCAL_PATH:=$(call my-dir)

include $(CLEAR_VARS)
include $(LOCAL_PATH)/../pcre.mk
LOCAL_MODULE := cf-upgrade
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := \
	alloc-mini.c \
	cf-upgrade.c \
	command_line.c \
	configuration.c \
	log.c \
	process.c \
	update.c

LOCAL_C_INCLUDES := \
        external/cfengine/libpromises \
        external/cfengine/libutils \
        external/cfengine/libcfnet \
        external/cfengine/libenv \
        external/openssl/include \
	$(pcre_intermediatesInc)

LOCAL_SHARED_LIBRARIES := libpromises

LOCAL_CFLAGS += -DHAVE_CONFIG_H -std=c99
include $(BUILD_EXECUTABLE)
