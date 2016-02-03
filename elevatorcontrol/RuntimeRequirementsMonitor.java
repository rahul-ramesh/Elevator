/*
 * RuntimeRequirementsMonitor.java
 * 18-649 Distributed Embedded Systems
 * Group 11
 * Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
 */
// !@
package simulator.elevatorcontrol;
import jSimPack.SimTime;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import simulator.framework.Direction;
import simulator.framework.DoorCommand;
import simulator.framework.Hallway;
import simulator.framework.Harness;
import simulator.framework.RuntimeMonitor;
import simulator.framework.Side;
import simulator.payloads.AtFloorPayload.ReadableAtFloorPayload;
import simulator.payloads.CarCallPayload.ReadableCarCallPayload;
import simulator.payloads.CarLanternPayload.ReadableCarLanternPayload;
import simulator.payloads.CarLightPayload.ReadableCarLightPayload;
import simulator.payloads.DoorClosedPayload.ReadableDoorClosedPayload;
import simulator.payloads.DoorMotorPayload.ReadableDoorMotorPayload;
import simulator.payloads.DoorOpenPayload.ReadableDoorOpenPayload;
import simulator.payloads.CarLevelPositionPayload.ReadableCarLevelPositionPayload;
import simulator.payloads.DoorReversalPayload.ReadableDoorReversalPayload;
import simulator.payloads.HallCallPayload.ReadableHallCallPayload;
import simulator.payloads.HallLightPayload.ReadableHallLightPayload;
import simulator.payloads.ReadablePayload;
import simulator.payloads.DriveSpeedPayload.ReadableDriveSpeedPayload;
import simulator.elevatorcontrol.Utility;
import simulator.elevatorcontrol.Utility.AtFloorArray;
import simulator.elevatorcontrol.Utility.Floor;
import simulator.elevatorcontrol.Utility.DriveSpeed;
import simulator.elevatorcontrol.Utility.DoorOpenedArray;


public class RuntimeRequirementsMonitor extends RuntimeMonitor{
    Requirement6n8RuntimeMonitor req6n8Monitor = new Requirement6n8RuntimeMonitor();
    Requirement7RuntimeMonitor req7Monitor = new Requirement7RuntimeMonitor();
    Requirement9RuntimeMonitor req9Monitor = new Requirement9RuntimeMonitor();
    Requirement10RuntimeMonitor req10Monitor = new Requirement10RuntimeMonitor();
    
    private DoorOpenedArray mFrontDoorOpened = new DoorOpenedArray(Hallway.FRONT, canInterface);
    private DoorOpenedArray mBackDoorOpened = new DoorOpenedArray(Hallway.BACK, canInterface);

    /**
     * 
     * @author jialiangtan
     * 
     * States that works with StopTriggeringMachine
     */
    private static enum TriggerState {
    	HALL_CALL_TRIGGERED,
    	CAR_CALL_TRIGGERED,
    	AT_FLOOR,
    	DOOR_OPEN,
    	NONE
    }
    
    /**
     * 
     * @author jialiangtan
     * 
     * States that works with {@link Requirement6n8RuntimeMonitor.PendingCallStateMachine}
     */
    private static enum PendingCallState {
        MOVING,
        VALID_STOP,
        INVALID_STOP
    }
    
    /**
     * 
     * @author jialiangtan
     * 
     * States that works with {@link Requirement6n8RuntimeMonitor.LanternStateMachine}
     */
    private static enum LanternState {
        UP,
        DOWN,
        BOTH,
        NONE
    }
    
    /**
     * 
     * @author jialiangtan
     * 
     *	generic states that can be used by multiple state machines
     */
    private static enum DoorState {
        //Door states
        OPEN,
        INTERMEDIATE,
        CLOSED,
        UNDETERMINED
    }
    
    /**
     * 
     * @author jialiangtan
     * 
     * States that works with {@link Requirement6n8RuntimeMonitor.LanternMonitorMachineRT81}
     */
    private static enum LanternMonitorStateRT81 {
        DOOR_NOT_OPEN,
        DOOR_OPEN,
        DOOR_OPEN_W_PENDING_CALL,
        DOOR_OPEN_WO_PENDING_CALL,
        INVALID_LOADING,
        VALID_LOADING,
        LANTERN_CHANGED,
    }
    
    /**
     * 
     * @author jialiangtan
     * 
     * States that works with {@link Requirement6n8RuntimeMonitor.LanternMonitorMachineRT83}
     */
    private static enum LanternMonitorStateRT83 {
    	DO_NOT_CARE_STATE,
    	UP_LANTERN_LIT,
    	DOWN_LANTERN_LIT,
    	VALID_DESIRED_FLOOR,
    	INVALID_DESIRED_FLOOR
    }
    
    /**
     * 
     * @author jialiangtan
     * 
     * States that works with {@link Requirement6n8RuntimeMonitor.OverallDoorStateMachine}
     * The overall door state is with respect to the doors that are supposed to make action
     * at a given hallway. 
     */
    public static enum OverallDoorState{
        ALL_OPEN, // All doors are fully open
        ANY_OPEN, // At least one but not all doors are open
        INTERMEDIATE, // No doors are fully open but not all of them are closed
        ANY_CLOSED, // At least one but not all doors are closed
        ALL_CLOSED, // All doors are fully closed
    }
    
        private static enum DriveState {
        //Drive states
        STOPPED,
        SLOW,
        FASTER_THAN_SLOW,
        DECELERATION_ZONE,
        PREMATURE_DECELERATION,
        NEVER_FAST,
    }
    
    /**************************************************************************
     * low level message receiving methods
     * 
     * These mostly forward messages to the appropriate state machines
     **************************************************************************/
    @Override
    public void receive(ReadableCarLightPayload msg) {
        req6n8Monitor.receive(msg);
        req7Monitor.receive(msg);
    }

    @Override
    public void receive(ReadableCarCallPayload msg) {
        req6n8Monitor.receive(msg);
    }
    
    @Override
    public void receive(ReadableAtFloorPayload msg) {
        req6n8Monitor.receive(msg);
        req7Monitor.receive(msg);
        req9Monitor.receive(msg);
    }
    
    @Override
    public void receive(ReadableHallLightPayload msg) {
        req6n8Monitor.receive(msg);
        req7Monitor.receive(msg);
    }
    
    @Override
    public void receive(ReadableHallCallPayload msg) {
        req6n8Monitor.receive(msg);
    }
    
    @Override
    public void receive(ReadableDoorClosedPayload msg) {
        req6n8Monitor.receive(msg);
        req7Monitor.receive(msg);
        req10Monitor.receive(msg);
    }

    @Override
    public void receive(ReadableDoorOpenPayload msg) {
        req6n8Monitor.receive(msg);
    }
    
    @Override
    public void receive(ReadableCarLanternPayload msg) {
        req6n8Monitor.receive(msg);
    }

    @Override
    public void receive(ReadableDoorReversalPayload msg) {
        req10Monitor.receive(msg);
    }
    
    @Override
    public void receive(ReadableDoorMotorPayload msg) {
        req10Monitor.receive(msg);
    }

    @Override
    public void receive(ReadableDriveSpeedPayload msg) {
        req9Monitor.receive(msg);
    }
    
    @Override
    public void receive(ReadableCarLevelPositionPayload msg) {
        req9Monitor.receive(msg);
    }    
    
   
    /**
     * 
     * @author jialiangtan
     * 
     *	A wrapped class that takes care of all R-T6 and R-T8.1 R-T8.2 R-T8.3 
     *
     */
    public class Requirement6n8RuntimeMonitor extends RuntimeMonitor {

        PendingCallStateMachine pendingCallState = new PendingCallStateMachine();
        FloorState floorState = new FloorState();
        OverallDoorStateMachine overallDoorState = new OverallDoorStateMachine();
        LanternStateMachine lanternStateMachine = new LanternStateMachine();
        LanternMonitorMachineRT81RT82 lanternMonitorMachineRT81RT82 = new LanternMonitorMachineRT81RT82();
        LanternMonitorMachineRT83 lanternMonitorMachineRT83 = new LanternMonitorMachineRT83();
        StopTriggeringStateMachine stopTriggerState = new StopTriggeringStateMachine();
        AtFloorArray atFloorArray = new AtFloorArray(canInterface);

        public Requirement6n8RuntimeMonitor() {
        	
        }

        @Override
        protected String[] summarize() {
            String[] arr = new String[1];
            return arr;
        }

        public void timerExpired(Object callbackData) {
            //do nothing
        }

        /**************************************************************************
         * low level message receiving methods
         * 
         * These mostly forward messages to the appropriate state machines
         **************************************************************************/
        @Override
        public void receive(ReadableCarLightPayload msg) {
            pendingCallState.receive(msg);
        }

        @Override
        public void receive(ReadableCarCallPayload msg) {
            this.lanternMonitorMachineRT81RT82.receive(msg);
        }
        
        @Override
        public void receive(ReadableAtFloorPayload msg) {
            floorState.receive(msg);
            pendingCallState.receive(msg);
            stopTriggerState.receive(msg);
        }
        
        @Override
        public void receive(ReadableHallCallPayload msg) {
            this.lanternMonitorMachineRT81RT82.receive(msg);
        }
        
        @Override
        public void receive(ReadableHallLightPayload msg) {
            pendingCallState.receive(msg);
        }
        
        @Override
        public void receive(ReadableDoorOpenPayload msg) {
            this.overallDoorState.receive(msg);
            this.lanternMonitorMachineRT81RT82.receive(msg);
            stopTriggerState.receive(msg);
        }
        
        @Override
        public void receive(ReadableDoorClosedPayload msg) {
            this.overallDoorState.receive(msg);
            this.lanternMonitorMachineRT81RT82.receive(msg);
            stopTriggerState.receive(msg);
        }
        
        @Override
        public void receive(ReadableCarLanternPayload msg) {
            lanternStateMachine.receive(msg);
            this.lanternMonitorMachineRT81RT82.receive(msg);
            this.lanternMonitorMachineRT83.receive(msg);
        }
        /**
         * @author jialiangtan
         * 
         * The LanternState only indicates the state where the atFloor sensor is true
         *
         */
        private class LanternStateMachine {
            private boolean isUpLanternOn = false;
            private boolean isDownLanternOn = false;
            public void receive(ReadableCarLanternPayload msg) {
                Direction direction = msg.getDirection();
                boolean lighted = msg.lighted();
                if (direction == Direction.UP) {
                    isUpLanternOn = lighted;
                }
                if (direction == Direction.DOWN) {
                    isDownLanternOn = lighted;
                }
            }
            
            public LanternState getState() {
                if (isUpLanternOn && isDownLanternOn) {
                    return LanternState.BOTH;
                } else if (isUpLanternOn) {
                    return LanternState.UP;
                } else if (isDownLanternOn) {
                    return LanternState.DOWN;
                } else {
                    return LanternState.NONE;
                }
            }
        }
        
        /**
         * 
         * @author jialiangtan
         * 
         * This is a state machine that deals with R-T8.1 and R-T8.2 together
         * 
         */
        private class LanternMonitorMachineRT81RT82 {
            volatile private LanternMonitorStateRT81 state = LanternMonitorStateRT81.DOOR_NOT_OPEN;
            private LanternState prevLanternState = null;
            public void receive(ReadableDoorClosedPayload msg) {
                updateState(msg);
            }
            
            public void receive(ReadableDoorOpenPayload msg) {
                updateState(msg);
            }
            
            public void receive(ReadableCarCallPayload msg) {
                updateState(msg);
            }
            
            public void receive(ReadableHallCallPayload msg) {
                updateState(msg);
            }
            
            public void receive(ReadableCarLanternPayload msg) {
                updateState(msg);
            }
            
            public void updateState(ReadablePayload msg) {
                LanternMonitorStateRT81 newState = null;
                switch(state) {
                    case DOOR_NOT_OPEN:
                        if (overallDoorState.overallDoorState == OverallDoorState.ANY_OPEN) {
                            newState = LanternMonitorStateRT81.DOOR_OPEN;
                        } else {
                            newState = state;
                        }
                        break;
                    case DOOR_OPEN:
                        if (pendingCallState.pendingCallPresented()) {
                            newState = LanternMonitorStateRT81.DOOR_OPEN_W_PENDING_CALL;
                        } else if (!pendingCallState.pendingCallPresented()) {
                            newState = LanternMonitorStateRT81.DOOR_OPEN_WO_PENDING_CALL;
                        } else {
                            newState = state;
                        }
                        break;
                    case DOOR_OPEN_W_PENDING_CALL:
                        if (lanternStateMachine.getState() == LanternState.UP 
                        || lanternStateMachine.getState() == LanternState.DOWN) {
                            newState = LanternMonitorStateRT81.VALID_LOADING;
                        } else if (lanternStateMachine.getState() == LanternState.BOTH 
                                || lanternStateMachine.getState() == LanternState.NONE) {
                            newState = LanternMonitorStateRT81.INVALID_LOADING;
                            if (lanternStateMachine.getState() == LanternState.NONE) {
                                if(overallDoorState.frontDoorsOpened || overallDoorState.backDoorsOpened) {
                                    RuntimeRequirementsMonitor.this.warning("RT8.1: No lanterns light up when doors are open with pending calls");
                                }else{
                                    newState = state;
                                }
                            } else {
                                RuntimeRequirementsMonitor.this.warning("RT8.1: Both lanterns light up when doors are open with pending calls");
                            }
                        } else {
                            newState = state;
                        }
                        break;
                    case DOOR_OPEN_WO_PENDING_CALL:
                        // Lantern on and there is a hall call -> Valid
                        if ((lanternStateMachine.getState() == LanternState.UP || 
                            lanternStateMachine.getState() == LanternState.DOWN) && 
                            (stopTriggerState.getState() == TriggerState.HALL_CALL_TRIGGERED)) {
                            newState = LanternMonitorStateRT81.VALID_LOADING;
                        } 
                        // Car Call
                        else if (stopTriggerState.getState() == TriggerState.CAR_CALL_TRIGGERED) {
                            newState = LanternMonitorStateRT81.VALID_LOADING;
                        // Hall Call, Lanterns are off
                        } else if ((lanternStateMachine.getState() == LanternState.NONE) && (stopTriggerState.getState() == TriggerState.HALL_CALL_TRIGGERED)){
                            // Doors have fully opened
                            if(overallDoorState.frontDoorsOpened || overallDoorState.backDoorsOpened) {
                            	newState = LanternMonitorStateRT81.INVALID_LOADING;
                                RuntimeRequirementsMonitor.this.warning("RT8.1: Neither lantern lights up when doors are open triggered by hall calls.");                            
                            } else {
                                newState = state;
                            }
                        // Hall Call, Both lanterns are on
                        } else if ((lanternStateMachine.getState() == LanternState.BOTH) && (stopTriggerState.getState() == TriggerState.HALL_CALL_TRIGGERED)){
                        	newState = LanternMonitorStateRT81.INVALID_LOADING;
                            RuntimeRequirementsMonitor.this.warning("RT8.1: Both lanterns light up when doors are open triggered by hall calls.");
                        } else {
                            newState = state;
                        }
                        break;
                    case INVALID_LOADING:
                        if (overallDoorState.overallDoorState == OverallDoorState.ALL_CLOSED) {
                            newState = LanternMonitorStateRT81.DOOR_NOT_OPEN;
                        } else if (lanternStateMachine.getState() != prevLanternState) {
                            newState = LanternMonitorStateRT81.LANTERN_CHANGED;
                            // RuntimeRequirementsMonitor.this.warning("Lanterns changed when doors are open.");
                        } else {
                            newState = state;
                        }
                        break;
                    case VALID_LOADING:
                        if (overallDoorState.overallDoorState == OverallDoorState.ALL_CLOSED) {
                            newState = LanternMonitorStateRT81.DOOR_NOT_OPEN;
                        } else if (lanternStateMachine.getState() != prevLanternState) {
                            newState = LanternMonitorStateRT81.LANTERN_CHANGED;
                            // RuntimeRequirementsMonitor.this.warning("Lanterns changed when doors are open.");
                        } else {
                            newState = state;
                        }
                        break;
                    case LANTERN_CHANGED:
                        if (pendingCallState.pendingCallPresented()) {
                            newState = LanternMonitorStateRT81.DOOR_OPEN_W_PENDING_CALL;
                        } else if (!pendingCallState.pendingCallPresented()) {
                            newState = LanternMonitorStateRT81.DOOR_OPEN_WO_PENDING_CALL;
                        } else {
                            newState = state;
                        }
                        break;
                    default:
                        break;
                }
                prevLanternState = lanternStateMachine.getState();
                this.state = newState;
            }
        }
        
        /**
         * 
         * @author jialiangtan
         * 
         *	This state machine monitors requirement R-T8.3
         */
        private class LanternMonitorMachineRT83 {
        	private LanternMonitorStateRT83 state = LanternMonitorStateRT83.DO_NOT_CARE_STATE;
        	private int desiredFloor = 0;
        	private int currentFloor = 0;
        	private LanternState lanternState = LanternState.NONE;
        	private LanternState prevLanternState = LanternState.NONE;
        	public void receive(ReadableCarLanternPayload msg) {
        		updateState();
        	}
        	public void updateState() {
        		LanternMonitorStateRT83 newState = state;
        		desiredFloor = RuntimeRequirementsMonitor.this.mDesiredFloor.getFloor();
        		currentFloor = floorState.getFloor();
        		prevLanternState = lanternState;
        		lanternState = lanternStateMachine.getState();
        		switch(state) {
        		case DO_NOT_CARE_STATE:
        			if (lanternState == LanternState.UP) {
        				newState = LanternMonitorStateRT83.UP_LANTERN_LIT;
        			} else if (lanternState == LanternState.DOWN) {
        				newState = LanternMonitorStateRT83.DOWN_LANTERN_LIT;
        			}
        			break;
        		case UP_LANTERN_LIT:
        			if (desiredFloor > currentFloor || desiredFloor == 0) {
        				newState = LanternMonitorStateRT83.VALID_DESIRED_FLOOR;
        			} else if (desiredFloor < currentFloor) {
        				newState = LanternMonitorStateRT83.INVALID_DESIRED_FLOOR;
        				RuntimeRequirementsMonitor.this.warning("R-T8.3 Violation: car serving calls opposite lantern direction.");
        			}
        			break;
        		case DOWN_LANTERN_LIT:
        			if (desiredFloor < currentFloor || desiredFloor == 0) {
        				newState = LanternMonitorStateRT83.VALID_DESIRED_FLOOR;
        			} else if (desiredFloor > currentFloor) {
        				newState = LanternMonitorStateRT83.INVALID_DESIRED_FLOOR;
        				RuntimeRequirementsMonitor.this.warning("R-T8.3 Violation: car serving calls opposite lantern direction.");
        			}
        			break;
        		case VALID_DESIRED_FLOOR:
        			if (prevLanternState != lanternState) {
        				newState = LanternMonitorStateRT83.DO_NOT_CARE_STATE;
        			}
        			break;
        		case INVALID_DESIRED_FLOOR:
        			if (prevLanternState != lanternState) {
        				newState = LanternMonitorStateRT83.DO_NOT_CARE_STATE;
        			}
        			break;
        		default:
        			break;
        		}
        		state = newState;
        	}
        }
        
        /**
         * 
         * @author jialiangtan
         * 
         * This class stores the information which indicates whether a hall call triggers a stop
         * or car call triggers a stop
         * 
         */
        private class StopTriggeringStateMachine {
        	private TriggerState state = TriggerState.NONE;
        	private int floor = 0;
        	private boolean frontHallCall = false;
        	private boolean backHallCall = false;
        	private boolean frontCarCall = false;
        	private boolean backCarCall = false;
        	public void receive(ReadableAtFloorPayload msg) {
                updateState();
            }
        	public void receive(ReadableDoorClosedPayload msg) {
        		updateState();
        	}
        	public void receive(ReadableDoorOpenPayload msg) {
        		updateState();
        	}
        	public TriggerState getState() {
        		return state;
        	}
        	public void updateState() {
        		TriggerState newState = state;
        		switch(state) {
        		case NONE:
        			if (floorState.getFloor() != 0) {
        				floor = floorState.getFloor();
        				frontHallCall = pendingCallState.getHallCallAtFloorAndHallWay(floor, Hallway.FRONT);
        				backHallCall = pendingCallState.getHallCallAtFloorAndHallWay(floor, Hallway.BACK);
        				frontCarCall = pendingCallState.getCarCallAtFloorAndHallWay(floor, Hallway.FRONT);
        				backCarCall = pendingCallState.getCarCallAtFloorAndHallWay(floor, Hallway.BACK);
        				newState = TriggerState.AT_FLOOR;
        			}
        			break;
        		case AT_FLOOR:
        			if (overallDoorState.overallDoorState == OverallDoorState.ANY_OPEN) {
        				newState = TriggerState.DOOR_OPEN;
        			}
        			break;
        		case DOOR_OPEN:
        			if ((frontHallCall != pendingCallState.getHallCallAtFloorAndHallWay(floor, Hallway.FRONT)) ||  (backHallCall != pendingCallState.getHallCallAtFloorAndHallWay(floor, Hallway.BACK))) {
        				newState = TriggerState.HALL_CALL_TRIGGERED;
        			} else if ((frontCarCall != pendingCallState.getCarCallAtFloorAndHallWay(floor, Hallway.FRONT)) || (backCarCall != pendingCallState.getCarCallAtFloorAndHallWay(floor, Hallway.BACK))) {
        				newState = TriggerState.CAR_CALL_TRIGGERED;
        			}
        			break;
        		case HALL_CALL_TRIGGERED:
        			if (overallDoorState.overallDoorState == OverallDoorState.ALL_CLOSED) {
        				newState = TriggerState.NONE;
        			}
        			break;
        		case CAR_CALL_TRIGGERED:
        			if (overallDoorState.overallDoorState == OverallDoorState.ALL_CLOSED) {
        				newState = TriggerState.NONE;
        			}
        			break;
        		default:
        			break;
        		}
        		state = newState;
        	}
        }
        
        /**
         * 
         * @author jialiangtan
         * 
         * This state machine monitors state R-T12.
         * This state machine monitors the doors to see if the doors are opening or closing with the same
         * pace and in synchronization.
         */
        private class OverallDoorStateMachine {
            private OverallDoorState overallDoorState;
            private HashMap<Hallway, HashMap<Side, DoorState>> doorStateMap = new HashMap<Hallway, HashMap<Side, DoorState>>(); 
            
            public boolean frontRightOpened = false;
            public boolean frontLeftOpened = false;
            public boolean backRightOpened = false;
            public boolean backLeftOpened = false;
            public boolean backDoorsOpened = false;
            public boolean frontDoorsOpened = false;
            
            public OverallDoorStateMachine() {
                doorStateMap.put(Hallway.FRONT, new HashMap<Side, DoorState>());
                doorStateMap.put(Hallway.BACK, new HashMap<Side, DoorState>());
                doorStateMap.get(Hallway.FRONT).put(Side.LEFT, DoorState.CLOSED);
                doorStateMap.get(Hallway.FRONT).put(Side.RIGHT, DoorState.CLOSED);
                doorStateMap.get(Hallway.BACK).put(Side.LEFT, DoorState.CLOSED);
                doorStateMap.get(Hallway.BACK).put(Side.RIGHT, DoorState.CLOSED);
            }
            public void updateState() {
                Hallway currHallway = floorState.getHallway();
                DoorState frontLeft = doorStateMap.get(Hallway.FRONT).get(Side.LEFT);
                DoorState frontRight = doorStateMap.get(Hallway.FRONT).get(Side.RIGHT);
                DoorState backLeft = doorStateMap.get(Hallway.BACK).get(Side.LEFT);
                DoorState backRight = doorStateMap.get(Hallway.BACK).get(Side.RIGHT);
                if (currHallway == Hallway.BOTH) {
                    if (frontLeft == DoorState.OPEN && frontRight == DoorState.OPEN && backLeft == DoorState.OPEN && backRight == DoorState.OPEN) {
                        overallDoorState = OverallDoorState.ALL_OPEN;
                    } else if (frontLeft == DoorState.INTERMEDIATE && frontRight == DoorState.INTERMEDIATE && backLeft == DoorState.INTERMEDIATE && backRight == DoorState.INTERMEDIATE) {
                        overallDoorState = OverallDoorState.INTERMEDIATE;
                    } else if (frontLeft == DoorState.CLOSED && frontRight == DoorState.CLOSED && backLeft == DoorState.CLOSED && backRight == DoorState.CLOSED) {
                        overallDoorState = OverallDoorState.ALL_CLOSED;
                    } else if ((frontLeft == DoorState.CLOSED || frontRight == DoorState.CLOSED || backLeft == DoorState.CLOSED || backRight == DoorState.CLOSED) && 
                                (frontLeft != DoorState.OPEN && frontRight != DoorState.OPEN && backLeft != DoorState.OPEN && backRight != DoorState.OPEN)) {
                        overallDoorState = OverallDoorState.ANY_CLOSED;
                    } else if ((frontLeft == DoorState.OPEN || frontRight == DoorState.OPEN || backLeft == DoorState.OPEN || backRight == DoorState.OPEN) && 
                                (frontLeft != DoorState.CLOSED && frontRight != DoorState.CLOSED && backLeft != DoorState.CLOSED && backRight != DoorState.CLOSED)) {
                        overallDoorState = OverallDoorState.ANY_OPEN;
                    }
                } else if (currHallway == Hallway.NONE) {
                    overallDoorState = OverallDoorState.ALL_CLOSED;
                } else if (currHallway == Hallway.FRONT) {
                    if ((frontLeft == DoorState.OPEN) && (frontRight == DoorState.OPEN)) {
                        overallDoorState = OverallDoorState.ALL_OPEN;
                    } else if (frontLeft == DoorState.INTERMEDIATE && frontRight == DoorState.INTERMEDIATE) {
                        overallDoorState = OverallDoorState.INTERMEDIATE;
                    } else if (frontLeft == DoorState.CLOSED && frontRight == DoorState.CLOSED) {
                        overallDoorState = OverallDoorState.ALL_CLOSED;
                    } else if ((frontLeft == DoorState.CLOSED || frontRight == DoorState.CLOSED) &&  (frontLeft != DoorState.OPEN && frontRight != DoorState.OPEN)) {
                        overallDoorState = OverallDoorState.ANY_CLOSED;
                    } else if ((frontLeft == DoorState.OPEN || frontRight == DoorState.OPEN) &&  (frontLeft != DoorState.CLOSED && frontRight != DoorState.CLOSED)) {
                        overallDoorState = OverallDoorState.ANY_OPEN;
                    } else {
                        RuntimeRequirementsMonitor.this.warning("RT12: Doors highly unsynchronized (one door fully open while one door fully closed) (Hallway:FRONT)");
                    }
                } else {
                    if (backLeft == DoorState.OPEN && backRight == DoorState.OPEN) {
                        overallDoorState = OverallDoorState.ALL_OPEN;
                    } else if (backLeft == DoorState.INTERMEDIATE && backRight == DoorState.INTERMEDIATE) {
                        overallDoorState = OverallDoorState.INTERMEDIATE;
                    } else if (backLeft == DoorState.CLOSED && backRight == DoorState.CLOSED) {
                        overallDoorState = OverallDoorState.ALL_CLOSED;
                    } else if ((backLeft == DoorState.CLOSED || backRight == DoorState.CLOSED) &&  (backLeft != DoorState.OPEN && backRight != DoorState.OPEN)) {
                        overallDoorState = OverallDoorState.ANY_CLOSED;
                    } else if ((backLeft == DoorState.OPEN || backRight == DoorState.OPEN) &&  (backLeft != DoorState.CLOSED && backRight != DoorState.CLOSED)) {
                        overallDoorState = OverallDoorState.ANY_OPEN;
                    } else {
                        RuntimeRequirementsMonitor.this.warning("RT12: Doors highly unsynchronized (one door fully open while one door fully closed) (Hallway:BACK)");
                    }
                }
            } 
            
            /**
             * This method in combination with receive(ReadableDoorOpenPayLoad msg) 
             * trace back to door state chart
             */
            public void receive(ReadableDoorClosedPayload msg) {
                Hallway hallway = msg.getHallway();
                Side side = msg.getSide();
                boolean isClosed = msg.isClosed();
                DoorState currState = doorStateMap.get(hallway).get(side);
                DoorState newState = null;
                switch(currState) {
                    case CLOSED:
                        if (isClosed) {
                            newState = DoorState.CLOSED;
                        } else {
                            newState = DoorState.INTERMEDIATE;
                        }
                        break;
                    case OPEN:
                        if (isClosed) {
                            newState = DoorState.UNDETERMINED;
                            RuntimeRequirementsMonitor.this.warning("RT11: Door at hallway : " + hallway + " at side : " + side + " go from OPEN to UNDETERMINED.");
                        } else {
                            newState = DoorState.OPEN;
                        }
                        break;
                    case INTERMEDIATE:
                        if (isClosed) {
                            newState = DoorState.CLOSED;
                        } else {
                            newState = DoorState.INTERMEDIATE;
                        }
                        break;
                    case UNDETERMINED:
                        if (isClosed) {
                            newState = DoorState.CLOSED;
                        } else {
                            newState = DoorState.UNDETERMINED;
                        }
                        break;
                    default:
                        RuntimeRequirementsMonitor.this.warning("RT11: Door at hallway : " + hallway + " at side : " + side + " enters an undefined state.");
                        break;
                }
                doorStateMap.get(hallway).put(side, newState);
                updateState();
            }
            
            /**
             * This method in combination with receive(ReadableDoorClosedPayload msg) 
             * trace back to door state chart
             */
            public void receive(ReadableDoorOpenPayload msg) {
                Hallway hallway = msg.getHallway();
                Side side = msg.getSide();
                boolean isOpen = msg.isOpen();
                DoorState currState = doorStateMap.get(hallway).get(side);
                DoorState newState = null;
                
                // set boolean variables for each combination of the DoorOpened sensor
                if((hallway == Hallway.FRONT) && (side == Side.LEFT)) {
                    frontLeftOpened = msg.isOpen();
                } else if ((hallway == Hallway.FRONT) && (side == Side.RIGHT)) {
                    frontRightOpened = msg.isOpen();
                } else if ((hallway == Hallway.BACK) && (side == Side.LEFT)) {
                    backLeftOpened = msg.isOpen();
                } else if ((hallway == Hallway.BACK) && (side == Side.RIGHT)) {
                    backRightOpened = msg.isOpen();
                }
                
                // set general boolean variables for front hallway
                if(frontLeftOpened && frontRightOpened) {
                    frontDoorsOpened = true;
                } else {
                    frontDoorsOpened = false;
                }
                
                // set general boolean variables for front hallway
                if(backLeftOpened && backRightOpened) {
                    backDoorsOpened = true;
                } else {
                    backDoorsOpened = false;
                }
                
                
                switch(currState) {
                    case CLOSED:
                        if (isOpen) {
                            newState = DoorState.UNDETERMINED;
                            RuntimeRequirementsMonitor.this.warning("RT11: Door at hallway : " + hallway + " at side : " + side + " go from CLOSED to UNDETERMINED.");
                        } else {
                            newState = DoorState.CLOSED;
                        }
                        break;
                    case OPEN:
                        if (isOpen) {
                            newState = DoorState.OPEN;
                        } else {
                            newState = DoorState.INTERMEDIATE;
                        }
                        break;
                    case INTERMEDIATE:
                        if (isOpen) {
                            newState = DoorState.OPEN;
                        } else {
                            newState = DoorState.INTERMEDIATE;
                        }
                        break;
                    case UNDETERMINED:
                        if (isOpen) {
                            newState = DoorState.OPEN;
                        } else {
                            newState = DoorState.UNDETERMINED;
                        }
                        break;
                    default:
                        RuntimeRequirementsMonitor.this.warning("RT11: Door at hallway : " + hallway + " at side : " + side + " enters an undefined state.");
                        break;
                }
                doorStateMap.get(hallway).put(side, newState);
                updateState();
            }
        }
        
        /**
         * 
         * @author jialiangtan
         * 
         * This class stores the state of all the at floor sensors
         */
        private class FloorState {
            private HashMap<Integer, HashMap<Hallway, Boolean>> floorMap = new HashMap<Integer, HashMap<Hallway, Boolean>>();
            private int floor;
            private Hallway hallway;
            public FloorState() {
                floorMap.put(1, new HashMap<Hallway, Boolean>());
                floorMap.get(1).put(Hallway.FRONT, false);
                floorMap.get(1).put(Hallway.BACK, false);
                floorMap.put(2, new HashMap<Hallway, Boolean>());
                floorMap.get(2).put(Hallway.FRONT, false);
                floorMap.get(2).put(Hallway.BACK, false);
                floorMap.put(3, new HashMap<Hallway, Boolean>());
                floorMap.get(3).put(Hallway.FRONT, false);
                floorMap.get(3).put(Hallway.BACK, false);
                floorMap.put(4, new HashMap<Hallway, Boolean>());
                floorMap.get(4).put(Hallway.FRONT, false);
                floorMap.get(4).put(Hallway.BACK, false);
                floorMap.put(5, new HashMap<Hallway, Boolean>());
                floorMap.get(5).put(Hallway.FRONT, false);
                floorMap.get(5).put(Hallway.BACK, false);
                floorMap.put(6, new HashMap<Hallway, Boolean>());
                floorMap.get(6).put(Hallway.FRONT, false);
                floorMap.get(6).put(Hallway.BACK, false);
                floorMap.put(7, new HashMap<Hallway, Boolean>());
                floorMap.get(7).put(Hallway.FRONT, false);
                floorMap.get(7).put(Hallway.BACK, false);
                floorMap.put(8, new HashMap<Hallway, Boolean>());
                floorMap.get(8).put(Hallway.FRONT, false);
                floorMap.get(8).put(Hallway.BACK, false);
            }
            
            public int getFloor() {
                return floor;
            }
            
            public Hallway getHallway() {
                return hallway;
            }
            
            public void receive(ReadableAtFloorPayload msg) {
                int f = msg.getFloor();
                Hallway h = msg.getHallway();
                boolean atFloor = msg.getValue();
                floorMap.get(f).put(h, atFloor);
                
                boolean set = false;
                for (int i = 1; i <= 8; i++) {
                    if (floorMap.get(i).get(Hallway.FRONT) && floorMap.get(i).get(Hallway.BACK)) {
                        floor = i;
                        hallway = Hallway.BOTH;
                        set = true;
                    } else if (floorMap.get(i).get(Hallway.FRONT)) {
                        floor = i;
                        hallway = Hallway.FRONT;
                        set = true;
                    } else if (floorMap.get(i).get(Hallway.BACK)) {
                        floor = i;
                        hallway = Hallway.BACK;
                        set = true;
                    }
                }
                if (!set) {
                    floor = 0;
                    hallway = Hallway.NONE;
                }
            }
        }


        /**
         * 
         * @author jialiangtan
         * 
         * Utility class for keeping track of the car and hall button state.
         */
        private class PendingCallStateMachine {
            private HashMap<Integer, HashMap<Hallway, Boolean>> pendingCarCallMap;
            private HashMap<Integer, HashMap<Hallway, Boolean>> pendingHallCallMap;
            private PendingCallState currentState = PendingCallState.VALID_STOP;
            public PendingCallStateMachine () {
            	pendingCarCallMap = new HashMap<Integer, HashMap<Hallway, Boolean>>();
            	pendingCarCallMap.put(1, new HashMap<Hallway, Boolean>());
            	pendingCarCallMap.get(1).put(Hallway.FRONT, false);
            	pendingCarCallMap.get(1).put(Hallway.BACK, false);
            	pendingCarCallMap.put(2, new HashMap<Hallway, Boolean>());
            	pendingCarCallMap.get(2).put(Hallway.BACK, false);
            	pendingCarCallMap.put(3, new HashMap<Hallway, Boolean>());
            	pendingCarCallMap.get(3).put(Hallway.FRONT, false);
            	pendingCarCallMap.put(4, new HashMap<Hallway, Boolean>());
            	pendingCarCallMap.get(4).put(Hallway.FRONT, false);
            	pendingCarCallMap.put(5, new HashMap<Hallway, Boolean>());
            	pendingCarCallMap.get(5).put(Hallway.FRONT, false);
            	pendingCarCallMap.put(6, new HashMap<Hallway, Boolean>());
            	pendingCarCallMap.get(6).put(Hallway.FRONT, false);
            	pendingCarCallMap.put(7, new HashMap<Hallway, Boolean>());
            	pendingCarCallMap.get(7).put(Hallway.FRONT, false);
            	pendingCarCallMap.get(7).put(Hallway.BACK, false);
            	pendingCarCallMap.put(8, new HashMap<Hallway, Boolean>());
            	pendingCarCallMap.get(8).put(Hallway.FRONT, false);
            	
            	pendingHallCallMap = new HashMap<Integer, HashMap<Hallway, Boolean>>();
            	pendingHallCallMap.put(1, new HashMap<Hallway, Boolean>());
            	pendingHallCallMap.get(1).put(Hallway.FRONT, false);
            	pendingHallCallMap.get(1).put(Hallway.BACK, false);
            	pendingHallCallMap.put(2, new HashMap<Hallway, Boolean>());
            	pendingHallCallMap.get(2).put(Hallway.BACK, false);
            	pendingHallCallMap.put(3, new HashMap<Hallway, Boolean>());
            	pendingHallCallMap.get(3).put(Hallway.FRONT, false);
            	pendingHallCallMap.put(4, new HashMap<Hallway, Boolean>());
            	pendingHallCallMap.get(4).put(Hallway.FRONT, false);
            	pendingHallCallMap.put(5, new HashMap<Hallway, Boolean>());
            	pendingHallCallMap.get(5).put(Hallway.FRONT, false);
            	pendingHallCallMap.put(6, new HashMap<Hallway, Boolean>());
            	pendingHallCallMap.get(6).put(Hallway.FRONT, false);
            	pendingHallCallMap.put(7, new HashMap<Hallway, Boolean>());
            	pendingHallCallMap.get(7).put(Hallway.FRONT, false);
            	pendingHallCallMap.get(7).put(Hallway.BACK, false);
            	pendingHallCallMap.put(8, new HashMap<Hallway, Boolean>());
            	pendingHallCallMap.get(8).put(Hallway.FRONT, false);
            }

            public void receive(ReadableCarLightPayload msg) {
                Hallway lightedHallway = msg.getHallway();
                int lightedFloor = msg.getFloor();
                boolean lighted = msg.isLighted();
                pendingCarCallMap.get(lightedFloor).put(lightedHallway, lighted);
            }

            public void receive(ReadableHallLightPayload msg) {
                Hallway lightedHallway = msg.getHallway();
                int lightedFloor = msg.getFloor();
                boolean lighted = msg.lighted();
                pendingHallCallMap.get(lightedFloor).put(lightedHallway, lighted);
            }
            
            public void receive(ReadableAtFloorPayload msg) {
                updateState();
            }

            public void updateState() {
                PendingCallState newState = null;
//                int floor = floorState.getFloor();
//                Hallway hallway = floorState.getHallway();
                int floor = atFloorArray.getCurrentFloor();
                Hallway hallway = atFloorArray.getCurrentHallway();
            
                switch(currentState) {
                    case MOVING:
                        if (floor != 0) {
                        // car is stopped at a floor
                            if (hallway == Hallway.FRONT) {
                                if (pendingCarCallMap.get(floor).get(Hallway.FRONT) || pendingHallCallMap.get(floor).get(Hallway.FRONT)) {
                                    newState = PendingCallState.VALID_STOP;
                                } else {
                                    newState = PendingCallState.INVALID_STOP;
                                    RuntimeRequirementsMonitor.this.warning("RT6 Violated: Invalid stop at floor " + floor + " and hallway " + hallway);
                                }
                            } else if (floorState.getHallway() == Hallway.BACK) {
                                if (pendingCarCallMap.get(floor).get(Hallway.BACK) || pendingHallCallMap.get(floor).get(Hallway.BACK)) {
                                    newState = PendingCallState.VALID_STOP;
                                } else {
                                    newState = PendingCallState.INVALID_STOP;
                                    RuntimeRequirementsMonitor.this.warning("RT6 Violated: Invalid stop at floor " + floor + " and hallway " + hallway);
                                }
                            } else if (floorState.getHallway() == Hallway.BOTH) {
                                if ((pendingCarCallMap.get(floor).get(Hallway.BACK)
                                    && pendingCarCallMap.get(floor).get(Hallway.FRONT)) 
                                ||  (pendingHallCallMap.get(floor).get(Hallway.BACK)
                                    && pendingHallCallMap.get(floor).get(Hallway.FRONT))
                                ||  (pendingCarCallMap.get(floor).get(Hallway.BACK)
                                	&& pendingHallCallMap.get(floor).get(Hallway.FRONT))
                                ||	(pendingCarCallMap.get(floor).get(Hallway.FRONT)
                                	&& pendingHallCallMap.get(floor).get(Hallway.BACK))){
                                    newState = PendingCallState.VALID_STOP;
                                } else {
                                    newState = PendingCallState.INVALID_STOP;
                                    if (!pendingCarCallMap.get(floor).get(Hallway.BACK)
                                    &&  !pendingHallCallMap.get(floor).get(Hallway.BACK)) {
                                        RuntimeRequirementsMonitor.this.warning("RT6 Violated: Invalid stop at floor " + floor + " and hallway " + Hallway.BACK);
                                    }
                                    if (!pendingCarCallMap.get(floor).get(Hallway.FRONT)
                                    &&  !pendingHallCallMap.get(floor).get(Hallway.FRONT)) {
                                        RuntimeRequirementsMonitor.this.warning("RT6 Violated: Invalid stop at floor " + floor + " and hallway " + Hallway.FRONT);
                                    }
                                }
                            }
                        } else {
                        // car keeps moving
                            newState = PendingCallState.MOVING;
                        }
                        break;
                    case VALID_STOP:
                        if (floor == 0) {
                        // car moves
                            newState = PendingCallState.MOVING;
                        } else {
                            newState = PendingCallState.VALID_STOP;
                        }
                        break;
                    case INVALID_STOP:
                        if (floor == 0) {
                        // car moves
                            newState = PendingCallState.MOVING;
                        } else {
                            newState = PendingCallState.INVALID_STOP;
                        }
                        break;
                    default:
                        RuntimeRequirementsMonitor.this.warning("Monitor implementation error: UNKNOWN STATE");
                        break;
                }
                currentState = newState;
            }
            
            public boolean pendingCallPresented() {
                for (HashMap<Hallway, Boolean> innerMap : pendingCarCallMap.values()) {
                    for (Boolean isPresented : innerMap.values()) {
                        if (isPresented) {
                            return true;
                        }
                    }
                }
                for (HashMap<Hallway, Boolean> innerMap : pendingHallCallMap.values()) {
                    for (Boolean isPresented : innerMap.values()) {
                        if (isPresented) {
                            return true;
                        }
                    }
                }
                return false;
            }
            
            public boolean getHallCallAtFloorAndHallWay(int f, Hallway h) {
                if(Floor.isValidFloor(f, h)) {
            	    return this.pendingHallCallMap.get(f).get(h);
                }
                return false;
            }
            
            public boolean getCarCallAtFloorAndHallWay(int f, Hallway h) {
                if(Floor.isValidFloor(f, h)) {
            	    return this.pendingCarCallMap.get(f).get(h);
                }
                return false;
            }
        }
    }



    /**
     * 
     * @author rahulram
     *
     * asserts that doors are reversed or reopened before a NUDGE happens
     */
    public class Requirement10RuntimeMonitor extends RuntimeMonitor{
        DoorStateMachine doorState = new DoorStateMachine();
        ReversalStateMachine reversalState = new ReversalStateMachine();
        int numErrors = 0;
        int numNudges = 0;
        int floor= 0;
        public Requirement10RuntimeMonitor() {
        }

        @Override
        protected String[] summarize() {
            String[] arr = new String[2];
            arr[0] = "Nudge when no reversal = " + numErrors;
            arr[1] = "Number of nudges = " + numNudges;
            return arr;
        }

        public void timerExpired(Object callbackData) {
            //do nothing
        }
        
        /**************************************************************************
         * high level event methods
         *
         * these are called by the logic in the message receiving methods and the
         * state machines
         **************************************************************************/

        /**
         * Called once when the doors are nudging at a floor
         */
        private void doorNudging() {
            numNudges++;
            //check if a reversal at that floor has already taken place.
            boolean alreadyReversed = reversalState.getReversed();
            if (!alreadyReversed) {
                RuntimeRequirementsMonitor.this.warning("RT10 Violated: DOOR NUDGING WHEN NO REVERSAL ");
                numErrors++;
                reversalState.alreadyReversed = true;
            }
        }
        
        /**************************************************************************
         * low level message receiving methods
         * 
         * These mostly forward messages to the appropriate state machines
         **************************************************************************/
        @Override
        public void receive(ReadableDoorMotorPayload msg) {
            doorState.receive(msg);
        }
        
        @Override
        public void receive(ReadableDoorReversalPayload msg) {
            reversalState.receive(msg);
        }
     
        @Override
        public void receive(ReadableAtFloorPayload msg) {
            reversalState.receive(msg);
        }

   
        /*
        * Utility class for keep tracking of the reversal state
        */
        private class ReversalStateMachine {
            private boolean alreadyReversed = false;
            
            public boolean getReversed() {
                return alreadyReversed;
            }
                    
            public void receive(ReadableDoorReversalPayload msg) {
                //check if doors are reversing
                if (msg.isReversing()){
	        	    alreadyReversed = true;
                }
            }
            
            public void receive(ReadableAtFloorPayload msg) {
                if (msg.getValue()){
                    //if at a new floor, reset alreadyReversed and update floor
		            if (floor != msg.getFloor()){
	                    alreadyReversed = false;
			            floor = msg.getFloor();
		            }
                }
            }
        }
        
        /*
        * Utility class for keep tracking of the door state
        */
        private class DoorStateMachine {
            
            public void receive(ReadableDoorMotorPayload msg) {
                //check if doors are nudging
                if (msg.command() == DoorCommand.NUDGE){
                    doorNudging();
                }
            }
        }
    }

    /**
     * 
     * @author rahulram
     * asserts that there is a pending call at that floor when doors open
     */
    public class Requirement7RuntimeMonitor extends RuntimeMonitor {

        FloorState floorState = new FloorState();
        DoorStateMachine doorState = new DoorStateMachine();
        CallStateMachine callState = new CallStateMachine();
        int numOpens = 0;
        int numErrors = 0;

        public Requirement7RuntimeMonitor() {
        }

        @Override
        protected String[] summarize() {
            String[] arr = new String[2];
            arr[0] = "Open when no call Count = " + numErrors;
            arr[1] = "Number of openings = " + numOpens;
            return arr;
        }

        public void timerExpired(Object callbackData) {
            //do nothing
        }

        /**************************************************************************
         * high level event methods
         *
         * these are called by the logic in the message receiving methods and the
         * state machines
         **************************************************************************/

        /**
         * Called once when the doors are open
         * 
         */
        private void doorOpened() {
            numOpens++;
            // gets current floor.
            int floor = this.floorState.getFloor();
            //checks if there are any calls present at this floor.
            Boolean calls = this.callState.getCalls();
            if (!calls) {
                //If no calls present, this is in violation of requirement.
                RuntimeRequirementsMonitor.this.warning("RT7 Violated: DOOR OPEN WHEN NO CALL at floor " + floor);
                numErrors++;
            }
            // Floor is now serviced
            this.callState.setCalls(false);
        }

        /**************************************************************************
         * low level message receiving methods
         * 
         * These mostly forward messages to the appropriate state machines
         **************************************************************************/
        @Override
        public void receive(ReadableDoorClosedPayload msg) {
            doorState.receive(msg);
        }

        @Override
        public void receive(ReadableHallLightPayload msg) {
            callState.receive(msg);
        } 

        @Override
        public void receive(ReadableCarLightPayload msg) {
            callState.receive(msg);
        }

        @Override
        public void receive(ReadableAtFloorPayload msg) {
            floorState.receive(msg);
        }

        /*
        * Utility class for keep tracking of the current floor
        */
        private class FloorState {
            private int floor = 1;
            
            public int getFloor() {
                return floor;
            }
                    
            public void receive(ReadableAtFloorPayload msg) {
                if(msg.getValue()){
                    // if any atFloor signal is true, then car is currently at that floor.
                    if (floor != msg.getFloor()){
                        floor = msg.getFloor();
                        // if at new floor, reset pending calls at floor seen to none
                        callState.calls = false;
                    }
                }
            }

        }

        /**
         * Utility class for keeping track of the door state.
         * 
         */
        private class DoorStateMachine {

            private DoorState state = DoorState.CLOSED;
            private Hallway hallway = Hallway.FRONT;

            public DoorStateMachine() {
                DoorState state = DoorState.CLOSED;
                Hallway hallway = Hallway.FRONT;
            }

            public void receive(ReadableDoorClosedPayload msg) {
                updateState(msg.isClosed(), msg.getHallway());
            }

            private void updateState(Boolean isClosed, Hallway hallway) {
                DoorState newState = state;
                switch (state) {
                    case CLOSED:
                        if(!isClosed){
                            // Door is not closed.
                            newState = DoorState.OPEN;
                            doorOpened();
                        }
                        break;
                    case OPEN:
                        if(isClosed){
                            // Door is closed.
                            newState = DoorState.CLOSED;
                        }
                        break;
                    default:
                        RuntimeRequirementsMonitor.this.warning("WARNING: UNKNOWN STATE IN DOOR_STATE");
                        break;
                }
            
                //set the newState
                state = newState;
            }

        }

        /**
         * Utility class for keeping track of the pending callsat floor
         * 
         */
        private class CallStateMachine {
            private Boolean calls;

            public CallStateMachine() {
                calls = false;
            }

            public Boolean getCalls(){
                return this.calls;
            }

            public void setCalls(Boolean newCalls){
                calls = newCalls;
            }

            public void receive(ReadableHallLightPayload msg) {
                updateState(msg.getFloor(), msg.getHallway(), msg.lighted(), msg.getDirection());
            }

            public void receive(ReadableCarLightPayload msg) {
                updateState(msg.getFloor(), msg.getHallway(), msg.lighted(), Direction.STOP);
            }

            // At current floor, if any of the hall lights or call light are on, then there is a pending call at that floor.
            private void updateState(int floor, Hallway h, Boolean lit, Direction dir) {
                if (floorState.getFloor() == floor && lit){
                    calls = true;
                }
            }
        }

    }
    
    /**
     * 
     * @author davidtho
     * 
     */
    public class Requirement9RuntimeMonitor extends RuntimeMonitor {

        int numErrors = 0;
        int speed;
        Direction direction;
        int position;
        
        private int SMALL_OFFSET = 5;
        private int BIG_OFFSET = 10;
        
        DriveStateMachine driveState = new DriveStateMachine();
        

        public Requirement9RuntimeMonitor() {
        }

        @Override
        protected String[] summarize() {
            String[] arr = new String[1];
            arr[0] =  "Wasted Fast-Speed Opportunity Count = " + numErrors;
            return arr;
        }
        public void timerExpired(Object callbackData) {
            //do nothing
            return;
        }

        /**************************************************************************
         * high level event methods
         *
         * these are called by the logic in the message receiving methods and the
         * state machines
         **************************************************************************/
         
        /**
         * Called when speed recommendations violated
         * @param desiredFoor the target floor
         */
        private void speedViolation(int desiredFloor) {
            RuntimeRequirementsMonitor.this.warning("RT9 Violated: Wasted opportunity to go faster to floor " + desiredFloor  + ".");
            numErrors++;
        }
        /**************************************************************************
         * low level message receiving methods
         * 
         * These mostly forward messages to the appropriate state machines
         **************************************************************************/

        @Override
        public void receive(ReadableDriveSpeedPayload msg) {
            this.speed = (int) msg.speed();
            this.direction = msg.direction();
        }
        
        @Override
        public void receive(ReadableCarLevelPositionPayload msg) {
            this.position = msg.position();
            driveState.updateState(this.speed, this.direction, this. position);
        }
        
        /**
         * 
         * State machine to keep track of Drive state
         */
        private class DriveStateMachine {
                DriveState state = DriveState.STOPPED;
            public DriveStateMachine() {
                DriveState state = DriveState.STOPPED;
            }
            
            public void updateState(int speed, Direction direction, int position) {
                
        		int desiredFloor = RuntimeRequirementsMonitor.this.mDesiredFloor.getFloor();
                double floorDistance = Floor.floorDistance(desiredFloor, position, direction);
                double stoppingDistance = Floor.stoppingDistance(speed, Floor.DECEL_TIME);
                
                DriveState newState = state;
                switch (state) {
                    case STOPPED:
                        if(speed > DriveSpeed.SLOW - SMALL_OFFSET){
                            newState = DriveState.SLOW;
                        }
                        break;
                    case SLOW:
                        if(speed > DriveSpeed.SLOW + BIG_OFFSET){
                            newState = DriveState.FASTER_THAN_SLOW;
                        }else if(speed == DriveSpeed.STOP){
                            newState = DriveState.NEVER_FAST;
                            speedViolation(desiredFloor);
                        }
                        break;
                    case FASTER_THAN_SLOW:
                        if(speed < DriveSpeed.SLOW + SMALL_OFFSET){
                            newState = DriveState.PREMATURE_DECELERATION;
                            speedViolation(desiredFloor);
                        }else if(floorDistance < stoppingDistance){
                            newState = DriveState.DECELERATION_ZONE;
                        }
                        break;
                    case DECELERATION_ZONE:
                        if(speed == DriveSpeed.STOP){
                            newState = DriveState.STOPPED;
                        }
                        break;
                    case PREMATURE_DECELERATION:
                        if(speed == DriveSpeed.STOP){
                            newState = DriveState.STOPPED;
                        }
                        break;
                    case NEVER_FAST:
                        if(speed == DriveSpeed.SLOW - SMALL_OFFSET){
                            newState = DriveState.SLOW;
                        }
                        break;
                    default:
                        warning("WARNING: UNKNOWN STATE IN DRIVE_STATE");
                        break;
                }
            
                //set the newState
                state = newState;
            }

        }        

    }


    private class ConditionalStopwatch {

        private boolean isRunning = false;
        private SimTime startTime = null;
        private SimTime accumulatedTime = SimTime.ZERO;

        /**
         * Call to start the stopwatch
         */
        public void start() {
            if (!isRunning) {
                startTime = Harness.getTime();
                isRunning = true;
            }
        }

        /**
         * stop the stopwatch and add the last interval to the accumulated total
         */
        public void commit() {
            if (isRunning) {
                SimTime offset = SimTime.subtract(Harness.getTime(), startTime);
                accumulatedTime = SimTime.add(accumulatedTime, offset);
                startTime = null;
                isRunning = false;
            }
        }

        /**
         * stop the stopwatch and discard the last interval
         */
        public void reset() {
            if (isRunning) {
                startTime = null;
                isRunning = false;
            }
        }

        public SimTime getAccumulatedTime() {
            return accumulatedTime;
        }

        public boolean isRunning() {
            return isRunning;
        }
    }

    /**
     * Keep track of the accumulated time for an event
     */
    private class Stopwatch {

        private boolean isRunning = false;
        private SimTime startTime = null;
        private SimTime accumulatedTime = SimTime.ZERO;

        /**
         * Start the stopwatch
         */
        public void start() {
            if (!isRunning) {
                startTime = Harness.getTime();
                isRunning = true;
            }
        }

        /**
         * Stop the stopwatch and add the interval to the accumulated total
         */
        public void stop() {
            if (isRunning) {
                SimTime offset = SimTime.subtract(Harness.getTime(), startTime);
                accumulatedTime = SimTime.add(accumulatedTime, offset);
                startTime = null;
                isRunning = false;
            }
        }

        public SimTime getAccumulatedTime() {
            return accumulatedTime;
        }

        public boolean isRunning() {
            return isRunning;
        }
    }

    /**
     * Utility class to implement an event detector
     */
    private abstract class EventDetector {

        boolean previousState;

        public EventDetector(boolean initialValue) {
            previousState = initialValue;
        }

        public void updateState(boolean currentState) {
            if (currentState != previousState) {
                previousState = currentState;
                eventOccurred(currentState);
            }
        }

        /**
         * subclasses should overload this to make something happen when the event
         * occurs.
         * @param newState
         */
        public abstract void eventOccurred(boolean newState);
    }

    @Override
    public void timerExpired(Object callbackData) {
        // TODO Auto-generated method stub
        
    }

    @Override
    protected String[] summarize() {
        String[] arr = new String[1];
        arr[0] = "No summary implemented yet";
        return arr;
    }
}