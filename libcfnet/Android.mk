LOCAL_PATH:=$(call my-dir)

include $(CLEAR_VARS)
include $(LOCAL_PATH)/../pcre.mk
LOCAL_MODULE := libcfnet
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := \
	classic.c \
	misc.c \
	net.c \
	connection_info.c \
	communication.c \
	client_protocol.c \
	client_code.c \
	key.c \
	tls_client.c \
	tls_generic.c

LOCAL_C_INCLUDES := \
        external/cfengine/libutils \
        external/cfengine/libpromises \
        external/openssl/include \
	$(pcre_intermediatesInc)

LOCAL_CFLAGS += -DHAVE_CONFIG_H -std=c99
include $(BUILD_STATIC_LIBRARY)
