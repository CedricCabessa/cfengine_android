LOCAL_PATH:=$(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := cfengine-wrapper.sh
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := cfengine-wrapper.sh
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := run-inventory
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := run-inventory
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := cf-delay
LOCAL_SRC_FILES := cf-delay.c
LOCAL_MODULE_TAGS := optional
include $(BUILD_EXECUTABLE)

