/*
 * CarPositionControl.java
 * 18-649 Distributed Embedded Systems
 * Group 11
 * Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
 */
// !@

/**
 * @author Rahul Ramesh // rahulram & David Thompson // davidtho
 * @datelastmodified 2015-10-18
 */
package simulator.elevatorcontrol;
import jSimPack.SimTime;

import simulator.*;
import simulator.elevatorcontrol.DriveSpeedCanPayloadTranslator;
import simulator.elevatorcontrol.Utility;
import simulator.elevatorcontrol.Utility.AtFloorArray;
import simulator.elevatormodules.AtFloorSensor;
import simulator.elevatormodules.CarPositionIndicator;
import simulator.elevatormodules.CarLevelPositionCanPayloadTranslator;
import simulator.elevatormodules.CarWeightCanPayloadTranslator;
import simulator.framework.Controller;
import simulator.framework.Direction;
import simulator.framework.Hallway;
import simulator.framework.ReplicationComputer;
import simulator.framework.Side;
import simulator.framework.Speed;
import simulator.payloads.AtFloorPayload;
import simulator.payloads.CanMailbox.ReadableCanMailbox;
import simulator.payloads.CanMailbox.WriteableCanMailbox;
import simulator.payloads.CanMailbox;
import simulator.payloads.CarPositionIndicatorPayload;
import simulator.payloads.CarPositionIndicatorPayload.WriteableCarPositionIndicatorPayload;
import simulator.payloads.translators.CanPayloadTranslator;
import simulator.payloads.translators.IntegerCanPayloadTranslator;
import simulator.elevatorcontrol.Utility;
import simulator.elevatorcontrol.Utility.AtFloorArray;
import simulator.elevatorcontrol.Utility.Floor;

public class CarPositionControl extends Controller 
{
    // INPUTS
    // CAN input interface variables

	// DRIVE SPEED
	private ReadableCanMailbox networkDriveSpeed;
	private DriveSpeedCanPayloadTranslator mDriveSpeed;
	
	//DESIRED FLOOR
	private ReadableCanMailbox networkDesiredFloor;
	private DesiredFloorCanPayloadTranslator mDesiredFloor;
	
    // AT FLOOR SENSOR
    private AtFloorArray mAtFloorArray;
/*	
    // CAR LEVEL POS
	private ReadableCanMailbox networkCarLevelPos;
	private IntegerCanPayloadTranslator mCarLevelPos;
*/	
    // CAR LEVEL POS
	private ReadableCanMailbox networkCarLevelPos;
	private CarLevelPositionCanPayloadTranslator mCarLevelPos;
	
    //OUTPUTS
    // physical output interface variables
    private WriteableCarPositionIndicatorPayload fCarPos;

    // state variables
    private int commitFloor = 1;
    private int currentSpeed;
    private int currentPosition;
    private int currentFloor;
    private Direction currentDirection;

    // configuration variables
    private SimTime period;

    // Constructor
    public CarPositionControl(SimTime period, boolean verbose) 
    {
        super("CarPositionControl", verbose);
        
        this.period = period;

        log("Created CarPositionControl ", " with period = ", period);

		// DRIVE SPEED
        networkDriveSpeed = CanMailbox.getReadableCanMailbox(MessageDictionary.DRIVE_SPEED_CAN_ID);
        mDriveSpeed = new DriveSpeedCanPayloadTranslator(networkDriveSpeed);
        canInterface.registerTimeTriggered(networkDriveSpeed);
        
        // AT FLOOR SENSOR - mAtFloor
        mAtFloorArray = new AtFloorArray(canInterface);

        // mDesiredFloor
        networkDesiredFloor = CanMailbox.getReadableCanMailbox(MessageDictionary.DESIRED_FLOOR_CAN_ID);
        mDesiredFloor = new DesiredFloorCanPayloadTranslator(networkDesiredFloor);
        canInterface.registerTimeTriggered(networkDesiredFloor);

        // Car level Pos
        networkCarLevelPos = CanMailbox.getReadableCanMailbox(MessageDictionary.CAR_LEVEL_POSITION_CAN_ID);
        mCarLevelPos = new CarLevelPositionCanPayloadTranslator(networkCarLevelPos);
        canInterface.registerTimeTriggered(networkCarLevelPos);


        //outputs
        // CAR POSITION INDICATOR
        fCarPos = CarPositionIndicatorPayload.getWriteablePayload();
        physicalInterface.sendTimeTriggered(fCarPos, period);
        
        // start timer
        timer.start(period);
    }

    @Override
    public void timerExpired(Object callbackData) 
    {
        //#state 'INDICATE_POSITION'
        //Current speed, position, and direction.
        currentSpeed = mDriveSpeed.getSpeed();
        currentPosition = mCarLevelPos.getValue();
        currentDirection = mDriveSpeed.getDirection();
        currentFloor = mAtFloorArray.getCurrentFloor();
        
        commitFloor = Floor.commitFloor(commitFloor, currentSpeed, currentPosition, currentDirection, currentFloor);

        //Display commit point on indicator for passengers.
        fCarPos.set(commitFloor);
        log("CarPositionIndicator displaying floor ", commitFloor);
        timer.start(MessageDictionary.CAR_POSITION_CONTROL_PERIOD);
    }
}