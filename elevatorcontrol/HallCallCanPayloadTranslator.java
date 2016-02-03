/*
 * HallCallCanPayloadTranslator.java
 * 18-649 Distributed Embedded Systems
 * Group 11
 * Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
 */
// !@
package simulator.elevatorcontrol;

import simulator.elevatorcontrol.MessageDictionary;
import simulator.elevatormodules.BooleanCanTranslator;
import simulator.framework.Hallway;
import simulator.framework.Direction;
import simulator.framework.ReplicationComputer;
import simulator.payloads.CanMailbox.ReadableCanMailbox;
import simulator.payloads.CanMailbox.WriteableCanMailbox;

public class HallCallCanPayloadTranslator extends LeanBooleanCanTranslator {

    /**
     * CAN translator for messages from atfloor sensors
     * @param payload CAN payload object whose message is interpreted by this translator
     * @param floor replication index
     * @param hallway replication index
     */
    public HallCallCanPayloadTranslator(WriteableCanMailbox payload, int floor, Hallway hallway, Direction direction) {
        super(payload, MessageDictionary.HALL_CALL_BASE_CAN_ID + ReplicationComputer.computeReplicationId(floor, hallway, direction), "HallCall" + ReplicationComputer.makeReplicationString(floor, hallway, direction));
    }

    /**
     * CAN translator for messages from atfloor sensors
     * @param payload CAN payload object whose message is interpreted by this translator
     * @param floor replication index
     * @param hallway replication index
     */
    public HallCallCanPayloadTranslator(ReadableCanMailbox payload, int floor, Hallway hallway, Direction direction) {
        super(payload, MessageDictionary.HALL_CALL_BASE_CAN_ID + ReplicationComputer.computeReplicationId(floor, hallway, direction), "HallCall" + ReplicationComputer.makeReplicationString(floor, hallway, direction));
    }

}
