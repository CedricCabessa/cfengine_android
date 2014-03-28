LOCAL_PATH:=$(call my-dir)

include $(CLEAR_VARS)
include $(LOCAL_PATH)/../pcre.mk
LOCAL_MODULE := cf-execd
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := \
	cf-execd.c \
	cf-execd-runner.c \
	exec-config.c \
	execd-config.c

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
