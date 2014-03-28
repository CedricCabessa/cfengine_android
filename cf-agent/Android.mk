LOCAL_PATH:=$(call my-dir)

include $(CLEAR_VARS)
include $(LOCAL_PATH)/../pcre.mk
LOCAL_MODULE := cf-agent
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := \
	agent-diagnostics.c \
        tokyo_check.c \
        abstract_dir.c \
        cf-agent.c \
	cf-agent-enterprise-stubs.c \
        comparray.c \
        acl_posix.c \
        cf_sql.c \
        promiser_regex_resolver.c \
        match_scope.c \
	nfs.c \
        retcode.c  \
        verify_acl.c \
        verify_files.c \
        verify_files_utils.c \
        verify_files_hashes.c \
        verify_storage.c \
        verify_exec.c \
        verify_methods.c \
        verify_databases.c \
        verify_processes.c \
        verify_services.c  \
        verify_environments.c \
        files_edit.c \
        files_editline.c \
        files_editxml.c \
        files_links.c \
        files_operators.c \
        files_properties.c \
        files_repository.c \
        files_select.c  \
        vercmp_internal.c \
        vercmp.c \
        verify_packages.c \
        verify_users.c \
	verify_users_stub.c

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
