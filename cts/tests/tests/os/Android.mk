# Copyright (C) 2008 The Android Open Source Project
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

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

# don't include this package in any target
LOCAL_MODULE_TAGS := optional
# and when built explicitly put it in the data partition
LOCAL_MODULE_PATH := $(TARGET_OUT_DATA_APPS)

LOCAL_JAVA_LIBRARIES := android.test.runner

ifneq ($(TARGET_SIMULATOR),true)
LOCAL_JNI_SHARED_LIBRARIES := libbuildtest
LOCAL_SRC_FILES := $(call all-java-files-under, src)
else
LOCAL_SRC_FILES := $(filter-out %BuildTest.java,$(call all-java-files-under, src))
endif

LOCAL_PACKAGE_NAME := CtsOsTestCases

LOCAL_INSTRUMENTATION_FOR := CtsTestStubs

# uncomment when dalvik.annotation.Test* are removed or part of SDK
#LOCAL_SDK_VERSION := current

include $(BUILD_PACKAGE)

ifneq ($(TARGET_SIMULATOR),true)
# Include the associated library's makefile.
include $(LOCAL_PATH)/libbuildtest/Android.mk
endif
