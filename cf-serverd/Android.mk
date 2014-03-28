LOCAL_PATH:=$(call my-dir)

include $(CLEAR_VARS)
include $(LOCAL_PATH)/../pcre.mk
LOCAL_MODULE := cf-serverd
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := \
	cf-serverd.c \
	cf-serverd-functions.c \
	server.c \
	server_common.c \
	strlist.c \
	cf-serverd-enterprise-stubs.c \
	server_access.c \
	server_classic.c \
	server_transform.c \
	tls_server.c

LOCAL_C_INCLUDES := \
        external/cfengine/libpromises \
        external/cfengine/libutils \
        external/cfengine/libcfnet \
        external/cfengine/libenv \
        external/openssl/include \
	$(pcre_intermediatesInc)

LOCAL_SHARED_LIBRARIES := libpromises libcrypto libssl

LOCAL_CFLAGS += -DHAVE_CONFIG_H -std=c99
include $(BUILD_EXECUTABLE)
