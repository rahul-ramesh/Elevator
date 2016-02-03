/*
 * DriveSpeedCanPayloadTranslator.java
 * 18-649 Distributed Embedded Systems
 * Group 11
 * Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
 */
// !@

/**
 * @author Daniel Santoro // ddsantor
 * @datelastmodified 2015-10-06
 */
package simulator.elevatorcontrol;

import java.util.BitSet;
import simulator.framework.Direction;
import simulator.framework.Speed;
import simulator.payloads.CanMailbox.ReadableCanMailbox;
import simulator.payloads.CanMailbox.WriteableCanMailbox;
import simulator.payloads.translators.CanPayloadTranslator;

/**
 * Can payload translator for the drive command, which includes a speed value and a direction.
 * 
 * See the documentation for DesiredFloorCanPayloadTranslator for more discussion
 * on CanPayloadTranslators in general.
 * 
 * @author Justin Ray
 */
public class DriveSpeedCanPayloadTranslator extends CanPayloadTranslator {
    private byte SHORT_STOP = 0;
    private byte SHORT_UP = 1;
    private byte SHORT_DOWN = 2;

    public DriveSpeedCanPayloadTranslator(WriteableCanMailbox p) {
        super(p, 3, MessageDictionary.DRIVE_SPEED_CAN_ID);
    }
    
    public DriveSpeedCanPayloadTranslator(ReadableCanMailbox p) {
        super(p, 3, MessageDictionary.DRIVE_SPEED_CAN_ID);
    }

    /**
     * This method is required for setting values by reflection in the
     * MessageInjector.  The order of parameters in .mf files should match the
     * signature of this method.
     * All translators must have a set() method with the signature that contains
     * all the parameter values.
     *
     * @param speed
     * @param dir
     */
    public void set(int speed, Direction dir) {
        setSpeed(speed);
        setDirection(dir);
    }
    
    public void setSpeed(int speed) {
        BitSet b = getMessagePayload();
        addIntToBitset(b, (short)speed, 0, 16);
        setMessagePayload(b, getByteSize());
    }

    public int getSpeed() {
        return getIntFromBitset(getMessagePayload(), 0, 16);
    }

    public void setDirection(Direction dir) {
        byte short_dir;
        if(dir == Direction.STOP) {
            short_dir = SHORT_STOP;
        } else if(dir == Direction.UP) {
            short_dir = SHORT_UP;
        } else if(dir == Direction.DOWN) {
            short_dir = SHORT_DOWN;
        } else {
            throw new RuntimeException("Direction " + dir + " was not recognized.");
        }
        BitSet b = getMessagePayload();
        addIntToBitset(b, short_dir, 16, 8);
        setMessagePayload(b, getByteSize());
    }

    public Direction getDirection() {
        int val = getIntFromBitset(getMessagePayload(), 16, 8);
        if(val == (int)SHORT_STOP) {
            return Direction.STOP;
        } else if (val == (int)SHORT_UP) {
            return Direction.UP;
        } else if (val == (int)SHORT_DOWN) {
            return Direction.DOWN;
        }
        throw new RuntimeException("Unrecognized Direction Value " + val);
    }

    @Override
    public String payloadToString() {
        return "DriveSpeed:  speed=" + getSpeed() + " direction=" + getDirection();
    }
}
