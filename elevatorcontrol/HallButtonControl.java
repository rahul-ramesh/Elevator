/*
 * HallButtonControl.java
 * 18-649 Distributed Embedded Systems
 * Group 11
 * Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
 */
// !@

/**
 * @author Daniel Santoro // ddsantor
 * @datelastmodified 2015-11-11
 */
package simulator.elevatorcontrol;

import jSimPack.SimTime;
import simulator.elevatormodules.AtFloorCanPayloadTranslator;
import simulator.framework.Controller;
import simulator.framework.Direction;
import simulator.framework.Hallway;
import simulator.framework.ReplicationComputer;
import simulator.framework.Side;
import simulator.payloads.CanMailbox;
import simulator.payloads.CanMailbox.ReadableCanMailbox;
import simulator.payloads.CanMailbox.WriteableCanMailbox;
import simulator.payloads.HallCallPayload;
import simulator.payloads.HallCallPayload.ReadableHallCallPayload;
import simulator.payloads.HallLightPayload;
import simulator.payloads.HallLightPayload.WriteableHallLightPayload;
import simulator.elevatorcontrol.DesiredFloorCanPayloadTranslator;
import simulator.elevatorcontrol.HallCallCanPayloadTranslator;
import simulator.elevatorcontrol.Utility.DoorClosedArray;

public class HallButtonControl extends Controller {
    
    /* PHYSICAL INTERFACE */
    // local physical state
    private ReadableHallCallPayload localHallCall;

    // physical output interface variables
    private WriteableHallLightPayload localHallLight;
    
    /* NETWORK INTERFACE */
    // send mHallCall
    private WriteableCanMailbox networkHallCall;
    private HallCallCanPayloadTranslator mHallCall;
    
    // receive mAtFloor
	private ReadableCanMailbox networkAtFloor;
	private AtFloorCanPayloadTranslator mAtFloor;
	
    // recieve mDoorClosed
    private DoorClosedArray mFrontDoorClosedArray;
    private DoorClosedArray mBackDoorClosedArray;

    // recieve mDesiredFloor
    private ReadableCanMailbox networkDesiredFloor;
    private DesiredFloorCanPayloadTranslator mDesiredFloor;

    //enumerate states
    private enum State {
        STATE_OFF,
        STATE_PRESSED,
		STATE_CALLED,
    }
    
     // Start in state 'OFF'
    private State state = State.STATE_OFF; 
    
    // duplicate variables 
    private Hallway hallway;
    private Direction direction;
    private int floor;
    
    // state variables
	private int desiredFloor;
	private Hallway desiredHallway;
	private Direction desiredDirection;
    private boolean thisIsDesired;
    private boolean areDoorsClosed;

    // configuration variables
    private SimTime period;

    // Constructor
    public HallButtonControl(int floor, Hallway hallway, Direction direction, SimTime period, boolean verbose) {
        super("HallButtonControl" + ReplicationComputer.makeReplicationString(floor, hallway, direction), verbose);
        
        this.period = period;
        this.hallway = hallway;
        this.floor = floor;
        this.direction = direction;

        log("Created HallButtonControl ", ReplicationComputer.makeReplicationString(floor, hallway, direction), " with period = ", period);
    	
    	/* PHYSICAL INTERFACE */
        // HALL CALL
        localHallCall = HallCallPayload.getReadablePayload(floor, hallway, direction);
        physicalInterface.registerTimeTriggered(localHallCall);
        
        // HALL LIGHT
        localHallLight = HallLightPayload.getWriteablePayload(floor, hallway, direction);
        physicalInterface.sendTimeTriggered(localHallLight, period);
        
        /* NETWORK INTERFACE */

        // mHallCall (sent)
        networkHallCall = CanMailbox.getWriteableCanMailbox(MessageDictionary.HALL_CALL_BASE_CAN_ID + ReplicationComputer.computeReplicationId(floor, hallway, direction));
        mHallCall = new HallCallCanPayloadTranslator(networkHallCall, floor, hallway, direction);
        canInterface.sendTimeTriggered(networkHallCall, period);
        
    	// mAtFloor 
    	networkAtFloor = CanMailbox.getReadableCanMailbox(MessageDictionary.AT_FLOOR_BASE_CAN_ID + ReplicationComputer.computeReplicationId(floor, hallway));
        mAtFloor = new AtFloorCanPayloadTranslator(networkAtFloor, floor, hallway);
        canInterface.registerTimeTriggered(networkAtFloor);
        
        // mDesiredFloor
        networkDesiredFloor = CanMailbox.getReadableCanMailbox(MessageDictionary.DESIRED_FLOOR_CAN_ID);
        mDesiredFloor = new DesiredFloorCanPayloadTranslator(networkDesiredFloor);
        canInterface.registerTimeTriggered(networkDesiredFloor);
        
        // DOOR CLOSED SENSORS - mDoorClosed
        mFrontDoorClosedArray = new DoorClosedArray(Hallway.FRONT, canInterface);
        mBackDoorClosedArray = new DoorClosedArray(Hallway.BACK, canInterface);

        // start timer
        timer.start(period);
    }

    @Override
    public void timerExpired(Object callbackData) {
        State newState = state;

        // get information from mDesiredFloor
        desiredFloor = mDesiredFloor.getFloor();
        desiredHallway = mDesiredFloor.getHallway();
        desiredDirection = mDesiredFloor.getDirection();
        
        // determine if this is the desired HallButtonControl
        if((desiredFloor == this.floor) && 
          ((desiredHallway == this.hallway) || (desiredHallway == Hallway.BOTH)) && 
          ((desiredDirection == this.direction) || (desiredDirection == Direction.STOP))) {
            thisIsDesired = true;
        } else {
            thisIsDesired = false;
        }
        
        // compute doors closed state variable
        if(mFrontDoorClosedArray.getBothClosed() && mBackDoorClosedArray.getBothClosed()) {
            areDoorsClosed = true;
        } else {
            areDoorsClosed = false;
        }
        
        switch(state) {
            //#state 'OFF'
            case STATE_OFF:
                // state actions for 'OFF'
                localHallLight.set(false);
                mHallCall.set(false);
                
                // next state logic
                //#transition 'PT1'
                if (localHallCall.pressed()) {
                    newState = State.STATE_PRESSED;
                    log("Button pressed:", floor, hallway, direction);
                } 
                // implicit else: stay in this state
                break;
    
            //#state 'PRESSED'
            case STATE_PRESSED:
                // state actions for 'PRESSED'
                localHallLight.set(true);
                mHallCall.set(false);
                
                // next state logic
                //#transition 'PT3'
                if (!localHallCall.pressed()) {
                    newState = State.STATE_CALLED;
                } 
                // implicit else: stay in this state
                break;
				
            //#state 'CALLED'
            case STATE_CALLED:
                // state actions for 'CALLED'
                localHallLight.set(true);
                mHallCall.set(true);
                
                // next state logic
                //#transition 'PT2'
                if (mAtFloor.getValue() && !areDoorsClosed && thisIsDesired) {
                    newState = State.STATE_OFF;
                } 
                // implicit else: stay in this state
                break;
            default:
                throw new RuntimeException("State " + state + " was not recognized.");
        }
        
        if (state == newState) {
            log("remains in state: ",state);
        } else {
            log("Transition:",state,"->",newState);
        }

        state = newState;

        //report the current state
        setState(STATE_KEY,newState.toString());
        
        timer.start(MessageDictionary.HALL_BUTTON_CONTROL_PERIOD);
    }
}
