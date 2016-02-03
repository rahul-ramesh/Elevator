/*
 * CarCallCanPayloadTranslator.java
 * 18-649 Distributed Embedded Systems
 * Group 11
 * Rahul Ramesh // rahulram. Daniel Santoro // ddsantor. David Thompson // davidtho. Jialiang Tan // jialiant
 */
// !@
package simulator.elevatorcontrol;

import simulator.elevatorcontrol.MessageDictionary;
import simulator.elevatormodules.BooleanCanTranslator;
import simulator.framework.Hallway;
import simulator.framework.ReplicationComputer;
import simulator.payloads.CanMailbox.ReadableCanMailbox;
import simulator.payloads.CanMailbox.WriteableCanMailbox;

public class CarCallCanPayloadTranslator extends LeanBooleanCanTranslator {

    /**
     * CAN translator for messages from atfloor sensors
     * @param payload CAN payload object whose message is interpreted by this translator
     * @param floor replication index
     * @param hallway replication index
     */
    public CarCallCanPayloadTranslator(WriteableCanMailbox payload, int floor, Hallway hallway) {
        super(payload, MessageDictionary.CAR_CALL_BASE_CAN_ID + ReplicationComputer.computeReplicationId(floor, hallway), "CarCall" + ReplicationComputer.makeReplicationString(floor, hallway));
    }

    /**
     * CAN translator for messages from atfloor sensors
     * @param payload CAN payload object whose message is interpreted by this translator
     * @param floor replication index
     * @param hallway replication index
     */
    public CarCallCanPayloadTranslator(ReadableCanMailbox payload, int floor, Hallway hallway) {
        super(payload, MessageDictionary.CAR_CALL_BASE_CAN_ID + ReplicationComputer.computeReplicationId(floor, hallway), "CarCall" + ReplicationComputer.makeReplicationString(floor, hallway));
    }

}
