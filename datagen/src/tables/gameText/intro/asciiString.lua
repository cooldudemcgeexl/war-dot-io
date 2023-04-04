local byteTable = require("tables.gameText.intro.bytes")
require "utils.bytes"



local stringTable = {
    DRESS = makeAsciiString(byteTable.DRESS),
    ATTACK = makeAsciiString(byteTable.ATTACK),
    DODGE = makeAsciiString(byteTable.DODGE),
    COLLECT = makeAsciiString(byteTable.COLLECT),
    STOMP = makeAsciiString(byteTable.STOMP),
    STOP_ME = makeAsciiString(byteTable.STOP_ME),
    CATCH = makeAsciiString(byteTable.CATCH),
    SPOTLIGHT = makeAsciiString(byteTable.SPOTLIGHT),
    AIM = makeAsciiString(byteTable.AIM),
    DODGE2 = makeAsciiString(byteTable.DODGE2),
    GRAB = makeAsciiString(byteTable.GRAB),
    SPAR = makeAsciiString(byteTable.SPAR),
    FLEE = makeAsciiString(byteTable.FLEE)
}



return stringTable
