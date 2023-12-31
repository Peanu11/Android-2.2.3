# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This is the shared library included by the JNI test app.
#

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libjnitest

# Don't include this package in any configuration by default.
LOCAL_MODULE_TAGS := optional

# This isn't part of the system, so don't prelink it.
LOCAL_PRELINK_MODULE := false

LOCAL_SRC_FILES := \
	android_jni_cts_InstanceNonce.c \
	android_jni_cts_JniCTest.c \
	android_jni_cts_JniCppTest.cpp \
	android_jni_cts_StaticNonce.c \
	helper.c \
	register.c

LOCAL_C_INCLUDES := $(JNI_H_INCLUDE)

LOCAL_SHARED_LIBRARIES := libnativehelper liblog

include $(BUILD_SHARED_LIBRARY)
