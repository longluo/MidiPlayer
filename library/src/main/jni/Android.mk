LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES = \
	eas_midi.c \
	lib_src/eas_data.c \
	lib_src/eas_dlssynth.c \
	lib_src/eas_flog.c \
	lib_src/eas_math.c \
	lib_src/eas_mdls.c \
	lib_src/eas_midi.c \
	lib_src/eas_mididata.c \
	lib_src/eas_mixbuf.c \
	lib_src/eas_mixer.c \
	lib_src/eas_pan.c \
	lib_src/eas_pcm.c \
	lib_src/eas_pcmdata.c \
	lib_src/eas_public.c \
	lib_src/eas_reverb.c \
	lib_src/eas_reverbdata.c \
	lib_src/eas_smf.c \
	lib_src/eas_smfdata.c \
	lib_src/eas_voicemgt.c \
	lib_src/eas_wtengine.c \
	lib_src/eas_wtsynth.c \
	lib_src/wt_22khz.c \
	host_src/eas_config.c \
	host_src/eas_hostmm.c \
	host_src/eas_report.c

# not using these modules
#	lib_src/eas_chorus.c \
#	lib_src/eas_chorusdata.c \
#	lib_src/eas_imelody.c \
#	lib_src/eas_imelodydata.c \
#	lib_src/eas_ima_tables.c \
#	lib_src/eas_imaadpcm.c \
#	lib_src/eas_ota.c \
#	lib_src/eas_otadata.c \
#	lib_src/eas_rtttl.c \
#	lib_src/eas_rtttldata.c \
#	lib_src/eas_xmf.c \
#	lib_src/eas_xmfdata.c \
#	host_src/eas_main.c \
#	host_src/eas_wave.c \
#	lib_src/eas_wavefile.c \
#	lib_src/eas_wavefiledata.c \
#	lib_src/jet.c \

LOCAL_CFLAGS += -O2 \
	-D UNIFIED_DEBUG_MESSAGES \
	-D EAS_WT_SYNTH \
	-D NUM_OUTPUT_CHANNELS=2 \
	-D _SAMPLE_RATE_22050 \
	-D MAX_SYNTH_VOICES=64 \
	-D _16_BIT_SAMPLES \
	-D _FILTER_ENABLED \
	-D DLS_SYNTHESIZER \
	-D _REVERB_ENABLED \
	-D false=0 \
	-Wno-unused-parameter \
        -Werror

# not using these options
# -D _IMELODY_PARSER
# -D _RTTTL_PARSER
# -D _OTA_PARSER
# -D _XMF_PARSER
# -D _WAVE_PARSER
# -D _IMA_DECODER (needed for IMA-ADPCM wave files)
# -D _CHORUS_ENABLED

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/host_src \
	$(LOCAL_PATH)/lib_src

LOCAL_ARM_MODE := arm

LOCAL_MODULE := sonivox

ifeq ($(TARGET_ARCH),arm)
LOCAL_SRC_FILES += \
	lib_src/ARM-E_filter_gnu.s \
	lib_src/ARM-E_mastergain_gnu.s

# not using these modules
#	lib_src/ARM-E_interpolate_loop_gnu.s \
#	lib_src/ARM-E_interpolate_noloop_gnu.s \
#	lib_src/ARM-E_voice_gain_gnu.s

LOCAL_ASFLAGS += \
	-xassembler-with-cpp \
	-D SAMPLE_RATE_22050 \
	-D STEREO_OUTPUT \
	-D FILTER_ENABLED \
	-D SAMPLES_16_BIT

LOCAL_CFLAGS += -D NATIVE_EAS_KERNEL
endif

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE    := midi
LOCAL_SRC_FILES := midi.cpp
LOCAL_C_INCLUDES := $(LOCAL_PATH)/host_src
LOCAL_STATIC_LIBRARIES := sonivox
LOCAL_SHARED_LIBRARIES := oboe
LOCAL_LDLIBS := -llog

include $(BUILD_SHARED_LIBRARY)

$(call import-module,prefab/oboe)
