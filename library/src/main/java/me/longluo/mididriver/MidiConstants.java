package me.longluo.mididriver;

/**
 * Midi event type constants
 */
public class MidiConstants {
    public static final byte MIDI_TIME_CODE = (byte) 0xF1;
    public static final byte SONG_POSITION_POBYTEER = (byte) 0xF2;
    public static final byte SONG_SELECT = (byte) 0xF3;
    public static final byte TUNE_REQUEST = (byte) 0xF6;
    public static final byte END_OF_EXCLUSIVE = (byte) 0xF7;
    public static final byte TIMING_CLOCK = (byte) 0xF8;
    public static final byte START = (byte) 0xFA;
    public static final byte CONTINUE = (byte) 0xFB;
    public static final byte STOP = (byte) 0xFC;
    public static final byte ACTIVE_SENSING = (byte) 0xFE;
    public static final byte SYSTEM_RESET = (byte) 0xFF;
    public static final byte NOTE_OFF = (byte) 0x80;
    public static final byte NOTE_ON = (byte) 0x90;
    public static final byte POLY_PRESSURE = (byte) 0xA0;
    public static final byte CONTROL_CHANGE = (byte) 0xB0;
    public static final byte PROGRAM_CHANGE = (byte) 0xC0;
    public static final byte CHANNEL_PRESSURE = (byte) 0xD0;
    public static final byte PITCH_BEND = (byte) 0xE0;
}
