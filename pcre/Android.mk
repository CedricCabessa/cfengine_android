#
# copy from external/pcre/Android.mk
# we tune the file to compile a static lib for the target.
# Source code stay in external/pcre, so we have to play with the "src_prefix" var
#

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

src_prefix=../../pcre
LOCAL_MODULE:= libpcre_target

intermediatesSrc := $(call intermediates-dir-for,STATIC_LIBRARIES,libpcre_target,,)/pcre/src
intermediatesInc := $(call intermediates-dir-for,STATIC_LIBRARIES,libpcre_target,,)/pcre/include

pcre_generated_header1 := $(intermediatesInc)/pcre.h
$(pcre_generated_header1): PRIVATE_INPUT_FILE := $(LOCAL_PATH)/$(src_prefix)/pcre.h.generic
$(pcre_generated_header1): PRIVATE_CUSTOM_TOOL = cp -f $(PRIVATE_INPUT_FILE) $@
$(pcre_generated_header1): $(LOCAL_PATH)/$(src_prefix)/pcre.h.generic
	$(transform-generated-source)

pcre_generated_header2 := $(intermediatesInc)/config.h
$(pcre_generated_header2): PRIVATE_INPUT_FILE := $(LOCAL_PATH)/$(src_prefix)/config.h.android
$(pcre_generated_header2): PRIVATE_CUSTOM_TOOL = cp -f $(PRIVATE_INPUT_FILE) $@
$(pcre_generated_header2): $(LOCAL_PATH)/$(src_prefix)/config.h.android
	$(transform-generated-source)

GEN := $(intermediatesSrc)/pcre_chartables.c
$(GEN): PRIVATE_INPUT_FILE := $(LOCAL_PATH)/$(src_prefix)/pcre_chartables.c.dist
$(GEN): PRIVATE_CUSTOM_TOOL = cp -f $(PRIVATE_INPUT_FILE) $@
$(GEN): $(LOCAL_PATH)/$(src_prefix)/pcre_chartables.c.dist
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)
$(GEN) : $(pcre_generated_header1) $(pcre_generated_header2)

LOCAL_C_INCLUDES += $(intermediatesInc) external/pcre

PCRE_SRC_FILES := \
    $(src_prefix)/pcre_compile.c \
    $(src_prefix)/pcre_config.c \
    $(src_prefix)/pcre_dfa_exec.c \
    $(src_prefix)/pcre_exec.c \
    $(src_prefix)/pcre_fullinfo.c \
    $(src_prefix)/pcre_get.c \
    $(src_prefix)/pcre_globals.c \
    $(src_prefix)/pcre_info.c \
    $(src_prefix)/pcre_newline.c \
    $(src_prefix)/pcre_maketables.c \
    $(src_prefix)/pcre_ord2utf8.c \
    $(src_prefix)/pcre_refcount.c \
    $(src_prefix)/pcre_study.c \
    $(src_prefix)/pcre_tables.c \
    $(src_prefix)/pcre_try_flipped.c \
    $(src_prefix)/pcre_ucd.c \
    $(src_prefix)/pcre_valid_utf8.c \
    $(src_prefix)/pcre_version.c \
    $(src_prefix)/pcre_xclass.c

LOCAL_SRC_FILES := $(PCRE_SRC_FILES)

LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -DHAVE_CONFIG_H
LOCAL_CFLAGS += -fPIC
include $(BUILD_STATIC_LIBRARY)
