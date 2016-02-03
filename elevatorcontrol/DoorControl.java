/*
 * DoorControl.java
 * 18-649 Distributed Embedded Systems
 * Group 11
 * Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
 */
// !@

/**
 * @author David Thompson // davidtho
 * @datelastmodified 2015-12-13
 */

package simulator.elevatorcontrol;

import jSimPack.SimTime;
import simulator.elevatorcontrol.Utility;
import simulator.elevatorcontrol.Utility.DoorMotorCommand;
import simulator.elevatormodules.DoorClosedCanPayloadTranslator;
import simulator.elevatormodules.DoorOpenedCanPayloadTranslator;
import simulator.elevatormodules.CarWeightCanPayloadTranslator;
import simulator.framework.Controller;
import simulator.framework.Direction;
import simulator.framework.Hallway;
import simulator.framework.ReplicationComputer;
import simulator.framework.Side;
import simulator.framework.Speed;
import simulator.framework.DoorCommand;
import simulator.payloads.CanMailbox;
import simulator.payloads.CanMailbox.ReadableCanMailbox;
import simulator.payloads.CanMailbox.WriteableCanMailbox;
import simulator.payloads.DrivePayload;
import simulator.payloads.DrivePayload.ReadableDrivePayload;
import simulator.payloads.DrivePayload.WriteableDrivePayload;
import simulator.payloads.DriveSpeedPayload;
import simulator.payloads.DriveSpeedPayload.ReadableDriveSpeedPayload;
import simulator.payloads.DriveSpeedPayload.WriteableDriveSpeedPayload;
import simulator.payloads.DoorMotorPayload;
import simulator.payloads.DoorMotorPayload.ReadableDoorMotorPayload;
import simulator.payloads.DoorMotorPayload.WriteableDoorMotorPayload;
import simulator.payloads.translators.CanPayloadTranslator;
import simulator.elevatorcontrol.DesiredFloorCanPayloadTranslator;
import simulator.elevatorcontrol.DoorMotorCommandCanPayloadTranslator;
import simulator.elevatorcontrol.DriveSpeedCanPayloadTranslator;
import simulator.elevatorcontrol.Utility.AtFloorArray;
import simulator.elevatorcontrol.Utility.CarCallArray;
import simulator.elevatorcontrol.Utility.HallCallArray;
import simulator.elevatormodules.DoorReversalCanPayloadTranslator;



/**
 * Door Controller.
 *
 * @author David Thompson
 */
public class DoorControl extends Controller {

    /***************************************************************************
     * Declarations
     **************************************************************************/
    //note that inputs are Readable objects, while outputs are Writeable objects

    /* PHYSICAL INTERFACE */
    //local physical state
    private DoorMotorPayload.WriteableDoorMotorPayload localDoor;
    
    /* NETWORK INTERFACES */
    // Send door motor message
    private WriteableCanMailbox networkDoorMotor;
    private DoorMotorCommandCanPayloadTranslator mDoorMotor;

    // AT FLOOR SENSOR
    private AtFloorArray mAtFloorArray;
	
    // DOOR CLOSED SENSORS
    private ReadableCanMailbox networkDoorClosed;
    private DoorClosedCanPayloadTranslator mDoorClosed;

    // DOOR OPENED SENSORS
    private ReadableCanMailbox networkDoorOpened;
    private DoorOpenedCanPayloadTranslator mDoorOpened;

    // DRIVE SPEED
    private ReadableCanMailbox networkDriveSpeed;
    private DriveSpeedCanPayloadTranslator mDriveSpeed;

    // DESIRED FLOOR
    private ReadableCanMailbox networkDesiredFloor;
    private DesiredFloorCanPayloadTranslator mDesiredFloor;

    // CAR WEIGHT
    private ReadableCanMailbox networkCarWeight;
    private CarWeightCanPayloadTranslator mCarWeight;
	
	// DOOR REVERSAL
    private ReadableCanMailbox networkDoorReversalLeft;
    private DoorReversalCanPayloadTranslator mDoorReversalLeft;	
	
    private ReadableCanMailbox networkDoorReversalRight;
    private DoorReversalCanPayloadTranslator mDoorReversalRight;	
    
	// HALL CALL
    private HallCallArray mHallCallArray;
	
	// CAR CALL
    private CarCallArray mCarCallArray;
	
    //store the period for the controller
    private SimTime period;
    

    /* ADDITIONAL INTERNAL STATE VARIABLES */
    private SimTime countDown = SimTime.ZERO;

    //enumerate states
    private enum State {
        STATE_CLOSED,
        STATE_OPEN,
        STATE_OPENED_COUNTDOWN,
		STATE_CLOSE,
        STATE_NUDGE,
        STATE_OVERWEIGHT,
		STATE_OVERWEIGHT_OPENED,
		STATE_REVERSAL,
		STATE_REOPEN,
    }

	private static final int NONE = 0;

    //state variable initialized to the initial state STATE_WAIT
    private State state = State.STATE_CLOSED;
    private int currentFloor = 1;
    private int desiredFloor = 1;
	private Hallway desiredHallway;
	private Direction desiredDirection;
    private Hallway hallway;
    private Hallway currentHallway = Hallway.NONE;
    private Side mySide;
    private boolean doorOpened = false;
    private boolean doorClosed = true;
	private int driveSpeed;
	private Direction driveDirection;
	private int carWeight;
	private SimTime dwell = new SimTime((double) 5, SimTime.SimTimeUnit.SECOND);;
	
	private boolean alreadyReversed = false;
	
	private boolean hallCallUpHere;
	private boolean hallCallDownHere;
	private boolean carCallHere;
	private boolean doorReversal;
	
    /**
     * The arguments listed in the .cf configuration file should match the order and
     * type given here.
     *
     * For your elevator controllers, you should make sure that the constructor matches
     * the method signatures in ControllerBuilder.makeAll().
     */
    public DoorControl(Hallway hallway, Side side, SimTime period, boolean verbose) {
        //call to the Controller superclass constructor is required
        super("DoorControl_"+hallway.toString()+"_"+side.toString(), verbose);
        this.period = period;
        this.hallway = hallway;
        mySide = side;
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
        log("Created DoorControl with period = ", period);

        /* PHYSICAL INTERFACE */
        // DOOR ACTUATOR
        localDoor= DoorMotorPayload.getWriteablePayload(hallway, side);
        physicalInterface.sendTimeTriggered(localDoor, period);

		// DOOR MOTOR COMMAND MESSAGE - mDoorMotor* (sent)
        networkDoorMotor = CanMailbox.getWriteableCanMailbox(MessageDictionary.DOOR_MOTOR_COMMAND_BASE_CAN_ID + ReplicationComputer.computeReplicationId(hallway, side));
        mDoorMotor = new DoorMotorCommandCanPayloadTranslator(networkDoorMotor, hallway, side);
        canInterface.sendTimeTriggered(networkDoorMotor, period);

        // AT FLOOR SENSOR - mAtFloor
        mAtFloorArray = new AtFloorArray(canInterface);

        // DOOR CLOSED SENSORS - mDoorClosed
        networkDoorClosed = CanMailbox.getReadableCanMailbox(MessageDictionary.DOOR_CLOSED_SENSOR_BASE_CAN_ID + ReplicationComputer.computeReplicationId(hallway, side));
        mDoorClosed = new DoorClosedCanPayloadTranslator(networkDoorClosed, hallway, side);
        canInterface.registerTimeTriggered(networkDoorClosed);

        // DOOR OPENED SENSORS - mDoorOpened
        networkDoorOpened = CanMailbox.getReadableCanMailbox(MessageDictionary.DOOR_OPEN_SENSOR_BASE_CAN_ID + ReplicationComputer.computeReplicationId(hallway, side));
        mDoorOpened = new DoorOpenedCanPayloadTranslator(networkDoorOpened, hallway, side);
        canInterface.registerTimeTriggered(networkDoorOpened);

        // DESIRED FLOOR - mDesiredFloor
        networkDesiredFloor = CanMailbox.getReadableCanMailbox(MessageDictionary.DESIRED_FLOOR_CAN_ID);
        mDesiredFloor = new DesiredFloorCanPayloadTranslator(networkDesiredFloor);
        canInterface.registerTimeTriggered(networkDesiredFloor);

        // DRIVE SPEED - mDriveSpeed
        networkDriveSpeed = CanMailbox.getReadableCanMailbox(MessageDictionary.DRIVE_SPEED_CAN_ID);
        mDriveSpeed = new DriveSpeedCanPayloadTranslator(networkDriveSpeed);
        canInterface.registerTimeTriggered(networkDriveSpeed);

        // CAR WEIGHT - mCarWeight
        networkCarWeight = CanMailbox.getReadableCanMailbox(MessageDictionary.CAR_WEIGHT_CAN_ID);
        mCarWeight = new CarWeightCanPayloadTranslator(networkCarWeight);
        canInterface.registerTimeTriggered(networkCarWeight);
		
		// DOOR REVERSAL
		networkDoorReversalLeft = CanMailbox.getReadableCanMailbox(MessageDictionary.DOOR_REVERSAL_SENSOR_BASE_CAN_ID + ReplicationComputer.computeReplicationId(hallway, Side.LEFT));
		mDoorReversalLeft = new DoorReversalCanPayloadTranslator(networkDoorReversalLeft, hallway, Side.LEFT);
		canInterface.registerTimeTriggered(networkDoorReversalLeft);

		networkDoorReversalRight = CanMailbox.getReadableCanMailbox(MessageDictionary.DOOR_REVERSAL_SENSOR_BASE_CAN_ID + ReplicationComputer.computeReplicationId(hallway, Side.RIGHT));
		mDoorReversalRight = new DoorReversalCanPayloadTranslator(networkDoorReversalRight, hallway, Side.RIGHT);
		canInterface.registerTimeTriggered(networkDoorReversalRight);

		// HALL CALL
        mHallCallArray = new HallCallArray(canInterface);
        
        // CAR CALL
        mCarCallArray = new CarCallArray(canInterface);
        
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

        // Set current floor & hallway, hall call, and car call state variables
        //  NOTE: All this logic should go in it's own function
		currentHallway=Hallway.NONE;
		currentFloor = NONE;
		hallCallUpHere = false;
		hallCallDownHere = false;
		carCallHere = false;
		
		// Set current floor variable to the last seen atFloor true value
        if(mAtFloorArray.getCurrentFloor() != MessageDictionary.NONE){
            currentFloor = mAtFloorArray.getCurrentFloor();
            currentHallway = mAtFloorArray.getCurrentHallway();
            hallCallUpHere = mHallCallArray.isHallCall(currentFloor, currentHallway, Direction.UP);
            hallCallDownHere = mHallCallArray.isHallCall(currentFloor, currentHallway, Direction.DOWN);
            carCallHere = mCarCallArray.isCarCall(currentFloor, currentHallway);
        }
	   
		//log("currentHallway is: ", currentHallway);
		//log("currentFloor is: ", currentFloor);

        // Set desired floor state variable
        desiredFloor=mDesiredFloor.getFloor();
        desiredHallway = mDesiredFloor.getHallway();
        if (desiredHallway == Hallway.BOTH) {
            desiredHallway = hallway;
        }
        //log("DesiredHallway: ",desiredHallway);
		desiredDirection = mDesiredFloor.getDirection();


		// Set doorReversal state variable
		doorReversal = mDoorReversalLeft.getValue() || mDoorReversalRight.getValue();
		
		// Get weight state variable
		carWeight = mCarWeight.getWeight();
        // compute doors closed state variable
		doorClosed=mDoorClosed.getValue();
        // compute doors opened state variable
        doorOpened = mDoorOpened.getValue();
		
        // get current speed/direction
		driveSpeed = mDriveSpeed.getSpeed();
		driveDirection = mDriveSpeed.getDirection();
		//log("driveDirection is: ", driveDirection);

        switch (state) {
            //#state 'CLOSED'
            case STATE_CLOSED:
                //if(hallway == Hallway.Front) System.out.println(hallway + " " + mySide + " STATE_CLOSED");
                //state actions for 'CLOSED'
				localDoor.set(DoorCommand.STOP);
				mDoorMotor.set(DoorMotorCommand.STOP);
				alreadyReversed = false;
                //#transition 'PT1'
				if(currentFloor!= NONE && desiredFloor==currentFloor && desiredHallway==hallway && ((driveDirection==Direction.STOP)||(driveSpeed==0))){
					newState=State.STATE_OPEN;
				}
                // implicit else: stay in this state
                break;
            //#state 'OPEN'
            case STATE_OPEN:
                //if(hallway == Hallway.Front) System.out.println(hallway + " " + mySide + " STATE_OPEN");
                //state actions for 'OPEN'
				localDoor.set(DoorCommand.OPEN);
				mDoorMotor.set(DoorMotorCommand.OPEN);
				countDown = dwell;
				//#transition 'PT2'
				if(doorOpened){
					newState=State.STATE_OPENED_COUNTDOWN;
				}
                // implicit else: stay in this state
                break;
            //#state 'OPENED_COUNTDOWN'
            case STATE_OPENED_COUNTDOWN:
                //if(hallway == Hallway.Front) System.out.println(hallway + " " + mySide + " STATE_OPENED_COUNTDOWN");

                //state actions for 'OPENED_COUNTDOWN'
				localDoor.set(DoorCommand.STOP);
				mDoorMotor.set(DoorMotorCommand.STOP);
                countDown = SimTime.subtract(countDown, period);
                log("countDown:", countDown);
				//#transition 'PT9'
				if(carWeight>=Utility.MAX_WEIGHT){
					newState = State.STATE_OVERWEIGHT;
                //#transition 'PT3'
				}else if(countDown.isNegative()){
					newState = State.STATE_CLOSE;
				}
                // implicit else: stay in this state
                break;
            //#state 'CLOSE'
            case STATE_CLOSE:
                //if(hallway == Hallway.Front) System.out.println(hallway + " " + mySide + " STATE_CLOSE");

                //state actions for 'CLOSE'
				localDoor.set(DoorCommand.CLOSE);
				mDoorMotor.set(DoorMotorCommand.CLOSE);
				countDown = dwell;
                //#transition 'PT4'
				if(doorClosed){
					newState = State.STATE_CLOSED;
				//#transition 'PT8'
				}else if(carWeight>=Utility.MAX_WEIGHT){
					newState = State.STATE_OVERWEIGHT;
				//#transition 'PT10'
				}else if(doorReversal && (!alreadyReversed)){
					newState = State.STATE_REVERSAL;
				//#transition 'PT12'
				}else if(doorReversal && alreadyReversed){
					newState = State.STATE_NUDGE;
				}
                //#transition 'PT5'					
				else if(desiredFloor==currentFloor && desiredHallway==hallway){
					newState = State.STATE_OPEN;
				}
                // implicit else: stay in this state
                break;
            //#state 'NUDGE'
            case STATE_NUDGE:
                //if(hallway == Hallway.Front) System.out.println(hallway + " " + mySide + " STATE_NUDGE");

                //state actions for 'NUDGE'
				localDoor.set(DoorCommand.NUDGE);
				mDoorMotor.set(DoorMotorCommand.NUDGE);
				countDown = dwell;
				//#transition 'PT13'
				if(carWeight>=Utility.MAX_WEIGHT){
					newState = State.STATE_OVERWEIGHT;
                //#transition 'PT15'
				}else if (!doorReversal){
					newState = State.STATE_CLOSE;
				//#transition 'PT14'
				}else if(doorClosed){
					newState = State.STATE_CLOSED;
				}
                // implicit else: stay in this state
                break;
            //#state 'OVERWEIGHT'
            case STATE_OVERWEIGHT:
                //if(hallway == Hallway.Front) System.out.println(hallway + " " + mySide + " STATE_OVERWEIGHT");
                //state actions for 'OVERWEIGHT'
				localDoor.set(DoorCommand.OPEN);
				mDoorMotor.set(DoorMotorCommand.OPEN);
				countDown = dwell;
                //#transition 'PT6'
				if(doorOpened){
					newState = State.STATE_OVERWEIGHT_OPENED;
				}
                // implicit else: stay in this state
                break;
            //#state 'OVERWEIGHT_OPENED'
            case STATE_OVERWEIGHT_OPENED:
                //if(hallway == Hallway.Front) System.out.println(hallway + " " + mySide + " STATE_OVERWEIGHT_OPENED");

                //state actions for 'OVERWEIGHT_OPENED'
				localDoor.set(DoorCommand.STOP);
				mDoorMotor.set(DoorMotorCommand.STOP);
                countDown = dwell;
                //#transition 'PT7'
				if(carWeight < Utility.MAX_WEIGHT){
					newState = State.STATE_OPENED_COUNTDOWN;
				}
                // implicit else: stay in this state
                break;
            //#state 'REVERSAL'
            case STATE_REVERSAL:
                //if(hallway == Hallway.Front) System.out.println(hallway + " " + mySide + " STATE_REVERSAL");

                //state actions for 'REVERSAL'
				localDoor.set(DoorCommand.OPEN);
				mDoorMotor.set(DoorMotorCommand.OPEN);
                countDown = dwell;
				alreadyReversed = true;
                //#transition 'PT11'
				if(doorOpened){
					newState = State.STATE_OPENED_COUNTDOWN;
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
        timer.start(MessageDictionary.DOOR_CONTROL_PERIOD);
    }
}
