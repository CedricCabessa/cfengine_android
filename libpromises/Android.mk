LOCAL_PATH:=$(call my-dir)

include $(CLEAR_VARS)
include $(LOCAL_PATH)/../pcre.mk
LOCAL_MODULE := libpromises
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := \
        acl_tools_posix.c \
        actuator.c \
        addr_lib.c \
        assoc.c \
        audit.c \
        attributes.c \
        bootstrap.c \
        cf3globals.c \
        chflags.c \
        class.c \
        classes.c \
        constants.c \
        conversion.c \
        crypto.c \
        dbm_api.c \
        dbm_migration.c \
        dbm_migration_lastseen.c \
        dbm_migration_bundles.c \
        dbm_lmdb.c \
        dbm_quick.c \
        dbm_tokyocab.c \
        enterprise_extension.c \
	enterprise_stubs.c \
        eval_context.c \
        evalfunction.c \
        exec_tools.c \
        expand.c \
        extensions.c \
        files_copy.c \
        files_hashes.c \
        files_interfaces.c \
        files_lib.c \
        files_names.c \
        fncall.c \
        generic_agent.c \
        granules.c \
        instrumentation.c \
        item_lib.c \
        iteration.c \
        keyring.c \
	known_dirs.c \
        lastseen.c \
        loading.c \
        locks.c  \
        logic_expressions.c \
        matching.c \
        math_eval.c \
        mod_access.c \
        mod_common.c \
        mod_databases.c \
        mod_environ.c \
        mod_exec.c \
        mod_files.c \
        mod_measurement.c \
        mod_methods.c \
        mod_outputs.c \
        mod_packages.c \
        mod_process.c \
        mod_report.c \
        mod_services.c \
        mod_storage.c  \
        mod_knowledge.c \
        mod_users.c \
        modes.c \
        mutex.c \
        ornaments.c \
        policy.c \
        parser.c \
        patches.c \
        pipes.c \
        processes_select.c \
        promises.c \
        rlist.c \
        scope.c \
        shared_lib.c \
        signals.c \
        sort.c \
        storage_tools.c \
        string_expressions.c \
        syntax.c \
        syslog_client.c \
        timeout.c \
        unix.c \
        var_expressions.c \
        vars.c \
        variable.c \
        verify_classes.c \
        verify_reports.c \
        verify_vars.c \
        process_unix.c \
        pipes_unix.c \
        process_linux.c \
        unix_dir.c \

intermediates := $(call intermediates-dir-for,SHARED_LIBRARIES,libpromises,,)

GEN_Y := $(intermediates)/cf3parse.c
$(GEN_Y): $(LOCAL_PATH)/cf3parse.y
	bison -o $@ -d $^

GEN_L := $(intermediates)/cf3lex.c
$(GEN_L): $(LOCAL_PATH)/cf3lex.l
	lex -o $@ $^


LOCAL_GENERATED_SOURCES += $(GEN_L) $(GEN_Y)

LOCAL_C_INCLUDES := \
        external/cfengine/libutils \
        external/cfengine/libcfnet \
        external/cfengine/libenv \
        external/openssl/include \
	external/tokyocabinet \
	$(pcre_intermediatesInc)

LOCAL_SHARED_LIBRARIES += \
        libcrypto \
	libssl \
        libtokyocabinet \

LOCAL_WHOLE_STATIC_LIBRARIES += \
	libcompat \
	libutils_cfe \
	libcfnet \
	libenv \
	libpcre_target

LOCAL_CFLAGS += -DHAVE_CONFIG_H -std=c99
LOCAL_LDFLAGS += -ldl
include $(BUILD_SHARED_LIBRARY)
