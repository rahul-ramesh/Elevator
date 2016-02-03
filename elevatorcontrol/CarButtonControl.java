/*
 * CarButtonControl.java
 * 18-649 Distributed Embedded Systems
 * Group 11
 * Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
 */
// !@

/**
 * @author Jialiang Tan // jialiant
 * @datelastmodified 2015-10-06
 */

package simulator.elevatorcontrol;

import jSimPack.SimTime;
import simulator.elevatormodules.AtFloorCanPayloadTranslator;
import simulator.framework.Controller;
import simulator.framework.Hallway;
import simulator.framework.ReplicationComputer;
import simulator.framework.Side;
import simulator.payloads.CanMailbox;
import simulator.payloads.CanMailbox.ReadableCanMailbox;
import simulator.payloads.CanMailbox.WriteableCanMailbox;
import simulator.payloads.CarCallPayload;
import simulator.payloads.CarCallPayload.ReadableCarCallPayload;
import simulator.payloads.CarLightPayload;
import simulator.payloads.CarLightPayload.WriteableCarLightPayload;
import simulator.elevatorcontrol.CarCallCanPayloadTranslator;
import simulator.elevatorcontrol.Utility.DoorClosedArray;

public class CarButtonControl extends Controller {
    
    /* PHYSICAL INTERFACE */
	// physical input interface variables
	private ReadableCarCallPayload localCarCall;
	
    // physical output interface variables
	private WriteableCarLightPayload localCarLight;

    /* NETWORK INTERFACE */
    // sent mCarCall
	private WriteableCanMailbox networkCarCall;
	private CarCallCanPayloadTranslator mCarCall;
	
	// receive mAtFloor
	private ReadableCanMailbox networkAtFloor;
	private AtFloorCanPayloadTranslator mAtFloor;

    // recieve mDesiredFloor
	private ReadableCanMailbox networkDesiredFloor;
	private DesiredFloorCanPayloadTranslator mDesiredFloor;
	
    // recieve mDoorClosed
    private DoorClosedArray mFrontDoorClosedArray;
    private DoorClosedArray mBackDoorClosedArray;

    // ennumerate states
    private enum State {
        STATE_OFF,
        STATE_PRESSED,
		STATE_CALLED,
    }
    
    // start in 'OFF'
    private State state = State.STATE_OFF;

	// duplicate vairables 
	private final Hallway hallway;
	private final int floor;

	// state variables
	private int desiredFloor;
	private Hallway desiredHallway;
	private boolean areDoorsClosed;
	private boolean thisIsDesired;

	// configuration variables
	private SimTime period;
	
    public CarButtonControl(int floor, Hallway hallway, SimTime period, boolean verbose) {
        super("CarButtonControl" + ReplicationComputer.makeReplicationString(floor, hallway), verbose);
        
        this.period = period;
        this.hallway = hallway;
        this.floor = floor;

        log("Created CarButtonControl ", ReplicationComputer.makeReplicationString(floor, hallway), " with period = ", period);
    	
        /* PHYSICAL INTERFACE */
    	// CAR CALL
    	localCarCall = CarCallPayload.getReadablePayload(floor, hallway);
    	physicalInterface.registerTimeTriggered(localCarCall);
    	
    	// CAR LIGHT
        localCarLight = CarLightPayload.getWriteablePayload(floor, hallway);
        physicalInterface.sendTimeTriggered(localCarLight, period);

        /* NETWORK INTERFACE */

        // mCarCall (sent)
        networkCarCall = CanMailbox.getWriteableCanMailbox(MessageDictionary.CAR_CALL_BASE_CAN_ID + ReplicationComputer.computeReplicationId(floor, hallway));
        mCarCall = new CarCallCanPayloadTranslator(networkCarCall, floor, hallway);
        canInterface.sendTimeTriggered(networkCarCall, period);
        
    	// mAtFloor
    	networkAtFloor = CanMailbox.getReadableCanMailbox(MessageDictionary.AT_FLOOR_BASE_CAN_ID + ReplicationComputer.computeReplicationId(floor, hallway));
        mAtFloor = new AtFloorCanPayloadTranslator(networkAtFloor, floor, hallway);
        canInterface.registerTimeTriggered(networkAtFloor);

        // mDesiredFloor
        networkDesiredFloor = CanMailbox.getReadableCanMailbox(MessageDictionary.DESIRED_FLOOR_CAN_ID);
        mDesiredFloor = new DesiredFloorCanPayloadTranslator(networkDesiredFloor);
        canInterface.registerTimeTriggered(networkDesiredFloor);

        // mDoorClosed
        mFrontDoorClosedArray = new DoorClosedArray(Hallway.FRONT, canInterface);
        mBackDoorClosedArray = new DoorClosedArray(Hallway.BACK, canInterface);
        
        // let the timer run!!
        timer.start(period);
    }

	@Override
	public void timerExpired(Object callbackData) {
		State newState = state;

        // get information from desiredFloor
	    desiredFloor = mDesiredFloor.getFloor();
	    desiredHallway = mDesiredFloor.getHallway();        
        
        log("desiredFloor ", desiredFloor);
        log("desiredHallway ", desiredHallway);

        // determine if this is the desired floor
	    if((desiredFloor == this.floor) && ((desiredHallway == this.hallway) || (desiredHallway == Hallway.BOTH))) {
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
				localCarLight.set(false);
				mCarCall.set(false);
				
				// next state logic
                //#transition 'PT1'
    			if (localCarCall.isPressed()) {
    				newState = State.STATE_PRESSED;
    			} 
    			// implicit else - stay in this state
    			break;
            //#state 'PRESSED'
    		case STATE_PRESSED:
    		    // state actions for 'PRESSED'
    			localCarLight.set(true);
				mCarCall.set(false);
				
				log("AtFloor ", mAtFloor.getValue());
				log("AreDoorsClosed ", areDoorsClosed);
				log("thisIsDesired ", thisIsDesired);
				// next state logic
                //#transition 'PT3'
    			if (!localCarCall.isPressed()) {
    				newState = State.STATE_CALLED;
    			} 
    			// implicit else - stay in this state
    			break;
            //#state 'CALLED'
    		case STATE_CALLED:
    		    // state actions for 'CALLED'
    			localCarLight.set(true);
				mCarCall.set(true);
				
				log("AtFloor ", mAtFloor.getValue());
				log("AreDoorsClosed ", areDoorsClosed);
				log("thisIsDesired ", thisIsDesired);
				// next state logic
                //#transition 'PT2'
    			if (mAtFloor.getValue() && !areDoorsClosed && thisIsDesired) {
    				newState = State.STATE_OFF;
    			} 
    			// implicit else - stay in this state
    			break;
    		default:
                throw new RuntimeException("State " + state + " was not recognized.");
    	}
    	
    /*	if (state == newState) {
            log("remains in state: ",state);
        } else {
            log("Transition:",state,"->",newState);
        }*/
        if(state != newState) {
            log("Transition:",state,"->",newState);
        }

        state = newState;

        //report the current state
        setState(STATE_KEY,newState.toString());
        
    	timer.start(period);
	}
}