// Auto-generated. Do not edit!

// (in-package symbolic_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ActionResult {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.action_id = null;
      this.objects = null;
      this.result = null;
    }
    else {
      if (initObj.hasOwnProperty('action_id')) {
        this.action_id = initObj.action_id
      }
      else {
        this.action_id = 0;
      }
      if (initObj.hasOwnProperty('objects')) {
        this.objects = initObj.objects
      }
      else {
        this.objects = [];
      }
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ActionResult
    // Serialize message field [action_id]
    bufferOffset = _serializer.int32(obj.action_id, buffer, bufferOffset);
    // Serialize message field [objects]
    bufferOffset = _arraySerializer.int32(obj.objects, buffer, bufferOffset, null);
    // Serialize message field [result]
    bufferOffset = _serializer.int32(obj.result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ActionResult
    let len;
    let data = new ActionResult(null);
    // Deserialize message field [action_id]
    data.action_id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [objects]
    data.objects = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [result]
    data.result = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.objects.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'symbolic_msgs/ActionResult';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f7072e87515b1c12d8c225bf21a0bcf4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 action_id
    int32[] objects
    int32 result
    
    # action_id
    int32 ACTION_MOVE_FREE = 100 # objects = []
    int32 ACTION_MOVE_HOLDING = 101 # objects = [holding_object]
    int32 ACTION_PICK = 102 # objects = [picked_object]
    int32 ACTION_PLACE_ON = 103 # objects = [object_top, object_bottom]
    int32 ACTION_PLACE_IN = 104 # objects = [object_inner, object_outer]
    int32 ACTION_STACK_IN = 105 # objects = [object_top, object_bottom]
    
    # result
    int32 SUCCESS = 1
    int32 STATE_UPDATE_REQUIRED = 0
    int32 FAILED = -1
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ActionResult(null);
    if (msg.action_id !== undefined) {
      resolved.action_id = msg.action_id;
    }
    else {
      resolved.action_id = 0
    }

    if (msg.objects !== undefined) {
      resolved.objects = msg.objects;
    }
    else {
      resolved.objects = []
    }

    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = 0
    }

    return resolved;
    }
};

// Constants for message
ActionResult.Constants = {
  ACTION_MOVE_FREE: 100,
  ACTION_MOVE_HOLDING: 101,
  ACTION_PICK: 102,
  ACTION_PLACE_ON: 103,
  ACTION_PLACE_IN: 104,
  ACTION_STACK_IN: 105,
  SUCCESS: 1,
  STATE_UPDATE_REQUIRED: 0,
  FAILED: -1,
}

module.exports = ActionResult;
