/*
 * DoorMotorCommandCanPayloadTranslator.java
 * 18-649 Distributed Embedded Systems
 * Group 11
 * Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
 */
// !@
package simulator.elevatorcontrol;

import java.util.BitSet;
import simulator.framework.Side;
import simulator.framework.Hallway;
import simulator.framework.ReplicationComputer;
import simulator.payloads.CanMailbox.ReadableCanMailbox;
import simulator.payloads.CanMailbox.WriteableCanMailbox;
import simulator.payloads.translators.CanPayloadTranslator;

/**
 * This is an example CAN payload translator for desired floor messages.  It
 * takes three data fields (floor, hall, direction) and packages them into
 * a bit-level representation of the message.
 * 
 * CanPayloadTranslator provides a lot of utility classes.  See the javadoc for
 * that class for more details.
 * 
 * @author Justin Ray
 */
public class DoorMotorCommandCanPayloadTranslator extends CanPayloadTranslator {

    /**
     * Constructor for WriteableCanMailbox.  You should always implement both a 
     * Writeable and Readable constructor so the same translator can be used for
     * both objects
     * @param payload
     */
    public DoorMotorCommandCanPayloadTranslator(WriteableCanMailbox payload, Hallway hallway, Side side) {
        super(payload, 1, MessageDictionary.DOOR_MOTOR_COMMAND_BASE_CAN_ID + ReplicationComputer.computeReplicationId(hallway, side));
    }

    /**
     * Constructor for ReadableCanMailbox.  You should always implement both a 
     * Writeable and Readable constructor so the same translator can be used for
     * both objects
     * @param payload
     */
    public DoorMotorCommandCanPayloadTranslator(ReadableCanMailbox payload, Hallway hallway, Side side) {
        super(payload, 1, MessageDictionary.DOOR_MOTOR_COMMAND_BASE_CAN_ID + ReplicationComputer.computeReplicationId(hallway, side));
    }
    
    /**
     * This method is required for setting values by reflection in the
     * MessageInjector.  The order of parameters in .mf files should match the
     * signature of this method.
     * All translators must have a set() method with the signature that contains
     * all the parameter values.
     *
     * @param floor
     * @param dir
     * @param hallway
     */
    public void set(int command) {
        setValue((byte)command);
    }

    /**
     * Set the floor for mDesiredFloor into the loweest 32 bits of the payload
     * @param floor
     */
    public void setValue(byte command) {
        BitSet b = getMessagePayload();
        addIntToBitset(b, command, 0, 8);
        setMessagePayload(b, getByteSize());
    }

    /**
     *
     * @return the floor value from the can message payload
     */
    public int getValue() {
        return getIntFromBitset(getMessagePayload(), 0, 8);
    }

 
    /**
     * Implement a printing method for the translator.
     * @return human readable version of the payload
     */
    @Override
    public String payloadToString() {
        return "Command = " + getValue();
    }
}
