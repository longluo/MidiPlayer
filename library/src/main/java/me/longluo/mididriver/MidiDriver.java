package me.longluo.mididriver;

/**
 * MidiDriver class
 */
public class MidiDriver {
    /**
     * Midi start listener
     */
    private OnMidiStartListener listener;

    /**
     * Instance
     */
    private static MidiDriver instance;

    /**
     * Class constructor
     */
    private MidiDriver() {
    }

    /**
     * Get instance
     */
    public static MidiDriver getInstance() {
        if (instance == null)
            instance = new MidiDriver();

        return instance;
    }

    /**
     * Get instance
     */
    public static MidiDriver getInstance(OnMidiStartListener l) {
        MidiDriver instance = getInstance();
        instance.listener = l;
        return instance;
    }

    /**
     * Start midi driver
     */
    public void start() {
        if (!init())
            return;

        // Call listener

        if (listener != null)
            listener.onMidiStart();
    }

    /**
     * Queue midi event or events
     *
     * @param byte array of midi events
     */
    public void queueEvent(byte[] event) {
        write(event);
    }

    /**
     * Stop midi driver
     */
    public void stop() {
        shutdown();
    }

    /**
     * Set midi driver start listener
     *
     * @param OnMidiStartListener
     */
    public void setOnMidiStartListener(OnMidiStartListener l) {
        listener = l;
    }

    /**
     * Midi start listener interface
     */
    public interface OnMidiStartListener {
        void onMidiStart();
    }

    // Native midi methods

    /**
     * Initialise native code
     *
     * @return true for success
     */
    private native boolean init();

    /**
     * Returm part of EAS config
     *
     * @return Int array of part of EAS config
     * config[0] = pLibConfig->maxVoices;
     * config[1] = pLibConfig->numChannels;
     * config[2] = pLibConfig->sampleRate;
     * config[3] = pLibConfig->mixBufferSize;
     */
    public native int[] config();

    /**
     * Write midi event or events
     *
     * @param byte array of midi events
     */
    public native boolean write(byte a[]);

    /**
     * Set master volume
     *
     * @param volume master volume for EAS synthesizer (between 0 and 100)
     * @return true for success
     */
    public native boolean setVolume(int volume);

    /**
     * Set EAS module parameter
     *
     * @param preset reverb preset to use (value from ReverbConstants)
     * @return true for success
     */
    public native boolean setReverb(int preset);

    /**
     * Shut down native code
     *
     * @return true for success
     */
    private native boolean shutdown();

    // Load midi library
    static {
        System.loadLibrary("midi");
    }
}
