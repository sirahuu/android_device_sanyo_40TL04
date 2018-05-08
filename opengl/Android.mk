LOCAL_PATH:= $(call my-dir)

###############################################################################
# Build META EGL library
#

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= 	       \
	EGL/egl_tls.cpp        \
	EGL/egl_cache.cpp      \
	EGL/egl_display.cpp    \
	EGL/egl_object.cpp     \
	EGL/egl.cpp 	       \
	EGL/eglApi.cpp 	       \
	EGL/trace.cpp              \
	EGL/getProcAddress.cpp.arm \
	EGL/Loader.cpp 	       \
#

LOCAL_SHARED_LIBRARIES += libcutils libutils liblog libGLES_trace
LOCAL_LDLIBS := -lpthread -ldl
LOCAL_MODULE:= libEGL.40TL04
LOCAL_MODULE_TAGS := optional
LOCAL_LDFLAGS += -Wl,--exclude-libs=ALL
LOCAL_SHARED_LIBRARIES += libdl
# we need to access the private Bionic header <bionic_tls.h>
LOCAL_C_INCLUDES += bionic/libc/private

LOCAL_CFLAGS += -DLOG_TAG=\"libEGL\"
LOCAL_CFLAGS += -DGL_GLEXT_PROTOTYPES -DEGL_EGLEXT_PROTOTYPES
LOCAL_CFLAGS += -fvisibility=hidden
LOCAL_CFLAGS += -DEGL_TRACE=1

ifeq ($(BOARD_ALLOW_EGL_HIBERNATION),true)
  LOCAL_CFLAGS += -DBOARD_ALLOW_EGL_HIBERNATION
endif
ifeq ($(TARGET_BOARD_PLATFORM), omap4)
  LOCAL_CFLAGS += -DWORKAROUND_BUG_10194508=1
endif
ifneq ($(MAX_EGL_CACHE_ENTRY_SIZE),)
  LOCAL_CFLAGS += -DMAX_EGL_CACHE_ENTRY_SIZE=$(MAX_EGL_CACHE_ENTRY_SIZE)
endif

ifneq ($(MAX_EGL_CACHE_KEY_SIZE),)
  LOCAL_CFLAGS += -DMAX_EGL_CACHE_KEY_SIZE=$(MAX_EGL_CACHE_KEY_SIZE)
endif

ifneq ($(MAX_EGL_CACHE_SIZE),)
  LOCAL_CFLAGS += -DMAX_EGL_CACHE_SIZE=$(MAX_EGL_CACHE_SIZE)
endif

include $(BUILD_SHARED_LIBRARY)

include $(call all-makefiles-under,$(LOCAL_PATH))