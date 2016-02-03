/*
 * Utility.java
 * 18-649 Distributed Embedded Systems
 * Group 11
 * Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
 */
// !@

package simulator.elevatorcontrol;
import java.util.HashMap;
import simulator.elevatormodules.AtFloorCanPayloadTranslator;
import simulator.elevatormodules.DoorClosedCanPayloadTranslator;
import simulator.elevatormodules.DoorOpenedCanPayloadTranslator;
import simulator.elevatormodules.LevelingCanPayloadTranslator;
import simulator.elevatormodules.HoistwayLimitSensorCanPayloadTranslator;
import simulator.payloads.CANNetwork;
import simulator.framework.Elevator;
import simulator.framework.Direction;
import simulator.framework.Hallway;
import simulator.framework.Harness;
import simulator.framework.ReplicationComputer;
import simulator.framework.Side;
import simulator.payloads.CanMailbox;
import simulator.payloads.CanMailbox.ReadableCanMailbox;
import simulator.elevatorcontrol.CarCallCanPayloadTranslator;
import simulator.elevatorcontrol.DoorMotorCommandCanPayloadTranslator;
import simulator.elevatorcontrol.HallCallCanPayloadTranslator;
import simulator.elevatorcontrol.Utility.AtFloorArray;

/**
 * This class provides some useful utility classes that are used by other
 * controllers to centralize computation and remove unneeded complexity from
 * controller implementations.
 *
 * @author ddsantor
 */
public class Utility {
    
    // general constants
    public static final int MAX_WEIGHT      = 14000;
    
    /**
     * AtFloorArray - 
     * This class provides useful utilities to deal with all mAtFloor messages
     */
    public static class AtFloorArray {
        
        // public members
        public HashMap<Integer, AtFloorCanPayloadTranslator> networkAtFloorsTranslators = new HashMap<Integer, AtFloorCanPayloadTranslator>();
        public final int numFloors = Elevator.numFloors;


        // constructor - create AtFloorArray
        public AtFloorArray(CANNetwork.CanConnection conn) {
            for (int i = 0; i < numFloors; i++) {
                int floor = i + 1;
                for (Hallway h : Hallway.replicationValues) {
                    int index = ReplicationComputer.computeReplicationId(floor, h);
                    ReadableCanMailbox m = CanMailbox.getReadableCanMailbox(MessageDictionary.AT_FLOOR_BASE_CAN_ID + index);
                    AtFloorCanPayloadTranslator t = new AtFloorCanPayloadTranslator(m, floor, h);
                    conn.registerTimeTriggered(m);
                    networkAtFloorsTranslators.put(index, t);
                }
            }
        }
        
        /**
         * isAtFloor - 
         * Determines if the car is at floor and hallway
         * 
         * @param floor     integer represenatation of the floor in question
         * @param hallway   hallwa in question
         * @returns         boolean that reflects whether the car is at floor and hallway
         */
        public boolean isAtFloor(int floor, Hallway hallway) {
            // hallway in question is BOTH hallways
            if(hallway == Hallway.BOTH) {
                return (networkAtFloorsTranslators.get(ReplicationComputer.computeReplicationId(floor, Hallway.FRONT)).getValue() &&
                    networkAtFloorsTranslators.get(ReplicationComputer.computeReplicationId(floor, Hallway.BACK)).getValue());

            } 
            else {
                return networkAtFloorsTranslators.get(ReplicationComputer.computeReplicationId(floor, hallway)).getValue();
            }
        }

        /**
         * getCurrentFloor -
         * Return the current floor where mAtFloor is true, if any
         * 
         * @returns     integer representation of the floor for which mAtFloor is true
         */
        public int getCurrentFloor() {
            // initialize
            int retval = MessageDictionary.NONE;
            
            // loop through all floors
            for (int i = 0; i < numFloors; i++) {
                int floor = i + 1;
                // loop through all hallways
                for (Hallway h : Hallway.replicationValues) {
                    // get correct mailbox
                    int index = ReplicationComputer.computeReplicationId(floor, h);
                    AtFloorCanPayloadTranslator t = networkAtFloorsTranslators.get(index);
                    // if the current floors mAtFloor is true, decifer the consequences
                    if (t.getValue()) {
                        if (retval == MessageDictionary.NONE) {
                            //this is the first true atFloor
                            retval = floor;
                        } else if (retval != floor) {
                            //found a second floor that is different from the first one
                            throw new RuntimeException("AtFloor is true for more than one floor at " + Harness.getTime());
                        }
                    }
                }
            }
            return retval;
        }
        
        /**
         * getCurrentHallway - 
         * Return the current hallway where mAtFloor is true, if any
         * 
         * @returns     hallway(s) for which mAtFloor is true
         */
        public Hallway getCurrentHallway() {
            // initialization
            Hallway currentHallway = Hallway.NONE;

            // get currentFloor
            int currentFloor = getCurrentFloor();
            
            // only compute if the car is at a floor
            if(currentFloor != MessageDictionary.NONE) {
                //if (isAtFloor(currentFloor, Hallway.FRONT) && isAtFloor(currentFloor, Hallway.BACK)) {
                if(isAtFloor(currentFloor, Hallway.BOTH)) {
                    currentHallway = Hallway.BOTH;
                } else if (isAtFloor(currentFloor, Hallway.FRONT)) {
                    currentHallway = Hallway.FRONT;
                } else if (isAtFloor(currentFloor, Hallway.BACK)) {
                    currentHallway = Hallway.BACK;
                }
            }
            return currentHallway;
        }
    }
    
    /**
     * CarCallArray - 
     * This class provides useful utilities for all mCarCall messages.
     */
    public static class CarCallArray {
        // public members 
        public HashMap<Integer, CarCallCanPayloadTranslator> networkCarCallTranslators = new HashMap<Integer, CarCallCanPayloadTranslator>();
        public final int NUM_FLOORS = Elevator.numFloors;

        // constructor - create CarCallArray
        public CarCallArray(CANNetwork.CanConnection conn) {
            int floor;
            for (int i = 0; i < NUM_FLOORS; i++) {
                floor = i + 1;
                for (Hallway h : Hallway.replicationValues) {
                    int index = ReplicationComputer.computeReplicationId(floor, h);
                    ReadableCanMailbox m = CanMailbox.getReadableCanMailbox(MessageDictionary.CAR_CALL_BASE_CAN_ID + index);
                    CarCallCanPayloadTranslator t = new CarCallCanPayloadTranslator(m, floor, h);
                    conn.registerTimeTriggered(m);
                    networkCarCallTranslators.put(index, t);
                }
            }
        }

        /**
         * isCarCall -
         * Determines if there is a car call at f
         * 
         * @param f     integer represenation of floor in question
         * @returns     boolean indicating the existence of a car call at f,d
         */
         public boolean isCarCall(int f) {
            // ensure f is a valid floor
            if(Floor.isValidFloor(f)) {
                for(Hallway h : Hallway.replicationValues) {
                    if (networkCarCallTranslators.get(ReplicationComputer.computeReplicationId(f, h)).getValue()) {
                        return true;
                    }
                }
            }
            return false;
        }
        
        /**
         * isCarCall -
         * Determines if there is a car call at f, h
         * 
         * @param f     integer represenation of floor in question
         * @param h     hallway in question
         * @returns     boolean indicating the existence of a car call at f,d
         */
        public boolean isCarCall(int f, Hallway h) {
            // ensure f is a valid floor
            if(Floor.isValidFloor(f) && (h != Hallway.NONE)) {
                if(h == Hallway.BOTH) {
                    return (networkCarCallTranslators.get(ReplicationComputer.computeReplicationId(f, Hallway.FRONT)).getValue() &&
                            networkCarCallTranslators.get(ReplicationComputer.computeReplicationId(f, Hallway.BACK)).getValue());
                } else if (h != Hallway.NONE) {
                    return networkCarCallTranslators.get(ReplicationComputer.computeReplicationId(f, h)).getValue();
                }
            }
            return false;
        }
        
        /** 
         * isCarCallBetween
         * Determine if there is a car call between currentFloor and targetF
         * 
         * @param currentFloor  integer representation of the starting floor
         * @param targetF       integer represenation of the final floor
         * @returns             boolean indicating the existence of a car 
         *                          call between currentFloor and targetF
         */
        public boolean isCarCallBetween(int currentFloor, int targetF) {
            // targetF > currentFloor = iterate up
            if(targetF > currentFloor) {
                for(int f = (currentFloor + 1); f < targetF; f++) {
                    for (Hallway h : Hallway.replicationValues) {
                        if(networkCarCallTranslators.get(ReplicationComputer.computeReplicationId(f, h)).getValue()) {
                            return true;
                        }                     
                    }
                }
            } 
            // targetF < currentFloor = iterate down
            else if (targetF < currentFloor) {
                for (int f = (currentFloor - 1); f > targetF; f--) {
                    for (Hallway h : Hallway.replicationValues) {
                        if(networkCarCallTranslators.get(ReplicationComputer.computeReplicationId(f, h)).getValue()) {
                            return true;
                        }                     
                    }                   
                }
            }
            return false;
        }
        
        /** 
         * isCarCallInDir
         * Determine if there is a car call at a floor in searchDirection from currentFloor
         * 
         * @param currentFloor      integer representation of the starting floor
         * @param searchDirection   direction to search
         * @returns                 boolean indicating the existence of car call
         *                              at a floor in searchDirection from currentFloor
         */
        public boolean isCarCallInDir(int currentFloor, Direction searchDirection) {
            int f;
            if (searchDirection == Direction.UP) {
                return (isCarCallBetween(currentFloor, Floor.LAST_FLOOR) || 
                        isCarCall(Floor.LAST_FLOOR));
            } else if (searchDirection == Direction.DOWN) {
                return (isCarCallBetween(currentFloor, Floor.FIRST_FLOOR) || 
                        isCarCall(Floor.FIRST_FLOOR));
            }
            return false;
        }
 
        /** 
         * firstCarCallBetween - 
         * Return the first floor with a car call between currentFloor and targetF
         * 
         * @param currentFloor  integer representation of the floor from which to start the search
         * @param targetF       integer representation of the floor to end the search
         * @returns             integer representation of the floor, if any, between the currentFloor
         *                          and targetF with a car call
         */
        public int firstCarCallBetween(int currentFloor, int targetF) {
            // targetF > currentFloor = iterate up
            if(targetF > currentFloor) {
                for(int f = (currentFloor + 1); f < targetF; f++) {
                    for (Hallway h : Hallway.replicationValues) {
                        if(networkCarCallTranslators.get(ReplicationComputer.computeReplicationId(f, h)).getValue()) {
                            return f;
                        }                     
                    }
                }
            } 
            // targetF < currentFoor = iterate down
            else if (targetF < currentFloor) {
                for (int f = (currentFloor - 1); f > targetF; f--) {
                    for (Hallway h : Hallway.replicationValues) {
                        if(networkCarCallTranslators.get(ReplicationComputer.computeReplicationId(f, h)).getValue()) {
                            return f;
                        }                     
                    }                   
                }
            }
            return Floor.INVALID_FLOOR;
        }
        
        /**
         * firstCarCallInDir -
         * Return the first car call in searchDirection in currentFloor
         * 
         * @param currentFloor      integer representation of the floor from 
         *                              which to start the search
         * @param searchDirection   direction of search
         * @returns                 integer representation of the floor, if any, 
         *                              in searchDirection of the currentFloor
         *                              with a car call.
         */
         public int firstCarCallInDir(int currentFloor, Direction searchDirection) {
            int new_target = Floor.INVALID_FLOOR; 
            if (searchDirection == Direction.UP) {
                new_target = firstCarCallBetween(currentFloor, Floor.LAST_FLOOR);
                if(!Floor.isValidFloor(new_target) && isCarCall(Floor.LAST_FLOOR)) {
                    new_target = Floor.LAST_FLOOR;
                }
                return new_target;
            } else if (searchDirection == Direction.DOWN) {
                new_target = firstCarCallBetween(currentFloor, Floor.FIRST_FLOOR);
                if(!Floor.isValidFloor(new_target) && isCarCall(Floor.FIRST_FLOOR)) {
                    new_target = Floor.FIRST_FLOOR;
                }
                return new_target;
            }
            return Floor.INVALID_FLOOR;
        }
        
        
        /**
         * getCarCallHallway
         * Return the hallway for whichever mCarCall is true at floor f
         * 
         * @param f     integer representation of floor in question
         * @returns     whichever hallways for which mCarCall f,h is true
         */
        public Hallway getCarCallHallway(int f) {
            // both hallways are true
            if(networkCarCallTranslators.get(ReplicationComputer.computeReplicationId(f, Hallway.BACK)).getValue() &&
              networkCarCallTranslators.get(ReplicationComputer.computeReplicationId(f, Hallway.FRONT)).getValue()) {
                return Hallway.BOTH;
            }
            // only back
            else if(networkCarCallTranslators.get(ReplicationComputer.computeReplicationId(f, Hallway.BACK)).getValue()) {
                return Hallway.BACK;
            }
            // only front
            else if(networkCarCallTranslators.get(ReplicationComputer.computeReplicationId(f, Hallway.FRONT)).getValue()) {
                return Hallway.FRONT;
            }
            // else NO CarCall
            else {
                return Hallway.NONE;
            }
        }
    }

   /**
     * DoorClosedArray - 
     * This class provides useful utilities to deal with all mDoorsClosed messages
     */    
     public static class DoorClosedArray {

        // public members
        public HashMap<Integer, DoorClosedCanPayloadTranslator> translatorArray = new HashMap<Integer, DoorClosedCanPayloadTranslator>();
        public final Hallway hallway;

        // constructor - create DoorClosedArray
        public DoorClosedArray(Hallway hallway, CANNetwork.CanConnection conn) {
            this.hallway = hallway;
            for (Side s : Side.values()) {
                int index = ReplicationComputer.computeReplicationId(hallway, s);
                ReadableCanMailbox m = CanMailbox.getReadableCanMailbox(MessageDictionary.DOOR_CLOSED_SENSOR_BASE_CAN_ID + index);
                DoorClosedCanPayloadTranslator t = new DoorClosedCanPayloadTranslator(m, hallway, s);
                conn.registerTimeTriggered(m);
                translatorArray.put(index, t);
            }
        }

        /**
         * getBothClosed -
         * Determine if both doors are closed.
         * 
         * @returns     boolean indicating if the doors are closed
         */
        public boolean getBothClosed() {
            return translatorArray.get(ReplicationComputer.computeReplicationId(hallway, Side.LEFT)).getValue() &&
                    translatorArray.get(ReplicationComputer.computeReplicationId(hallway, Side.RIGHT)).getValue();
        }
    }
    
   /**
     * DoorOpenedArray - 
     * This class provides useful utilities to deal with all mDoorsClosed messages
     */    
     public static class DoorOpenedArray {

        // public members
        public HashMap<Integer, DoorOpenedCanPayloadTranslator> translatorArray = new HashMap<Integer, DoorOpenedCanPayloadTranslator>();
        public final Hallway hallway;

        // constructor - create DoorClosedArray
        public DoorOpenedArray(Hallway hallway, CANNetwork.CanConnection conn) {
            this.hallway = hallway;
            for (Side s : Side.values()) {
                int index = ReplicationComputer.computeReplicationId(hallway, s);
                ReadableCanMailbox m = CanMailbox.getReadableCanMailbox(MessageDictionary.DOOR_OPEN_SENSOR_BASE_CAN_ID + index);
                DoorOpenedCanPayloadTranslator t = new DoorOpenedCanPayloadTranslator(m, hallway, s);
                conn.registerTimeTriggered(m);
                translatorArray.put(index, t);
            }
        }

        /**
         * getBothClosed -
         * Determine if both doors are closed.
         * 
         * @returns     boolean indicating if the doors are closed
         */
        public boolean getBothOpened() {
            return translatorArray.get(ReplicationComputer.computeReplicationId(hallway, Side.LEFT)).getValue() &&
                    translatorArray.get(ReplicationComputer.computeReplicationId(hallway, Side.RIGHT)).getValue();
        }
    }

   /**
     * DoorMotorArray - 
     * This class provides useful utilities to deal with all mDoorMotor messages
     */   
    public static class DoorMotorArray {
        // public members
        public HashMap<Integer, DoorMotorCommandCanPayloadTranslator> translatorArray = new HashMap<Integer, DoorMotorCommandCanPayloadTranslator>();
        public final Hallway hallway;

        // constructor - create DoorClosedArray
        public DoorMotorArray(Hallway hallway, CANNetwork.CanConnection conn) {
            this.hallway = hallway;
            for (Side s : Side.values()) {
                int index = ReplicationComputer.computeReplicationId(hallway, s);
                ReadableCanMailbox m = CanMailbox.getReadableCanMailbox(MessageDictionary.DOOR_MOTOR_COMMAND_BASE_CAN_ID + index);
                DoorMotorCommandCanPayloadTranslator t = new DoorMotorCommandCanPayloadTranslator(m, hallway, s);
                conn.registerTimeTriggered(m);
                translatorArray.put(index, t);
            }
        }

        /**
         * isStopped -
         * Determines if both door motors have been commanded to stop.
         * 
         * @returns     boolean indicating if both door motors have been 
         *                  commanded to stop.
         */
        public boolean isStopped() {
            int STOPPED = DoorMotorCommand.STOP;
            return (translatorArray.get(ReplicationComputer.computeReplicationId(hallway, Side.LEFT)).getValue() == STOPPED) &&
                    (translatorArray.get(ReplicationComputer.computeReplicationId(hallway, Side.RIGHT)).getValue() == STOPPED);
        }
        
        /**
         * isOpening - 
         * Determines if either of the doors have been commanded to open.
         * 
         * @returns     boolean indicating if at least one of the door motors
         *                  have been commanded to open
         */
        public boolean isOpening() {
            int OPENING = DoorMotorCommand.OPEN;
            return (translatorArray.get(ReplicationComputer.computeReplicationId(hallway, Side.LEFT)).getValue() == OPENING) ||
                    (translatorArray.get(ReplicationComputer.computeReplicationId(hallway, Side.RIGHT)).getValue() == OPENING);            
        }
    } 
    
    // Defines each DoorMotorCommand
    public static class DoorMotorCommand {
        public static final int OPEN = 0;
        public static final int CLOSE = 1;
        public static final int STOP = 2;
        public static final int NUDGE = 3;
    }
    
    // Defines each DriveSpeed command
    public static class DriveSpeed {
        public static final int STOP = 0;
        public static final int SLOW = 250;     // mm/s
        public static final int FAST = 5000;    // mm/s
        public static final int ACCELERATION    = 1000; // mm/s^2
        public static final int SPEED_CONV      = 1000; // m/s -> mm/s
    }

    /**
     * Floor -
     * This class contains constant and useful utilities that address floors 
     * and their commit points.
     */
    public static class Floor {
        // general constants
        public static final int INVALID_FLOOR   = 0;
        public static final int FIRST_FLOOR     = 1;
        public static final int LAST_FLOOR      = 8;
        
        // commit ponit constants
        public static final int MM_PER_FLOOR        = 5000;
        public static final double DECEL_TIME       = 0.120;     // s
        private static final double MAX_NETWORK_DELAY = 0.250;  // s
        
        /**
         * floorDirection -
         * Return which directdion must be traveled to go from floor start
         * to floor end.
         * 
         * @param start integer floor representing the start floor
         * @param end   integer floor representing the ending floor
         * @returns     direction that end floor is from start floro
         */
        public static Direction floorDirection(int start, int end) {
            // ensure both floors are valid
            if((start == Floor.INVALID_FLOOR) || (end == Floor.INVALID_FLOOR)) {
                return Direction.STOP;
            } 
            // start > end
            else if(start > end) {
                return Direction.DOWN;
            } 
            // end > start
            else if (start < end) {
                return Direction.UP;
            } 
            // start == end
            else if (start == end) {
                return Direction.STOP;
            }
            // one of the above conditionals must be true. Otherwise, throw and exception
            throw new RuntimeException("UTILITY.JAVA: No return from floorDirection.");

        }
        
        /** 
         * isValidFloor -
         * Determine if floor is a valid floor.
         * 
         * @param floor integer floor in question
         * @returns     boolean reflecting the validity of floor
         */
        public static boolean isValidFloor(int floor) {
            return (floor != Floor.INVALID_FLOOR);
        }
        
        /**
         * isValidFloor - 
         * Determin is floor, h is a valid floor.
         * 
         * @param floor integer floor in question
         * @param h     hallway in question
         * @returns     boolean reflecting the validity of floor,h
         */
        public static boolean isValidFloor(int floor, Hallway h) {
            if((floor == 1) || (floor == 7)) {
                return true;
            } else if ((floor == 2) && (h == Hallway.BACK)) {
                return true;
            } else if ((floor != 2) && (h == Hallway.FRONT)) {
                return true;
            }
            return false;
        }
        
        /**
         * stooppingDistance -
         * Determine the distance required to stop based on current speed.
         * 
         * @param s     integer represenation of the current speed in mm/s
         * @returns     double containing the distance required to stop in mm
         */ 
        public static double stoppingDistance(int s) {
            double min_stopping_distance = (s*s)/(2*DriveSpeed.ACCELERATION);
            double offset;
            
            // FAST <= s -> no acceleration
            if(DriveSpeed.FAST <= s) {
                offset = s*MAX_NETWORK_DELAY;
                return (min_stopping_distance + offset);
            } 
            // SLOW < s < FAST -> still accelerating towards fast speed
            else if((DriveSpeed.SLOW < s) && (s < DriveSpeed.FAST)) {
                offset = (s*MAX_NETWORK_DELAY) + (0.5*DriveSpeed.ACCELERATION*MAX_NETWORK_DELAY*MAX_NETWORK_DELAY);
                return (min_stopping_distance + offset);
            } 
            // 0 <= s <= SLOW -> can stop at any time
            else {
                return 0;
            }
            // s < 0 -> fault case
            /*else {
                throw new RuntimeException("UTILITY.JAVA: Speed less than 0 -> stoppingDistance.");
            }*/

        }
        
        /**
         * stoppingDistance -
         * Determine the distance required to stop based on current speed.
         * 
         * @param s             integer representation of the current speed in mm/s
         * @param extra_time    int to add to MAX_NETWORK_DELAY to ensure DriveControl
         *                          slows down before commit point is reached
         * @returns             double containing the distance required to stop in mm
         */
        public static double stoppingDistance(int s, double extra_time) {
            double min_stopping_distance = (s*s)/(2*DriveSpeed.ACCELERATION);
            double offset;
            double network_delay = MAX_NETWORK_DELAY + extra_time;
            // FAST <= s -> no acceleration
            if(DriveSpeed.FAST <= s) {
                offset = s*network_delay;
                return (min_stopping_distance + offset);
            } 
            // SLOW < s < FAST -> still accelerating towards fast speed
            else if((DriveSpeed.SLOW < s) && (s < DriveSpeed.FAST)) {
                offset = (s*network_delay) + (0.5*DriveSpeed.ACCELERATION*network_delay*network_delay);
                return (min_stopping_distance + offset);
            } 
            // 0 <= s <= SLOW -> can stop at any time
            else {
                return 0;
            }        
        }

        /**
         * carIsAboveFloor -
         * Determine if car is above floor f.
         * 
         * @param f     integer representation of floor in question
         * @param p     integer representation of the current position in mm
         * @returns     true if car is above floor f, false otherwise
         */
        public static boolean carIsAboveFloor(int f, int p) {
            // get floor f's position
            int floorPosition = (f-1)*MM_PER_FLOOR;
            
            // determine if car is above
            return (p > floorPosition);
        }
        
        /**
         * floorDistance -
         * Determine the distance the car is from floor f given current position
         * and the direction of travel.
         * 
         * @param f     integer representation of the target floor
         * @param p     integer representation of the current position in mm
         * @param d     direction of travel
         * @returns     double containing how far the car is from floor f given 
         *                  the current position p
         */
        public static double floorDistance(int f, int p, Direction d) {
            // initialization
            double floorDistance;
            
            // determine floor distance based on direction
           if(d == Direction.UP) {
                floorDistance = (MM_PER_FLOOR*(f - 1)) - p;
            } else if (d == Direction.DOWN) {
                floorDistance = p - (MM_PER_FLOOR*(f - 1));
            } else if (d == Direction.STOP) {
                floorDistance = 0;
            } else {
                throw new RuntimeException("UTILITY.JAVA: Direction not recognized -> floorDistance.");
            }
            return floorDistance;
        }
        
        /**
         * commitPoint -
         * return whether or not the commit point for floor f has been reached
         * 
         * @param f     integer represenation for the floor in question
         * @param s     integer represenation of the current speed in mm/s
         * @param p     integer represenation fo the current position in mm
         * @param currentFloor  integer represenation for the last floor where 
         *                          mAtFloor was received as true
         * @returns     true if the commit point has been reached, false otherwise
         * NOTE:    commit point reached -> can no longer stop at floor f
         *          commit point not reached -> can stop at floor f
         */
        public static boolean commitPoint(int f, int s, int p, Direction d, int currentFloor) {
            // determine if the car is above the floor
            boolean carIsAboveFloor = carIsAboveFloor(f,p);
            
            // if drive speed is greater than SLOW
            if(s > DriveSpeed.SLOW) {
                return (floorDistance(f, p, d) < stoppingDistance(s));
            } 
            // if floor in question and the current floor AND drive speed is greater than SLOW
            else if(!(f == currentFloor) && (s > DriveSpeed.STOP)){
                return ((carIsAboveFloor && (d==Direction.UP)) || (!carIsAboveFloor && (d==Direction.DOWN)));
            }
            return false;
        }

        /**
         * startDecel - 
         * This mimicks commitPoint but has additional padding for DriveControl
         * to determine when it is time to start slowing down.
         * 
         * @param f     integer represenatation of the floor in question
         * @param s     integer represenatation of the current speed of the car in mm/s
         * @param p     integer represenatation of the current position of the car in mm
         * @param d     direction of travel
         * @returns     true if the car should start decelerating, false otherwise
         */
        public static boolean startDecel(int f, int s, int p, Direction d) {
            // if drive speed is greater than SLOW
            if(s > DriveSpeed.SLOW) {
                return (floorDistance(f, p, d) < stoppingDistance(s, DECEL_TIME));
            } 
            return false;
        }
        
        /**
         * commitFloor -
         * Return the closest floor in currentDirection from commit floor that can be stopped at.
         * 
         * @param commitFloor       integer representation for the last floor for 
         *                              which commitPoint was true
         * @param currentSpeed      integer represenation for the current speed of 
         *                              the car in mm/s
         * @param currentPosition   integer represenation for the current position
         *                              of the car in mm
         * @param currentDirection  direction of travel
         * @param currentFloor      integer represenation of the last floor where
         *                              mAtFloor was true
         * @returns                 integer represenation of the closest floor
         *                              in currentDirection where the car can be stopped
         */
        public static int commitFloor(int commitFloor, int currentSpeed, int currentPosition, Direction currentDirection, int currentFloor) {
            // only recompute the commitFloor when the car is moving
            if(currentDirection != Direction.STOP) {
                // loop until commitPoint returns 'false' for commit floor
                while(commitPoint(commitFloor, currentSpeed, currentPosition, currentDirection, currentFloor)) {
                    // increment commitFloor by 1 based on the currentDirection
                    if(currentDirection == Direction.UP) {
                        commitFloor++;
                    } else if (currentDirection == Direction.DOWN) {
                        commitFloor--;
                    } else if (currentDirection == Direction.STOP) {
                        throw new RuntimeException("UTILITY.JAVA: Invalid currentDirection == Direction.STOP -> commitFloor");
                    } else {
                        throw new RuntimeException("UTILITY.JAVA: Direction not recognized -> commitFloor");
                    }
                }               
            } else {
                commitFloor = currentFloor;
            }
            
            // ensure that commitFloor is always in bounds
            if(commitFloor > Floor.LAST_FLOOR) {
                commitFloor = Floor.LAST_FLOOR;
            } else if (commitFloor < Floor.FIRST_FLOOR) {
                commitFloor = Floor.FIRST_FLOOR;
            }
            return commitFloor;
        }
    }
    
    /**
     * HallCallArray - 
     * This class provides useful utilities for all mHallCall messages.
     */    
     public static class HallCallArray {
        
        // public members 
        public HashMap<Integer, HallCallCanPayloadTranslator> networkHallCallTranslators = new HashMap<Integer, HallCallCanPayloadTranslator>();
        public final int NUM_FLOORS = Elevator.numFloors;

        // constructor - create HallCallArray
        public HallCallArray(CANNetwork.CanConnection conn) {
            int floor;
            for (int i = 0; i < NUM_FLOORS; i++) {
                floor = i + 1;
                for (Hallway h : Hallway.replicationValues) {
                    for(Direction d : Direction.replicationValues) {
                        int index = ReplicationComputer.computeReplicationId(floor, h, d);
                        ReadableCanMailbox m = CanMailbox.getReadableCanMailbox(MessageDictionary.HALL_CALL_BASE_CAN_ID + index);
                        HallCallCanPayloadTranslator t = new HallCallCanPayloadTranslator(m, floor, h, d);
                        conn.registerTimeTriggered(m);
                        networkHallCallTranslators.put(index, t);
                    }
                }
            }
        }
        
        /**
         * isHallCall -
         * Determine if there is a hall call at floor f,h in direction d
         * 
         * @param f     integer representation of floor in question
         * @param h     hallway in question
         * @param d     direction of hall call
         * @returns     boolean indicating whether or not there is a hall call at f,b,d
         */
        public boolean isHallCall(int f, Hallway h, Direction d) {
            if(Floor.isValidFloor(f) && (d != Direction.STOP) && (h != Hallway.NONE)) {
                // case where both halways should be considered
                if(h == Hallway.BOTH) {
                    return (networkHallCallTranslators.get(ReplicationComputer.computeReplicationId(f, Hallway.FRONT, d)).getValue() &&
                            networkHallCallTranslators.get(ReplicationComputer.computeReplicationId(f, Hallway.BACK, d)).getValue());
                } else {
                    return networkHallCallTranslators.get(ReplicationComputer.computeReplicationId(f, h, d)).getValue();
                }                
            }
            return false;
        }
        
        /**
         * isHallCall -
         * Determine if there is a hall call at floor f,h
         * 
         * @param f     integer representation of floor in question
         * @param h     hallway in question
         * @returns     boolean whether or not there is a hall call at floor f,h
         */
        public boolean isHallCall(int f, Hallway h) {
            // ensure valid floor
            if(Floor.isValidFloor(f) && (h != Hallway.NONE)) {
                // case where both hallways should be considered
                if(h == Hallway.BOTH) {
                    // check all directions
                    for(Direction d : Direction.replicationValues) {
                        if(networkHallCallTranslators.get(ReplicationComputer.computeReplicationId(f, Hallway.FRONT, d)).getValue() &&
                            networkHallCallTranslators.get(ReplicationComputer.computeReplicationId(f, Hallway.BACK, d)).getValue()) {
                            return true;
                        }
                    }  
                }
                // more explicitly this is: "else if((h == Hallway.FRONT) || (h == Hallway.BACK" 
                else if (h != Hallway.NONE) {
                    // check all directions
                    for(Direction d : Direction.replicationValues) {
                        if(networkHallCallTranslators.get(ReplicationComputer.computeReplicationId(f, h, d)).getValue()) {
                            return true;
                        }
                    }                
                }
            }
            return false;
        }
        
        /**
         * isHallCall -
         * Determine if there is a hall call at floor f,d
         * 
         * @param f     integer representation of floor in question
         * @param d     direction of hall call
         * @returns     boolean whether or not there is a hall call at floor f,h
         */
        public boolean isHallCall(int f, Direction d) {
            // ensure valid floor and direction
            if (Floor.isValidFloor(f) && (d != Direction.STOP)) {
                // look at both hallways
                for(Hallway h : Hallway.replicationValues) {
                    if(networkHallCallTranslators.get(ReplicationComputer.computeReplicationId(f, h, d)).getValue()) {
                        return true;
                    }
                }                
            }
            return false;
        }
        
        /**
         * isHallCall -
         * Determine if there is a hall call at floor f
         * 
         * @param f     integer representation of floor in question
         * @returns     boolean whether or not there is a hall call at floor f
         */        
         public boolean isHallCall(int f) {
             // ensure floor is valid
            if(Floor.isValidFloor(f)) {
                // look at both hallways
                for(Hallway h : Hallway.replicationValues) {
                    // look at both directions
                    for(Direction d : Direction.replicationValues) {
                        if(networkHallCallTranslators.get(ReplicationComputer.computeReplicationId(f, h, d)).getValue()) {
                            return true;
                        }
                    }
                }
            }
            return false;
        }
        
        /** 
         * isHallCallBetween - 
         * Determine if there is a hall call between currentFloor and targetF in callDirection
         * 
         * @param currentFloor  integer representation of the starting floor
         * @param targetF       integer represenation of the final floor
         * @param callDirection direction of call in quesion
         * @returns             boolean indicating the existence of a hall 
         *                          call between currentFloor and targetF
         */        
         public boolean isHallCallBetween(int currentFloor, int targetF, Direction callDirection) {
            // targetF > currentFloor - search up
            if(targetF > currentFloor) {
                // iterate up
                for(int f = (currentFloor + 1); f < targetF; f++) {
                    // look at both hallways
                    for (Hallway h : Hallway.replicationValues) {
                        if(networkHallCallTranslators.get(ReplicationComputer.computeReplicationId(f, h, callDirection)).getValue()) {
                            return true;
                        }                     
                    }
                }
            }
            // targetF < currentFloor - search down
            else if (targetF < currentFloor) {
                // iterate down
                for (int f = (currentFloor - 1); f > targetF; f--) {
                    // look at both hallways
                    for (Hallway h : Hallway.replicationValues) {
                        if(networkHallCallTranslators.get(ReplicationComputer.computeReplicationId(f, h, callDirection)).getValue()) {
                            return true;
                        }                     
                    }                   
                }
            }
            return false;
        }
        
        /** 
         * isHallCallBetween - 
         * Determine if there is a hall call between currentFloor and targetF
         * 
         * @param currentFloor  integer representation of the starting floor
         * @param targetF       integer represenation of the final floor
         * @returns             boolean indicating the existence of a hall 
         *                          call between currentFloor and targetF
         */    
         public boolean isHallCallBetween(int currentFloor, int targetF) {
            // targetF > currentFloor - search up
            if(targetF > currentFloor) {
                // iterate up
                for(int f = (currentFloor + 1); f < targetF; f++) {
                    // check both hallways
                    for (Hallway h : Hallway.replicationValues) {
                        // check both directions
                        for(Direction d : Direction.replicationValues) {
                            if(networkHallCallTranslators.get(ReplicationComputer.computeReplicationId(f, h, d)).getValue()) {
                                return true;
                            }    
                        }
                    }
                }
            } 
            // targetF < currentFloor - search down
            else if (targetF < currentFloor) {
                // iterate down
                for (int f = (currentFloor - 1); f > targetF; f--) {
                    // check both hallways
                    for (Hallway h : Hallway.replicationValues) {
                        // check both directions
                        for(Direction d : Direction.replicationValues) {
                            if(networkHallCallTranslators.get(ReplicationComputer.computeReplicationId(f, h, d)).getValue()) {
                                return true;
                            }    
                        }                  
                    }                   
                }
            }
            return false;
        }
        
        /** 
         * isHallCallInDir - 
         * Determine if there is a hall call for callDirection at a floor 
         * searchDirection from currentFloor
         * 
         * @param currentFloor      integer representation of the starting floor
         * @param searchDirection   direction to search from currentFloor
         * @param callDirection     direction of hall call in question
         * @returns                 boolean indicating the existence of a hall 
         *                              call searchDirection from currentFloor
         */   
         public boolean isHallCallInDir(int currentFloor, Direction searchDirection, Direction callDirection) {
            if (searchDirection == Direction.UP) {
                return (isHallCallBetween(currentFloor, Floor.LAST_FLOOR, callDirection) ||
                        isHallCall(Floor.LAST_FLOOR));
            } else if (searchDirection == Direction.DOWN) {
                return (isHallCallBetween(currentFloor, Floor.FIRST_FLOOR, callDirection) ||
                        isHallCall(Floor.FIRST_FLOOR));
            }
            return false;
        }

        /** 
         * isHallCallInDir - 
         * Determine if there is a hall call at a floor searchDirection from currentFloor
         * 
         * @param currentFloor      integer representation of the starting floor
         * @param searchDirection   direction to search from currentFloor
         * @returns                 boolean indicating the existence of a hall 
         *                              call searchDirection from currentFloor
         */           
        public boolean isHallCallInDir(int currentFloor, Direction searchDirection) {
            if(searchDirection == Direction.UP) {
                return (isHallCallBetween(currentFloor, Floor.LAST_FLOOR) ||
                        isHallCall(Floor.LAST_FLOOR));
            }
            else if (searchDirection == Direction.DOWN) {
                return (isHallCallBetween(currentFloor, Floor.FIRST_FLOOR) || 
                        isHallCall(Floor.FIRST_FLOOR));
            }
            return false;
        }

        /** 
         * firstHallCallBetween - 
         * Return the first floor with a hall call of callDirection
         * between currentFloor and targetF where currentFloor and targetF are not included.
         * 
         * @param currentFloor  integer representation of the floor from which to start the search
         * @param targetF       integer representation of the floor to end the search
         * @param callDirection direction of call in question
         * @returns             integer representation of the floor, if any, between the currentFloor
         *                          and targetF with a hall call in callDirection
         */
         public int firstHallCallBetween(int currentFloor, int targetF, Direction callDirection) {
            // tagetF > currentFloor - search up
            if(targetF > currentFloor) {
                // iterate up
                for(int f = (currentFloor + 1); f < targetF; f++) {
                    // check both hallways
                    for (Hallway h : Hallway.replicationValues) {
                        if(networkHallCallTranslators.get(ReplicationComputer.computeReplicationId(f, h, callDirection)).getValue()) {
                            return f;
                        }                     
                    }
                }
            } 
            // targetF < currentFloor - search down
            else if (targetF < currentFloor) {
                for (int f = (currentFloor - 1); f > targetF; f--) {
                    // check both hallways
                    for (Hallway h : Hallway.replicationValues) {
                        if(networkHallCallTranslators.get(ReplicationComputer.computeReplicationId(f, h, callDirection)).getValue()) {
                            return f;
                        }                     
                    }                   
                }
            }
            return Floor.INVALID_FLOOR;
        }

        /**
         * firstHallCallInDir -
         * Return the first hall call of callDirection at a floor
         * searchDirection from the currentFloor
         * 
         * @param currentFloor      integer representation of the floor from 
         *                              which to start the search
         * @param searchDirection   direction of search
         * @param callDIrection     direction of call in question
         * @returns                 integer representation of the floor, if any, 
         *                              in searchDirection of the currentFloor
         *                              with a hall call in callDirection.
         */
        public int firstHallCallInDir(int currentFloor, Direction searchDirection, Direction callDirection) {
            int new_target = Floor.INVALID_FLOOR;
            
            if (searchDirection == Direction.UP) {
                new_target = firstHallCallBetween(currentFloor, Floor.LAST_FLOOR, callDirection);
                if(!Floor.isValidFloor(new_target) && isHallCall(Floor.LAST_FLOOR)) {
                    new_target = Floor.LAST_FLOOR;
                }
                return new_target;
            } else if (searchDirection == Direction.DOWN) {
                new_target = firstHallCallBetween(currentFloor, Floor.FIRST_FLOOR, callDirection);
                if(!Floor.isValidFloor(new_target) && isHallCall(Floor.FIRST_FLOOR)) {
                    new_target = Floor.FIRST_FLOOR;
                }
                return new_target;
            }
            return Floor.INVALID_FLOOR;
        }
        
        /**
         * getHallCallHallway
         * return the hallway(s) for which there are active hall calls of 
         * direction d at floor f
         * 
         * @param f     floor in question
         * @param d     direction in question
         * @returns     hallway of the hall call(s) at f,d
         */
        public Hallway getHallCallHallway(int f, Direction d) {
            // HallCall on both hallways
            if(networkHallCallTranslators.get(ReplicationComputer.computeReplicationId(f, Hallway.BACK, d)).getValue() &&
              networkHallCallTranslators.get(ReplicationComputer.computeReplicationId(f, Hallway.FRONT, d)).getValue()) {
                return Hallway.BOTH;
            }
            // HallCall on back hallway
            else if(networkHallCallTranslators.get(ReplicationComputer.computeReplicationId(f, Hallway.BACK, d)).getValue()) {
                return Hallway.BACK;
            }
            // HallCall on front hallway
            else if(networkHallCallTranslators.get(ReplicationComputer.computeReplicationId(f, Hallway.FRONT, d)).getValue()) {
                return Hallway.FRONT;
            }
            // else NO CarCall
            return Hallway.NONE;
        }
    }
    
    /**
     * HoistwayLimitArray - 
     * This class provides useful utilities to deal with all mHoistwayLimit messages
     */   
    public static class HoistwayLimitArray {
        // public members
        public HashMap<Integer, HoistwayLimitSensorCanPayloadTranslator> networkHoistwayLimitArray = new HashMap<Integer, HoistwayLimitSensorCanPayloadTranslator>();

        // constructor - create DoorClosedArray
        public HoistwayLimitArray(CANNetwork.CanConnection conn) {
            for (Direction d : Direction.replicationValues) {
                int index = ReplicationComputer.computeReplicationId(d);
                ReadableCanMailbox m = CanMailbox.getReadableCanMailbox(MessageDictionary.HOISTWAY_LIMIT_BASE_CAN_ID + index);
                HoistwayLimitSensorCanPayloadTranslator t = new HoistwayLimitSensorCanPayloadTranslator(m, d);
                conn.registerTimeTriggered(m);
                networkHoistwayLimitArray.put(index, t);
            }
        }        
    }
    
    /**
     * LevelArray -
     * This class provides useful utilities to deal with all mLevel messages
     */
    public static class LevelArray {
        // public members
        public HashMap<Integer, LevelingCanPayloadTranslator> networkLevelingTranslators = new HashMap<Integer, LevelingCanPayloadTranslator>();

        // constructor - create LevelArray
        public LevelArray(CANNetwork.CanConnection conn) {
            for (Direction d : Direction.replicationValues) {
                int index = ReplicationComputer.computeReplicationId(d);
                ReadableCanMailbox m = CanMailbox.getReadableCanMailbox(MessageDictionary.LEVELING_BASE_CAN_ID + index);
                LevelingCanPayloadTranslator t = new LevelingCanPayloadTranslator(m, d);
                conn.registerTimeTriggered(m);
                networkLevelingTranslators.put(index, t);
            }
        }
        
        /**
         * getLevelDirection -
         * Return the direction that leveling is required.
         * 
         * @returns     The required leveling direction
         */
        public Direction getLevelDirection() {
            boolean downLevel = networkLevelingTranslators.get(ReplicationComputer.computeReplicationId(Direction.DOWN)).getValue();
            boolean upLevel = networkLevelingTranslators.get(ReplicationComputer.computeReplicationId(Direction.UP)).getValue();
            if(downLevel && !upLevel) {
                return Direction.UP;
            } else if (!downLevel && upLevel) {
                return Direction.DOWN;   
            } else {
                return Direction.STOP;
            }
        }
    }
}
