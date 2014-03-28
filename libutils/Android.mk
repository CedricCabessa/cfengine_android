LOCAL_PATH:=$(call my-dir)

include $(CLEAR_VARS)
include $(LOCAL_PATH)/../pcre.mk
LOCAL_MODULE := libutils_cfe
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := \
	alloc.c \
	atexit.c \
	hashes.c \
	sequence.c \
	set.c \
	statistics.c \
	string_lib.c \
	proc_keyvalue.c \
	json.c \
	refcount.c \
	list.c \
	logging.c \
	buffer.c \
	ip_address.c \
	map.c \
	array_map.c \
	hash_map.c \
	misc_lib.c \
	writer.c \
	csv_writer.c \
	csv_parser.c \
	xml_writer.c \
	file_lib.c \
	man.c \
	rb-tree.c \
	mustache.c \
	cfversion.c \
	unicode.c \
	hash.c \
	queue.c \
	ring_buffer.c

LOCAL_C_INCLUDES := \
        external/openssl/include \
	$(pcre_intermediatesInc)

LOCAL_CFLAGS += -DHAVE_CONFIG_H -std=c99
include $(BUILD_STATIC_LIBRARY)
