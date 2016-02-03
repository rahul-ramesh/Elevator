/*
 * DriveControl.java
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

import jSimPack.SimTime;
import simulator.elevatorcontrol.Utility.DoorMotorCommand;
import simulator.elevatorcontrol.Utility.DriveSpeed;
import simulator.elevatormodules.CarLevelPositionCanPayloadTranslator;
import simulator.elevatormodules.CarWeightCanPayloadTranslator;
import simulator.elevatormodules.SafetySensorCanPayloadTranslator;
import simulator.framework.Controller;
import simulator.framework.Direction;
import simulator.framework.Hallway;
import simulator.framework.ReplicationComputer;
import simulator.framework.Side;
import simulator.framework.Speed;
import simulator.payloads.CanMailbox;
import simulator.payloads.CanMailbox.ReadableCanMailbox;
import simulator.payloads.CanMailbox.WriteableCanMailbox;
import simulator.payloads.DrivePayload;
import simulator.payloads.DrivePayload.ReadableDrivePayload;
import simulator.payloads.DrivePayload.WriteableDrivePayload;
import simulator.payloads.DriveSpeedPayload;
import simulator.payloads.DriveSpeedPayload.ReadableDriveSpeedPayload;
import simulator.payloads.DriveSpeedPayload.WriteableDriveSpeedPayload;
import simulator.payloads.translators.CanPayloadTranslator;
import simulator.elevatorcontrol.DesiredFloorCanPayloadTranslator;
import simulator.elevatorcontrol.DriveSpeedCanPayloadTranslator;
import simulator.elevatorcontrol.Utility.AtFloorArray;
import simulator.elevatorcontrol.Utility.CarCallArray;
import simulator.elevatorcontrol.Utility.DoorClosedArray;
import simulator.elevatorcontrol.Utility.DoorMotorArray;
import simulator.elevatorcontrol.Utility.DriveSpeed;
import simulator.elevatorcontrol.Utility.Floor;
import simulator.elevatorcontrol.Utility.HallCallArray;
import simulator.elevatorcontrol.Utility.HoistwayLimitArray;
import simulator.elevatorcontrol.Utility.LevelArray;
/** 
 * @author Justin Ray
 */
public class DriveControl extends Controller {

    /***************************************************************************
     * Declarations
     **************************************************************************/
    //note that inputs are Readable objects, while outputs are Writeable objects

    /* PHYSICAL INTERFACE */
    //local physical state
    private WriteableDrivePayload localDrive;
    private ReadableDriveSpeedPayload localDriveSpeed;
    
    /* NETWORK INTERFACE */
    // send drive speed
    private WriteableCanMailbox networkDriveSpeedOut;
    private DriveSpeedCanPayloadTranslator mDriveSpeed;

    /* NETWORK INTERFACE */
    // AT FLOOR SENSOR
    private AtFloorArray mAtFloorArray;


    // LEVELING SENSORS
    private LevelArray mLevel;

    // CAR LEVEL SENSOR
    private ReadableCanMailbox networkCarLevelPosition;
    private CarLevelPositionCanPayloadTranslator mCarLevelPosition;

    // DOOR CLOSED SENSORS
    private DoorClosedArray mFrontDoorClosedArray;
    private DoorClosedArray mBackDoorClosedArray;

    // DOOR MOTOR MESSAGE
    private DoorMotorArray mFrontDoorMotorArray;
    private DoorMotorArray mBackDoorMotorArray;

    // EMERGENCY BRAKE
    private ReadableCanMailbox networkEmergencyBrake;
    private SafetySensorCanPayloadTranslator mEmergencyBrake;

    // DESIRED FLOOR
    private ReadableCanMailbox networkDesiredFloor;
    private DesiredFloorCanPayloadTranslator mDesiredFloor;

    // HOISTWAY LIMIT
    private HoistwayLimitArray mHoistwayLimitArray;

    // CAR WEIGHT
    private ReadableCanMailbox networkCarWeight;
    private CarWeightCanPayloadTranslator mCarWeight;
    
    //store the period for the controller
    private SimTime period;
    
    //additional internal state variables
    private SimTime counter = SimTime.ZERO;

    //enumerate states
    private enum State {
        STATE_STOP,
        STATE_SLOW_UP,
        STATE_FAST_UP,
        STATE_DECEL_UP,
        STATE_SLOW_DOWN,
        STATE_FAST_DOWN,
        STATE_DECEL_DOWN,
        STATE_LEVEL,
    }

    //state variable initialized to the initial state STATE_WAIT
    private State state = State.STATE_STOP;
    private int currentFloor;
    private int desiredFloor;
    private int currentPosition;
    private Direction desiredDirection;
    private Direction levelDirection;
    private int currentSpeed;
    private Direction currentDirection;

    private boolean areDoorsClosed;
    private boolean doorMotorOpening;
    private boolean doorMotorStopped;
    private boolean eBrakeEngaged;
    private boolean isAtFloor;
    private boolean isOverweight; 
    private boolean eStop;
    
    /**
     * The arguments listed in the .cf configuration file should match the order and
     * type given here.
     *
     * For your elevator controllers, you should make sure that the constructor matches
     * the method signatures in ControllerBuilder.makeAll().
     */
    public DriveControl(SimTime period, boolean verbose) {
        //call to the Controller superclass constructor is required
        super("DriveControl", verbose);
        this.period = period;
        
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
        log("Created DriveControl with period = ", period);

        /* PHYSICAL INTERFACE */
        // DRIVE ACTUATOR
        localDrive = DrivePayload.getWriteablePayload();
        physicalInterface.sendTimeTriggered(localDrive, period);

        // DRIVE SPEED SENSOR
        localDriveSpeed = DriveSpeedPayload.getReadablePayload();
        physicalInterface.registerTimeTriggered(localDriveSpeed);

        /* CAN BUS INTERFACE */

        // DRIVE SPEED - mDriveSpeed (sent)
        networkDriveSpeedOut = CanMailbox.getWriteableCanMailbox(MessageDictionary.DRIVE_SPEED_CAN_ID);
        mDriveSpeed = new DriveSpeedCanPayloadTranslator(networkDriveSpeedOut);
        canInterface.sendTimeTriggered(networkDriveSpeedOut, period);

        // AT FLOOR SENSOR - mAtFloor
        mAtFloorArray = new AtFloorArray(canInterface);

        // LEVELING SENSORS - mLevel
        mLevel = new LevelArray(canInterface);

        // CAR LEVEL POSITION SENSOR - mCarLevelPosition
        networkCarLevelPosition = CanMailbox.getReadableCanMailbox(MessageDictionary.CAR_LEVEL_POSITION_CAN_ID);
        mCarLevelPosition = new CarLevelPositionCanPayloadTranslator(networkCarLevelPosition);
        canInterface.registerTimeTriggered(networkCarLevelPosition);

        // DOOR CLOSED SENSORS - mDoorClosed
        mFrontDoorClosedArray = new DoorClosedArray(Hallway.FRONT, canInterface);
        mBackDoorClosedArray = new DoorClosedArray(Hallway.BACK, canInterface);

        mFrontDoorMotorArray = new DoorMotorArray(Hallway.FRONT, canInterface);
        mBackDoorMotorArray = new DoorMotorArray(Hallway.BACK, canInterface);

        // EMERGENCY BRAKE - mEmergencyBrake
        networkEmergencyBrake = CanMailbox.getReadableCanMailbox(MessageDictionary.EMERGENCY_BRAKE_CAN_ID);
        mEmergencyBrake = new SafetySensorCanPayloadTranslator(networkEmergencyBrake);
        canInterface.registerTimeTriggered(networkEmergencyBrake);

        // DESIRED FLOOR - mDesiredFloor
        networkDesiredFloor = CanMailbox.getReadableCanMailbox(MessageDictionary.DESIRED_FLOOR_CAN_ID);
        mDesiredFloor = new DesiredFloorCanPayloadTranslator(networkDesiredFloor);
        canInterface.registerTimeTriggered(networkDesiredFloor);

        // HOISTWAY LIMIT - mHoistwayLimit
        mHoistwayLimitArray = new HoistwayLimitArray(canInterface);

        // CAR WEIGHT - mCarWeight
        networkCarWeight = CanMailbox.getReadableCanMailbox(MessageDictionary.CAR_WEIGHT_CAN_ID);
        mCarWeight = new CarWeightCanPayloadTranslator(networkCarWeight);
        canInterface.registerTimeTriggered(networkCarWeight);

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
        boolean commitPoint, decel;


        log("");
        log("DRIVE CONTROL TIMER EXPIRED - EXECUTE");
        
        // compute doors closed state variable
        if(mFrontDoorClosedArray.getBothClosed() && mBackDoorClosedArray.getBothClosed()) {
            areDoorsClosed = true;
        } else {
            areDoorsClosed = false;
        }   
    
        // compute doorMotorOpening state variable
        if(mFrontDoorMotorArray.isOpening() || mBackDoorMotorArray.isOpening()) {
            doorMotorOpening = true;
        } else {
            doorMotorOpening = false;
        }
        
        // compute doorMotorStopped state variable
        if(mFrontDoorMotorArray.isStopped() && mBackDoorMotorArray.isStopped()) {
            doorMotorStopped = true;
        } else {
            doorMotorStopped = false;
        }
        
        // compute eBrakeEngaged state variable
        eBrakeEngaged = mEmergencyBrake.getValue();
        
        // compute isOverweight state variable
        if(mCarWeight.getWeight() > Utility.MAX_WEIGHT) {
            isOverweight = true;
        } else {
            isOverweight = false;
        }
        
        // compute eStop state variable
        eStop = (!areDoorsClosed || doorMotorOpening || eBrakeEngaged || isOverweight);
        
        // compute currentFloor and isAtFloor state variable
        if(mAtFloorArray.getCurrentFloor() != MessageDictionary.NONE){
            currentFloor = mAtFloorArray.getCurrentFloor();
            isAtFloor = true;
        } else { 
            isAtFloor = false;
        }      

        // Set desired floor state variable
        desiredFloor = mDesiredFloor.getFloor();

        // set leveling state variable
        levelDirection = mLevel.getLevelDirection();

        // set desired direction state variable
        if(Floor.isValidFloor(desiredFloor)) {
            if(currentFloor == desiredFloor) {
                desiredDirection = Direction.STOP;
            } else if(currentFloor < desiredFloor) {
                desiredDirection = Direction.UP;
            } else if(currentFloor > desiredFloor) {
                desiredDirection = Direction.DOWN;
            }     
        } else {
            desiredDirection = Direction.STOP;
        }
        
        ////System.out.println("Current floor " + currentFloor);
        ////System.out.println("Desired floor " + desiredFloor);
        ////System.out.println("Desired direction: " + desiredDirection.toString());

        // get current speed/direction/position
        currentSpeed = (int)(localDriveSpeed.speed()*DriveSpeed.SPEED_CONV);
        currentDirection = localDriveSpeed.direction();
        currentPosition = mCarLevelPosition.getPosition();
        commitPoint = Floor.startDecel(desiredFloor, currentSpeed, currentPosition, currentDirection);

        log("currentFloor ", currentFloor);
        log("desiredFloor ", desiredFloor);
        log("desiredDirection ", desiredDirection);
        log("currentPosition ", currentPosition);
        log("currentSpeed ", currentSpeed);
        log("commit point ", commitPoint);
        log("delta ", Floor.stoppingDistance(currentSpeed));
        log("floorDist ", Floor.floorDistance(desiredFloor, currentPosition, currentDirection));

        switch (state) {
            //#state 'STOP'
            case STATE_STOP:
                //System.out.println("STATE_STOP");
                //state actions for 'STOP'
                localDrive.set(Speed.STOP, Direction.STOP);
                mDriveSpeed.set(currentSpeed, currentDirection);
                
                // next state logic 
                //#transition 'PT1'
                if(areDoorsClosed && (currentSpeed == DriveSpeed.STOP) && doorMotorStopped && (desiredDirection == Direction.DOWN) && !eStop) {
                    newState = State.STATE_SLOW_DOWN;
                } 
                //#transition 'PT2'
                else if (areDoorsClosed && (currentSpeed == DriveSpeed.STOP) && doorMotorStopped && (desiredDirection == Direction.UP) && !eStop) {
                    newState = State.STATE_SLOW_UP;
                } 
                //#transition 'PT11'
                else if (isAtFloor && (currentSpeed == DriveSpeed.STOP) && (levelDirection != Direction.STOP) && !eBrakeEngaged){
                    newState = State.STATE_LEVEL;
                }
                // implicit else: stay in this state
                break;
            //#state 'SLOW_UP'
            case STATE_SLOW_UP:
                //System.out.println("SLOW_UP");
                //state actions for 'SLOW_UP'
                localDrive.set(Speed.SLOW, Direction.UP);
                mDriveSpeed.set(currentSpeed, currentDirection);

                // next state logic 
                //#transition 'PT20'
                if(eStop && (currentSpeed <= DriveSpeed.SLOW)) {
                    newState = State.STATE_STOP;
                }
                //#transition 'PT4'
                else if((desiredDirection == Direction.STOP) && (currentSpeed <= DriveSpeed.SLOW)) {
                    newState = State.STATE_STOP;
                }
                //#transition 'PT6'
                else if (!commitPoint && (currentSpeed >= DriveSpeed.SLOW) && !eStop) {
                    newState = State.STATE_FAST_UP;
                }
                // implicit else: stay in this state 
                break;
            //#state 'FAST_UP'
            case STATE_FAST_UP:
                //System.out.println("FAST_UP");
                //state actions for 'FAST_UP'
                localDrive.set(Speed.FAST, Direction.UP);
                mDriveSpeed.set(currentSpeed, currentDirection);
                
                // next state logic 
                //#transition 'PT22'
                if(eStop) {
                    newState = State.STATE_DECEL_UP;
                } 
                //#transition 'PT8'
                else if(commitPoint) {
                    newState = State.STATE_DECEL_UP;
                }
                // implicit else: stay in this state 
                break;
            //#state 'DECEL_UP'
            case STATE_DECEL_UP:
                //System.out.println("DECEL_UP");
                //state actions for 'DECEL_UP'
                localDrive.set(Speed.SLOW, Direction.UP);
                mDriveSpeed.set(currentSpeed, currentDirection);
                
                //#transition 'PT10'
                if(((desiredDirection == Direction.STOP) || eStop) && (currentSpeed <= DriveSpeed.SLOW)) {
                    newState = State.STATE_STOP;
                } 
                // implicit else: stay in this state 
                break;
            //#state 'SLOW_DOWN'
            case STATE_SLOW_DOWN:
                //System.out.println("SLOW_DOWN");
                //state actions for 'SLOW_DOWN'
                localDrive.set(Speed.SLOW, Direction.DOWN);
                mDriveSpeed.set(currentSpeed, currentDirection);
                
                // next state logic 
                //#transition 'PT21'
                if(eStop && (currentSpeed <= DriveSpeed.SLOW)) {
                    newState = State.STATE_STOP;
                } 
                //#transition 'PT3'
                else if((desiredDirection == Direction.STOP) && (currentSpeed <= DriveSpeed.SLOW)) {
                    newState = State.STATE_STOP;
                }
                //#transition 'PT5'
                else if (!commitPoint && (currentSpeed >= DriveSpeed.SLOW) && !eStop) {
                    newState = State.STATE_FAST_DOWN;
                }              
                // implicit else: stay in this state 
                break;  
            //#state 'FAST_DOWN'
            case STATE_FAST_DOWN:
                //System.out.println("FAST_DOWN");
                //state actions for 'FAST_DOWN'
                localDrive.set(Speed.FAST, Direction.DOWN);
                mDriveSpeed.set(currentSpeed, currentDirection);

                // next state logic 
                //#transition 'PT23'
                if(eStop) {
                    newState = State.STATE_DECEL_DOWN;
                } 
                //#transition 'PT7'
               else if(commitPoint) {
                    newState = State.STATE_DECEL_DOWN;
                }           
                // implicit else: stay in this state 
                break;
            //#state 'DECEL_DOWN'
            case STATE_DECEL_DOWN:
                //System.out.println("DECEL_DOWN");
                //state actions for 'DECEL_DOWN'
                localDrive.set(Speed.SLOW, Direction.DOWN);
                mDriveSpeed.set(currentSpeed, currentDirection);
                ////System.out.println(desiredDirection);
                ////System.out.println(currentSpeed);
                
                //#transition 'PT9'
                if(((desiredDirection == Direction.STOP) || eStop) && (currentSpeed <= DriveSpeed.SLOW)) {
                    newState = State.STATE_STOP;
                } 
                // implicit else: stay in this state 
                break;
            //#state 'LEVEL'
            case STATE_LEVEL:
                //System.out.println("LEVEL");
                //state actions for 'LEVEL'
                // send network messages
                localDrive.set(Speed.LEVEL, levelDirection);
                mDriveSpeed.set(currentSpeed, currentDirection);

                // next state logic 
                //#transition 'PT24'
                if(eBrakeEngaged) {
                    newState = State.STATE_STOP;
                }
                //#transition 'PT12'
                else if(levelDirection == Direction.STOP) {
                    newState = State.STATE_STOP;
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
            ////System.out.println("Transition:" + state.toString() + "->" + newState.toString());
        }

        //update the state variable
        state = newState;

        //report the current state
        setState(STATE_KEY,newState.toString());

        //schedule the next iteration of the controller
        //you must do this at the end of the timer callback in order to restart
        //the timer
        timer.start(period);
    }
}
