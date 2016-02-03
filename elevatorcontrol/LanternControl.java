/*
 * LanternControl.java
 * 18-649 Distributed Embedded Systems
 * Group 11
 * Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
 */
// !@

/**
 * @author David Thompson // davidtho
 * @datelastmodified 2015-10-19
 */

package simulator.elevatorcontrol;

import jSimPack.SimTime;
import simulator.framework.Controller;
import simulator.framework.Direction;
import simulator.framework.Hallway;
import simulator.framework.ReplicationComputer;
import simulator.framework.Side;
import simulator.framework.Speed;
import simulator.payloads.CanMailbox;
import simulator.payloads.CanMailbox.ReadableCanMailbox;
import simulator.payloads.CanMailbox.WriteableCanMailbox;
import simulator.payloads.DriveSpeedPayload;
import simulator.payloads.DriveSpeedPayload.ReadableDriveSpeedPayload;
import simulator.payloads.DriveSpeedPayload.WriteableDriveSpeedPayload;
import simulator.payloads.CarLanternPayload;
import simulator.payloads.CarLanternPayload.ReadableCarLanternPayload;
import simulator.payloads.CarLanternPayload.WriteableCarLanternPayload;
import simulator.payloads.translators.CanPayloadTranslator;
import simulator.elevatorcontrol.DesiredFloorCanPayloadTranslator;
import simulator.elevatorcontrol.Utility.DoorClosedArray;
import simulator.elevatorcontrol.Utility.AtFloorArray;
import simulator.elevatorcontrol.Utility.Floor;


/**
 * Lantern Controller
 *
 * @author David Thompson
 */
public class LanternControl extends Controller {

    /***************************************************************************
     * Declarations
     **************************************************************************/
    //note that inputs are Readable objects, while outputs are Writeable objects

    /* PHYSICAL INTERFACE */
    //local physical state
    private CarLanternPayload.WriteableCarLanternPayload localLantern;
    
    /* NETWORK INTERFACES */

    // DOOR CLOSED SENSORS
    private DoorClosedArray mFrontDoorClosedArray;
    private DoorClosedArray mBackDoorClosedArray;

    // DESIRED FLOOR
    private ReadableCanMailbox networkDesiredFloor;
    private DesiredFloorCanPayloadTranslator mDesiredFloor;

    // AT FLOOR SENSOR
    private AtFloorArray mAtFloorArray;

    //store the period for the controller
    private SimTime period;
    

    /* ADDITIONAL INTERNAL STATE VARIABLES */
    private Direction direction;

    //enumerate states
    private enum State {
        STATE_DOORS_CLOSED,
        STATE_LANTERN_ON,
    }

    //state variable initialized to the initial state STATE_INIT
    private State state = State.STATE_DOORS_CLOSED;
	private boolean doorsClosed;
	private Direction desiredDirection = Direction.STOP;
    /**
     * The arguments listed in the .cf configuration file should match the order and
     * type given here.
     *
     * For your elevator controllers, you should make sure that the constructor matches
     * the method signatures in ControllerBuilder.makeAll().
     */
    public LanternControl(Direction direction, SimTime period, boolean verbose) {
        //call to the Controller superclass constructor is required
        super("LanternControl_"+direction.toString(), verbose);
        this.period = period;
        this.direction = direction;
        /* 
         * The log() method is inherited from the Controller class.  It takes an
         * array of objects which will be converted to strings and concatenated
         * only if the log message is actually written.  
         * 
         * For performance reasons, call with comma-separated lists, e.g.:
         *   log("object=",object);
         * Do NOT call with concatenated objects like:
         *   log("object=" + object);
         */
        log("Created LanternControl with period = ", period);

        /* PHYSICAL INTERFACE */
        // LANTERN ACTUATOR
        localLantern= CarLanternPayload.getWriteablePayload(direction);
        physicalInterface.sendTimeTriggered(localLantern, period);

        // DOOR CLOSED SENSORS - mDoorClosed
        mFrontDoorClosedArray = new DoorClosedArray(Hallway.FRONT, canInterface);
        mBackDoorClosedArray = new DoorClosedArray(Hallway.BACK, canInterface);

        // DESIRED FLOOR - mDesiredFloor
        networkDesiredFloor = CanMailbox.getReadableCanMailbox(MessageDictionary.DESIRED_FLOOR_CAN_ID);
        mDesiredFloor = new DesiredFloorCanPayloadTranslator(networkDesiredFloor);
        canInterface.registerTimeTriggered(networkDesiredFloor);

        // AT FLOOR SENSOR - mAtFloor
        mAtFloorArray = new AtFloorArray(canInterface);

        /* issuing the timer start method with no callback data means a NULL value 
         * will be passed to the callback later.  Use the callback data to distinguish
         * callbacks from multiple calls to timer.start() (e.g. if you have multiple
         * timers.
         */
        timer.start(period);
    }

    /*
     * The timer callback is where the main controller code is executed.  For time
     * triggered design, this consists mainly of a switch block with a case blcok for
     * each state.  Each case block executes actions for that state, then executes
     * a transition to the next state if the transition conditions are met.
     */
    public void timerExpired(Object callbackData) {
        State newState = state;

        // Set desired direction state variable
        desiredDirection=mDesiredFloor.getDirection();

        // compute doors closed state variable
       // compute doors closed state variable
        if(mFrontDoorClosedArray.getBothClosed() && mBackDoorClosedArray.getBothClosed()) {
            doorsClosed = true;
        } else {
            doorsClosed = false;
        }
        
        switch (state) {
            //#state 'DOORS_CLOSED'
            case STATE_DOORS_CLOSED:
                //state actions for 'DOORS_CLOSED'
                localLantern.set(false);

                //#transition 'PT1'
				if((!doorsClosed) && (desiredDirection == direction)){
					newState=State.STATE_LANTERN_ON;
				}
                // implicit else: stay in this state
                break;
            //#state 'LANTERN_ON'
            case STATE_LANTERN_ON:
                //state actions for 'LANTERN_ON'
                localLantern.set(true);

                //#transition 'PT2'
				if(doorsClosed || (desiredDirection != direction)) {
					newState=State.STATE_DOORS_CLOSED;
				}
                // implicit else: stay in this state
                break;
            default:
                throw new RuntimeException("State " + state + " was not recognized.");
        }

        //log the results of this iteration
        if (state == newState) {
            log("remains in state: ",state);
        } else {
            log("Transition:",state,"->",newState);
        }

        //update the state variable
        state = newState;

        //report the current state
        setState(STATE_KEY,newState.toString());

        //schedule the next iteration of the controller
        //you must do this at the end of the timer callback in order to restart
        //the timer
        timer.start(MessageDictionary.LANTERN_CONTROL_PERIOD);
    }
}
