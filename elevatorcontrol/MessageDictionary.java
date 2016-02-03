/*
 * MessageDictionary.java
 * 18-649 Distributed Embedded Systems
 * Group 11
 * Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
 */
// !@
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package simulator.elevatorcontrol;

import jSimPack.SimTime;
import jSimPack.SimTime.SimTimeUnit;

/**
 * This class defines constants for CAN IDs that are used throughout the simulator.
 *
 * The default values will work for early projects.  Later on, you will modify these
 * values when you create a network schedule.
 *
 * @author justinr2
 */
public class MessageDictionary {

    //controller periods
    public final static int NONE = -1;
    public final static SimTime HALL_BUTTON_CONTROL_PERIOD = new SimTime(100, SimTimeUnit.MILLISECOND);
    public final static SimTime CAR_BUTTON_CONTROL_PERIOD = new SimTime(100, SimTimeUnit.MILLISECOND);
    public final static SimTime LANTERN_CONTROL_PERIOD = new SimTime(200, SimTimeUnit.MILLISECOND);
    public final static SimTime CAR_POSITION_CONTROL_PERIOD = new SimTime(50, SimTimeUnit.MILLISECOND);
    public final static SimTime DISPATCHER_PERIOD = new SimTime(50, SimTimeUnit.MILLISECOND);
    public final static SimTime DOOR_CONTROL_PERIOD = new SimTime(10, SimTimeUnit.MILLISECOND);
    public final static SimTime DRIVE_CONTROL_PERIOD = new SimTime(10, SimTimeUnit.MILLISECOND);

    // can Messaged, in order of priority
    public final static int DRIVE_SPEED_CAN_ID =                0x08100000;
    public final static int DOOR_MOTOR_COMMAND_BASE_CAN_ID =    0x08201000;
    public final static int DOOR_REVERSAL_SENSOR_BASE_CAN_ID =  0x08302000;
    public final static int LEVELING_BASE_CAN_ID =              0x08403000;
    public final static int EMERGENCY_BRAKE_CAN_ID =            0x08504000;
    public final static int DESIRED_FLOOR_CAN_ID =              0x08605000;
    public final static int AT_FLOOR_BASE_CAN_ID =              0x08706000;
    public final static int CAR_LEVEL_POSITION_CAN_ID =         0x08807000;
    public final static int DOOR_CLOSED_SENSOR_BASE_CAN_ID =    0x08908000;
    public final static int HALL_CALL_BASE_CAN_ID =             0x08A09000;
    public final static int CAR_CALL_BASE_CAN_ID =              0x08B0A000;
    public final static int CAR_WEIGHT_CAN_ID =                 0x08C0C000;
    public final static int DOOR_OPEN_SENSOR_BASE_CAN_ID =      0x08D0B000;
    public final static int CAR_WEIGHT_ALARM_CAN_ID =           0x08E0C000;
    public final static int HOISTWAY_LIMIT_BASE_CAN_ID =        0x08F0D000;

    // Deleted messages. 
    public final static int DRIVE_COMMAND_CAN_ID =              0x08FF0000;
    public final static int CAR_POSITION_CAN_ID =               0x08FFE000;
    public final static int DESIRED_DWELL_BASE_CAN_ID =         0x08FF5000;
    public final static int CAR_LIGHT_BASE_CAN_ID =             0x08FFA000;
    public final static int HALL_LIGHT_BASE_CAN_ID =            0x08FF9000;
    public final static int CAR_LANTERN_BASE_CAN_ID =           0x08FFF000;
    
}
