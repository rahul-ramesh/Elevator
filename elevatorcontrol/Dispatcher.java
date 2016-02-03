/*
 * Dispatcher.java
 * 18-649 Distributed Embedded Systems
 * Group 11
 * Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
 */
// !@

/**
 * @author Daniel Santoro // ddsantor
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
import simulator.payloads.translators.CanPayloadTranslator;
import simulator.elevatormodules.CarLevelPositionCanPayloadTranslator;
import simulator.elevatorcontrol.DesiredFloorCanPayloadTranslator;
import simulator.elevatorcontrol.DriveSpeedCanPayloadTranslator;
import simulator.elevatorcontrol.Utility;
import simulator.elevatorcontrol.Utility.AtFloorArray;
import simulator.elevatorcontrol.Utility.CarCallArray;
import simulator.elevatorcontrol.Utility.DoorClosedArray;
import simulator.elevatorcontrol.Utility.DoorMotorArray;
import simulator.elevatorcontrol.Utility.Floor;
import simulator.elevatorcontrol.Utility.HallCallArray;

public class Dispatcher extends Controller {

    /***************************************************************************
     * Declarations
     **************************************************************************/
    //note that inputs are Readable objects, while outputs are Writeable objects

    /* PHYSICAL INTERFACE */
    
    /* NETWORK INTERFACE */
    // send DESIRED FLOOR
    private WriteableCanMailbox networkDesiredFloor;
    private DesiredFloorCanPayloadTranslator mDesiredFloor;

    /* NETWORK INTERFACE */
    // AT FLOOR SENSOR
    private AtFloorArray mAtFloorArray;
    
    private DoorMotorArray mFrontDoorMotor;
    private DoorMotorArray mBackDoorMotor;

    // DOOR CLOSED SENSORS
    private DoorClosedArray mFrontDoorClosedArray;
    private DoorClosedArray mBackDoorClosedArray;
    
    // CAR CALL SENSORS
    private CarCallArray mCarCallArray;
    
    // Hall Call Array 
    private HallCallArray mHallCallArray;
    
    // CAR LEVEL POS
	private ReadableCanMailbox networkCarLevelPos;
	private CarLevelPositionCanPayloadTranslator mCarLevelPos;
	
    // DRIVE SPEED
	private ReadableCanMailbox networkDriveSpeed;
	private DriveSpeedCanPayloadTranslator mDriveSpeed;
    
    //store the period for the controller
    private SimTime period;
    
    //additional internal state variables
    private SimTime counter = SimTime.ZERO;

    //enumerate states
    private enum State {
        STATE_SAFETY,
        STATE_STOP,
        STATE_MOVE_ALL,
        STATE_MOVE_HALL_CALL,
        STATE_FLOOR_SERVICED,
        STATE_FLOOR_RESERVICED,
    }

    //state variable initialized to the initial state STATE_WAIT
    private State state = State.STATE_SAFETY;
    
    // desired state variables
    private int targetF = Floor.INVALID_FLOOR;
    private Hallway targetB = Hallway.NONE;
    private Direction desiredDirection = Direction.STOP;

    // current variables
    private int currentFloor = 1;
    private int lastAtFloor = 1;
    private Hallway currentHallway = Hallway.NONE;
    private Hallway doorsNotClosedHallway = Hallway.NONE;
    private boolean isAtFloor;
    private boolean areDoorsClosed;
    private boolean callAtCurrentFloor;
    private int numFloors;
    private Direction driveDirection;
    private int currentSpeed;
    private int currentPosition;
    private Direction currentDirection;


    public Dispatcher(int numFloors, SimTime period, boolean verbose) {
        //call to the Controller superclass constructor is required
        super("Dispatcher", verbose);
        this.period = period;
        this.numFloors = numFloors;
        
        
        log("Created Dispatcher with period = ", period);

        /* CAN BUS INTERFACE */
        // DESIRED FLOOR - mDesiredFloor
        networkDesiredFloor = CanMailbox.getWriteableCanMailbox(MessageDictionary.DESIRED_FLOOR_CAN_ID);
        mDesiredFloor = new DesiredFloorCanPayloadTranslator(networkDesiredFloor);
        canInterface.sendTimeTriggered(networkDesiredFloor, period);

        // AT FLOOR SENSOR - mAtFloor
        mAtFloorArray = new AtFloorArray(canInterface);
        

        // DOOR CLOSED SENSORS - mDoorClosed
        mFrontDoorClosedArray = new DoorClosedArray(Hallway.FRONT, canInterface);
        mBackDoorClosedArray = new DoorClosedArray(Hallway.BACK, canInterface);
        
        // CAR CALL SENSOR - mCarCall
        mCarCallArray = new CarCallArray(canInterface);
        
        // HALL CALL SENSOE - mHallCall
        mHallCallArray = new HallCallArray(canInterface);
        
        // Car level Pos
        networkCarLevelPos = CanMailbox.getReadableCanMailbox(MessageDictionary.CAR_LEVEL_POSITION_CAN_ID);
        mCarLevelPos = new CarLevelPositionCanPayloadTranslator(networkCarLevelPos);
        canInterface.registerTimeTriggered(networkCarLevelPos);
        
        // DRIVE SPEED
        networkDriveSpeed = CanMailbox.getReadableCanMailbox(MessageDictionary.DRIVE_SPEED_CAN_ID);
        mDriveSpeed = new DriveSpeedCanPayloadTranslator(networkDriveSpeed);
        canInterface.registerTimeTriggered(networkDriveSpeed);
        
        mFrontDoorMotor = new DoorMotorArray(Hallway.FRONT, canInterface);
        mBackDoorMotor = new DoorMotorArray(Hallway.BACK, canInterface);
        
        /* issuing the timer start method with no callback data means a NULL value 
         * will be passed to the callback later.  Use the callback data to distinguish
         * callbacks from multiple calls to timer.start() (e.g. if you have multiple
         * timers.
         */
        timer.start(period);
    }
    
    private boolean isCallAt(int f) {
        return (mCarCallArray.isCarCall(f) || mHallCallArray.isHallCall(f));
    }
    
    private boolean isCallAt(int f, Hallway h, Direction d) {
        return (mCarCallArray.isCarCall(f, h) || mHallCallArray.isHallCall(f,h,d));
    }
    
    /** 
     * isCallInDir -
     * Determine if there is a valid call in direction d from floor f
     * 
     * @param f     integer floor from which to start the search
     * @param d     direction to search
     * @returns     boolean reflecting the existence of a call in direction d
     */
    private boolean isCallInDir(int f, Direction d) {
        if(Floor.isValidFloor(f) && (d == Direction.UP) && (f != Floor.LAST_FLOOR)) {
            return (mCarCallArray.isCarCallInDir(f, Direction.UP) || 
                    mHallCallArray.isHallCallInDir(f, Direction.UP, Direction.UP));
            } else if(Floor.isValidFloor(f) && (d == Direction.DOWN) && (f != Floor.FIRST_FLOOR)) {
            return (mCarCallArray.isCarCallInDir(f, Direction.DOWN) || 
                    mHallCallArray.isHallCallInDir(f, Direction.DOWN, Direction.DOWN));
        } 
        return false;
    }
    
    /** 
     * isCallBetween
     * Determine if there is a valid call between floor start and floor end.
     * 
     * @param start integer floor from which to start the search
     * @param end   integer floor to end the search
     * @returns     boolean reflecting the existence of a valid call between
     *                  floor start and floor end
     */
    private boolean isCallBetween(int start, int end) {
        return (mCarCallArray.isCarCallBetween(start, end) || mHallCallArray.isHallCallBetween(start, end));
    }
    
    /**
     * firstCallInDir -
     * Returns the first floor in direction d from start that has either a
     * hall call or a car call. If there is no call in direction d, return 0.
     * 
     * @param start integer floor to start search at
     * @param d     direction of search
     * @returns     integer floor of next valid call
     */
    private int firstCallInDir(int start, Direction d) {
        // initialization
        int fCarCall = 0;
        int fHallCall = 0;
        int distCarCall = 0;
        int distHallCall = 0;
        boolean carCallValid = false;
        boolean hallCallValid = false;
        boolean carCallCloser = false;
        boolean hallCallCloser = false;

        // observe any servicable car calls
        if(mCarCallArray.isCarCallInDir(start, d)) {
            fCarCall = mCarCallArray.firstCarCallInDir(start, d);
            carCallValid = true;
        }
        // observe any servicable hall calls
        if(mHallCallArray.isHallCallInDir(start, d, d)) {
            fHallCall = mHallCallArray.firstHallCallInDir(start, d, d);
            hallCallValid = true;
        }
        
        // Return the closest valid call
        if(carCallValid && hallCallValid){
            //Figure out which one is closer
            distCarCall = start - fCarCall;
            if (distCarCall < 0){
                distCarCall = -distCarCall;
            }
            distHallCall = start - fHallCall;
            if (distHallCall < 0){
                distHallCall = -distHallCall;
            }
            if (distHallCall <= distCarCall){
                return fHallCall;
            }
            return fCarCall;
        }else if(hallCallValid){
            return fHallCall;
        }else if(carCallValid){
            return fCarCall;
        }
        return 0;
    }
        
    
    /**
     * firstCallBetween
     * Returns the first floor between floor start and floor end in direction d
     * that has a valid car call or hall call. If there is no valid call 
     * between start and end, return 0. 
     * NOTE: start floor and end floor are not included in search.
     * 
     * @param start integer floor to start search
     * @param end   integer floor to end search
     * @param d     direction of travel. Only hall calls in this direction will 
     *                  be considered.
     * @returns     integer floor of next valid call
     */
    private int firstCallBetween(int start, int end, Direction d) {
        // initialization
        int fCarCall = 0;
        int fHallCall = 0;
        int distHallCall = 0;
        int distCarCall = 0;
        boolean carCallValid = false;
        boolean hallCallValid = false;
        boolean carCallCloser = false;
        boolean hallCallCloser = false;
        
        // observe any servicable car calls
        if(mCarCallArray.isCarCallBetween(start, end)) {
            fCarCall = mCarCallArray.firstCarCallBetween(start, end);
            carCallValid = true;
        }
        // observe any servicable hall calls
        if(mHallCallArray.isHallCallBetween(start, end, d)) {
            fHallCall = mHallCallArray.firstHallCallBetween(start, end, d);
            hallCallValid = true;
        }

        // Return the closest valid call
        if(carCallValid && hallCallValid){
            //Figure out which one is closer
            distCarCall = start - fCarCall;
            if (distCarCall < 0){
                distCarCall = -distCarCall;
            }
            distHallCall = start - fHallCall;
            if (distHallCall < 0){
                distHallCall = -distHallCall;
            }
            if (distHallCall <= distCarCall){
                return fHallCall;
            }
            return fCarCall;
        }else if(hallCallValid){
            return fHallCall;
        }else if(carCallValid){
            return fCarCall;
        }
        return 0;

    }
    
    /** 
     * setTargetToFloor - 
     * Set target to current floor with desired direction d
     * 
     * @param f     integer floor to which to set targetF
     * @param d     desired direction
     * @returns     boolean reflecting whether or not the floor has been set
     */
    private boolean setTargetToFloor(int f, Direction d) {
        // initialization
        boolean carCall = false;
        boolean hallCall = false;
        Hallway carCallHall = Hallway.NONE;
        Hallway hallCallHall = Hallway.NONE;
        int carCallF = 0;
        int hallCallF = 0;
        
        // determine if there is a car call at floor f
        if(mCarCallArray.isCarCall(f)) {
            carCallF = f;
            carCallHall = mCarCallArray.getCarCallHallway(carCallF);
            carCall = true;
        } 
        // determine if there is a hall call at floor f
        if((f == Floor.LAST_FLOOR) && (mHallCallArray.isHallCall(f))) {
            hallCallF = f;
            hallCallHall = mHallCallArray.getHallCallHallway(hallCallF, Direction.DOWN);
            hallCall = true;
        } else if ((f == Floor.FIRST_FLOOR) && (mHallCallArray.isHallCall(f))) {
            hallCallF = f;
            hallCallHall = mHallCallArray.getHallCallHallway(hallCallF, Direction.UP);
            hallCall = true;
        }
        else if(mHallCallArray.isHallCall(f, d)) {
            hallCallF = f;
            hallCallHall = mHallCallArray.getHallCallHallway(hallCallF, d);
            hallCall = true;
        }
        
        // car call AND hall call
        if(carCall && hallCall) {
            // set floor
            targetF = f;
            
            // set hallway
            if((carCallHall != hallCallHall) || (hallCallHall == Hallway.BOTH) || (carCallHall == Hallway.BOTH)) {
                targetB = Hallway.BOTH; 
            } else {
                // arbitrary: hallCallHall == carCallHall at this point
                targetB = hallCallHall;
            }
            
            // set desired direction
            desiredDirection = d;
            return true;
        } 
        // car call AND NOT hall call
        else if (carCall && !hallCall) {
            // set floor, hallway, desired direction
            targetF = f;
            targetB = carCallHall;
            desiredDirection = d;
            return true;
        } 
        // hall call AND NOT car call
        else if (!carCall && hallCall) {
            // set floor, hall, and desired direction
            targetF = f;
            targetB = hallCallHall;
            desiredDirection = d;
            return true;
        }
        return false;
    }
    
    private Direction setDesiredDirection(Direction currentDirection) {
        if((currentFloor == Floor.LAST_FLOOR) && (currentDirection == Direction.UP)) {
            return Direction.DOWN;
        } else if ((currentFloor == Floor.FIRST_FLOOR) && (currentDirection == Direction.DOWN)) {
            return Direction.UP;
        }
        return currentDirection;
    }

    /*
     * The timer callback is where the main controller code is executed.  For time
     * triggered design, this consists mainly of a switch block with a case blcok for
     * each state.  Each case block executes actions for that state, then executes
     * a transition to the next state if the transition conditions are met.
     */
    public void timerExpired(Object callbackData) {
        State newState = state;
        int temp_target = 0;
        boolean target_set = false;
        boolean callAtCurrentFloorInDir;
        boolean callAtCurrentFloorInDirWhereDoorsNotClosed;

        log("");
        log("DISPATCHER TIMER EXPIRED - EXECUTE");
        
        // Set current floor state variable to the last seen atFloor true value
        if(mAtFloorArray.getCurrentFloor() != MessageDictionary.NONE){
            lastAtFloor = mAtFloorArray.getCurrentFloor();
            isAtFloor = true;
        } else { 
            isAtFloor = false;
        }  
        
        // get current speed/position/direction as read by sensors
        currentSpeed = mDriveSpeed.getSpeed();
        currentPosition = mCarLevelPos.getValue();
        currentDirection = mDriveSpeed.getDirection();

        currentFloor = Floor.commitFloor(currentFloor, currentSpeed, currentPosition, currentDirection, lastAtFloor);
        
        // compute doors closed state variable and hallway for doors not closed state variable
        if(mFrontDoorClosedArray.getBothClosed() && mBackDoorClosedArray.getBothClosed()) {
            areDoorsClosed = true;
            doorsNotClosedHallway = Hallway.NONE;
        } else if(!mFrontDoorClosedArray.getBothClosed() && !mBackDoorClosedArray.getBothClosed()) {
            areDoorsClosed = false;
            doorsNotClosedHallway = Hallway.BOTH;
        } else {
            areDoorsClosed = false;
            if(!mFrontDoorClosedArray.getBothClosed()){
                doorsNotClosedHallway = Hallway.FRONT;
            }else if(!mBackDoorClosedArray.getBothClosed()){
                doorsNotClosedHallway = Hallway.BACK;
            }
        }
        
        
        // compute call at currrent floor state variable
        if(mCarCallArray.isCarCall(currentFloor) || mHallCallArray.isHallCall(currentFloor)) {
            callAtCurrentFloor = true;
        } else {
            callAtCurrentFloor = false;
        }
        
        // compute call at current floor in dir state variable
        if(mCarCallArray.isCarCall(currentFloor) || mHallCallArray.isHallCall(currentFloor, desiredDirection)) {
            callAtCurrentFloorInDir = true;
        } else {
            callAtCurrentFloorInDir = false;
        }
        
        // compute call at current floor in dir at hallway where doors are not closed state variable
        if(mCarCallArray.isCarCall(currentFloor, doorsNotClosedHallway) || mHallCallArray.isHallCall(currentFloor, doorsNotClosedHallway, desiredDirection)) {
            callAtCurrentFloorInDirWhereDoorsNotClosed = true;
        } else {
            callAtCurrentFloorInDirWhereDoorsNotClosed = false;
        } 
        
        
        desiredDirection = setDesiredDirection(desiredDirection);
        
        // log the inputs to this iteration
        log("Current floor: ", currentFloor);
        log("Current hallway: ", currentHallway);
        log("Call at current floor: ", callAtCurrentFloor);
        log("All doors closed: ", areDoorsClosed);
        switch (state) {
            //#state 'SAFETY'
            case STATE_SAFETY:
                // STATE ACTIONS FOR 'SAFETY'
                // send network messages
                mDesiredFloor.set(targetF, targetB, desiredDirection);
                
                // SET TARGET
                targetF = 1;
                targetB = Hallway.NONE;
                desiredDirection = Direction.STOP;
                
                // NEXT STATE LOGIC 
                //#transition 'PT0'
                if(isAtFloor && (currentFloor == targetF) && areDoorsClosed) {
                    newState = State.STATE_STOP;
                }
                // implicit else: stay in this state
                break;
                
            //#state 'STOP'
            case STATE_STOP:
                // STATE ACTIONS FOR 'STOP'
                // send network messages
                mDesiredFloor.set(Floor.INVALID_FLOOR, Hallway.NONE, Direction.STOP);
                
                boolean CURRENT_FLOOR = callAtCurrentFloor;
                boolean ABOVE = false;
                boolean BELOW = false;
                boolean HALL_ABOVE = false;
                boolean HALL_BELOW = false;
                
                // SET NEW TARGET
                //#transition 'STOP/FT0'
                if(mFrontDoorMotor.isStopped() && mBackDoorMotor.isStopped()) {
                    // check current floor
                    //#transition 'STOP/FT2'
                    if(CURRENT_FLOOR) {
                        //#transition 'STOP/FT4'
                        if(mHallCallArray.isHallCall(currentFloor, Direction.UP)) {
                            //#transition 'STOP/FT17'
                            target_set = setTargetToFloor(currentFloor, Direction.UP);
                        }
                        //#transition 'STOP/FT3'
                        //#transition 'STOP/FT4'
                        else if(mHallCallArray.isHallCall(currentFloor, Direction.DOWN)) {
                            //#transition 'STOP/FT18'
                            target_set = setTargetToFloor(currentFloor, Direction.DOWN);
                        }
                        //#transition 'STOP/FT5'
                        //#transition 'STOP/FT8'
                        else if(mCarCallArray.isCarCall(currentFloor)) {
                            if(currentFloor == Floor.LAST_FLOOR) {
                                //#transition 'STOP/FT17'
                                target_set = setTargetToFloor(currentFloor, Direction.DOWN);                            
                            } else {
                                //#transition 'STOP/FT17'
                                target_set = setTargetToFloor(currentFloor, Direction.UP);                            
                            }
    
                        }
                        //#transition 'STOP/FT7'
                        else {
                            throw new RuntimeException("DISPATCHER.JAVA: Dispatcher error in STOP state -> CURRENT_FLOOR");
                        }
                    } 
                    //#transition 'STOP/FT1'
                    else {
                        //CURRENT_FLOOR = false;
                        ABOVE = true;
                    }
                    
                    // check floors above 
                    //#transition 'STOP/FT1'
                    if(ABOVE) {
                        temp_target = firstCallInDir(currentFloor, Direction.UP);
                        //#transition 'STOP/FT10'
                        if(Floor.isValidFloor(temp_target)) {
                            //#transition 'STOP/FT17'
                            target_set = setTargetToFloor(temp_target, Direction.UP);
                        }
                        //#transition 'STOP/FT9'
                        else {
                            ABOVE = false;
                            BELOW = true;
                        }
                    }
                    
                    // check floors below
                    //#transition 'STOP/FT9'
                    if(BELOW) {
                        temp_target = firstCallInDir(currentFloor, Direction.DOWN);
                        //#transition 'STOP/FT12'
                        if(Floor.isValidFloor(temp_target)) {
                            //#transition 'STOP/FT18'
                            target_set = setTargetToFloor(temp_target, Direction.DOWN);
                        }
                        //#transition 'STOP/FT11'
                        else {
                            BELOW = false;
                            HALL_ABOVE = true;
                        }
                    }
                    
                    // check floors above for HallCall Down
                    //#transition 'STOP/FT11'
                    if(HALL_ABOVE) {
                        temp_target = mHallCallArray.firstHallCallBetween(Floor.LAST_FLOOR + 1, currentFloor, Direction.DOWN);
                        //#transition  'STOP/FT14'
                        if(Floor.isValidFloor(temp_target)) {
                            //#transition 'STOP/FT18'
                            target_set = setTargetToFloor(temp_target, Direction.DOWN);
                        }
                        //#transition 'STOP/FT13'
                        else {
                            HALL_ABOVE = false;
                            HALL_BELOW = true;
                        }
                    }
                    
                    // check floors below for HallCall UP
                    //#transition 'STOP/FT13'
                    if(HALL_BELOW) { 
                        temp_target = mHallCallArray.firstHallCallBetween(Floor.FIRST_FLOOR - 1, currentFloor, Direction.UP);
    
                        //#transition  'STOP/FT16'
                        if(Floor.isValidFloor(temp_target)) {
                            //#transition 'STOP/FT17'
                            target_set = setTargetToFloor(temp_target, Direction.UP);
                        }
                        //#transition 'STOP/FT15'
                        else {
                            HALL_BELOW = false;
                        }
                    }
                }
                //#transition 'STOP/FT20'
                //#transition 'STOP/FT15'
                if(!target_set) {
                    targetF = Floor.INVALID_FLOOR;
                    targetB = Hallway.NONE;
                    desiredDirection = Direction.STOP;
                }
                
                // set driveDirection
                driveDirection = Floor.floorDirection(currentFloor, targetF);

                // NEXT STATE LOGIC
                //#transition 'PT20'
                if(!isAtFloor && !areDoorsClosed) {
                    newState = State.STATE_SAFETY;
                }
                //#transition 'PT1'
                else if(Floor.isValidFloor(targetF) && (targetF == currentFloor) && areDoorsClosed) {
                    newState = State.STATE_MOVE_ALL;
                }
                //#transition 'PT2'
                else if(Floor.isValidFloor(targetF) && (targetF != currentFloor) && areDoorsClosed && (desiredDirection == driveDirection)) {
                    newState = State.STATE_MOVE_ALL;
                }
                //#transition 'PT3'
                else if(Floor.isValidFloor(targetF) && (targetF != currentFloor) && areDoorsClosed && (desiredDirection != Direction.STOP) && (desiredDirection != driveDirection)) {
                    newState = State.STATE_MOVE_HALL_CALL;
                }
                // implicit else: stay in this state
                break;
                
            //#state 'MOVE_ALL'
            case STATE_MOVE_ALL:
                // STATE ACTIONS FOR 'MOVE_ALL'
                // send network messages
                mDesiredFloor.set(targetF, targetB, desiredDirection);
                
                // SET NEW DESIRED FLOOR
                //#transition 'MOVE_ALL/FT1'
                if(!isAtFloor) {
                    //#transition 'MOVE_ALL/FT4'
                    if(callAtCurrentFloorInDir) {
                        //#transition 'MOVE_ALL/FT12'
                        target_set = setTargetToFloor(currentFloor, desiredDirection);    
                    }
                    //#transition 'MOVE_ALL/FT3'
                }
                //#transition 'MOVE_ALL/FT2'
                //#transition 'MOVE_ALL/FT3'
                if(!target_set) {
                    temp_target = firstCallBetween(currentFloor, targetF, desiredDirection);
                    //#transition 'MOVE_ALL/FT6'
                    if(Floor.isValidFloor(temp_target)) {
                        //#transition 'MOVE_ALL/FT11'
                        target_set = setTargetToFloor(temp_target, desiredDirection);
                    } 
                    //#transition 'MOVE_ALL/FT5'
                    else {
                        //#transition 'MOVE_ALL/FT13'
                        target_set = setTargetToFloor(targetF, desiredDirection);
                    }
                }
                
                // set driveDirection
                driveDirection = Floor.floorDirection(currentFloor, targetF);

                // NEXT STATE LOGIC
                //#transition 'PT20'
                if(!isAtFloor && !areDoorsClosed) {
                    newState = State.STATE_SAFETY;
                }
                //#transition 'PT5'
                else if(Floor.isValidFloor(targetF) && (targetF == currentFloor) && mAtFloorArray.isAtFloor(targetF, targetB) && !areDoorsClosed && !callAtCurrentFloorInDir) {
                    newState = State.STATE_FLOOR_SERVICED;
                }
                // implicit else: stay in this state
                break;
                
            //#state 'MOVE_HALL_CALL'
            case STATE_MOVE_HALL_CALL:
                // STATE ACTIONS FOR 'MOVE_HALL_CALL'
                // send network messages
                mDesiredFloor.set(targetF, targetB, desiredDirection);
                
                // targetF/targetB/desiredDirection cannot change in this state
                target_set = setTargetToFloor(targetF, desiredDirection);
            
                // set driveDirection
                driveDirection = Floor.floorDirection(currentFloor, targetF);

                // NEXT STATE LOGIC
                //#transition 'PT20'
                if(!isAtFloor && !areDoorsClosed) {
                    newState = State.STATE_SAFETY;
                }    
                //#transition 'PT6'
                else if(Floor.isValidFloor(targetF) && (targetF == currentFloor) && mAtFloorArray.isAtFloor(targetF, targetB) && !areDoorsClosed && !callAtCurrentFloorInDir) {
                    newState = State.STATE_FLOOR_SERVICED;
                }
                // implicit else: stay in this state
                break;
                
            //#state 'FLOOR_SERVICED'
            case STATE_FLOOR_SERVICED:
                // STATE ACTIONS FOR 'FLOOR_SERVICED'
                // send network messages
                mDesiredFloor.set(targetF, targetB, desiredDirection);
                
                //#transition 'FLOOR_SERVICED/FT2'
                if(callAtCurrentFloorInDir) {
                    target_set = setTargetToFloor(currentFloor, desiredDirection);
                }
                //#transition 'FLOOR_SERVICED/FT1'
                else if(isCallInDir(currentFloor, desiredDirection)) {
                    temp_target = firstCallInDir(currentFloor, desiredDirection);

                    //#transition 'FLOOR_SERVICED/FT4'
                    if(Floor.isValidFloor(temp_target)) {
                        target_set = setTargetToFloor(temp_target, desiredDirection);
                    }
                }
                //#transition 'FLOOR_SERVICED/FT3'
                if(!target_set) {
                    targetF = Floor.INVALID_FLOOR;
                    targetB = Hallway.NONE;
                    desiredDirection = desiredDirection;                    
                }
                   
                // set driveDirection
                driveDirection = Floor.floorDirection(currentFloor, targetF);

                // NEXT STATE LOGIC
                //#transition 'PT20'
                if(!isAtFloor && !areDoorsClosed) {
                    newState = State.STATE_SAFETY;
                }
                //#transition 'PT9'
                else if(Floor.isValidFloor(targetF) && (targetF == currentFloor) && callAtCurrentFloorInDir) {
                    newState = State.STATE_FLOOR_RESERVICED;
                }
                //#transition 'PT10'
                else if(Floor.isValidFloor(targetF) && (targetF != currentFloor) && (desiredDirection != Direction.STOP) && areDoorsClosed) {
                    newState = State.STATE_MOVE_ALL;
                }
                //#transition 'PT11'
                else if(!Floor.isValidFloor(targetF) && areDoorsClosed) {
                    newState = State.STATE_STOP;
                }
                break;

            //#state 'FLOOR_RESERVICED'
            case STATE_FLOOR_RESERVICED:
                // STATE ACTIONS FOR 'FLOOR_RESERVICED'
                // send network messages
                mDesiredFloor.set(targetF, targetB, desiredDirection);
                
                //This should be:
                //If no calls at current floor in dir at hallway where there are doors currently open
                if(!callAtCurrentFloorInDirWhereDoorsNotClosed){
                    temp_target = firstCallInDir(currentFloor, desiredDirection);
                    //#transition 'FLOOR_RESERVICED/FT2'
                    if(Floor.isValidFloor(temp_target)) {
                        target_set = setTargetToFloor(temp_target, desiredDirection);    
                    }
                    //#transition 'FLOOR_RESERVICED/FT1'
                    else {
                        targetF = Floor.INVALID_FLOOR;
                        targetB = Hallway.NONE;
                        desiredDirection = desiredDirection;                     
                    }
                }
                // set driveDirection
                driveDirection = Floor.floorDirection(currentFloor, targetF);
   
                // NEXT STATE LOGIC
                //#transition 'PT20'
                if(!isAtFloor && !areDoorsClosed) {
                    newState = State.STATE_SAFETY;
                }
                //#transition 'PT12'
                else if(Floor.isValidFloor(targetF) && (targetF != currentFloor) && (desiredDirection != Direction.STOP) && areDoorsClosed) {
                    newState = State.STATE_MOVE_ALL;
                }
                //#transition 'PT13'
                else if(!Floor.isValidFloor(targetF) && areDoorsClosed) {
                    newState = State.STATE_STOP;
                }
                // implicit else: stay in this state
                break;
        
            default:
                throw new RuntimeException("State " + state + " was not recognized.");
        }

        //log the results of this iteration
        log("targetF: ", targetF);
        log("TargetB: ", targetB);
        log("Desired direction: ", desiredDirection);
        if (state == newState) {
            log("remains in state: ",state);
        } else {
            log("Transition:",state,"->",newState);
        }
        if(state != newState) {
            log("Transition:",state,"->",newState);
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
