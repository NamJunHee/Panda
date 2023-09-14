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

class ColorDepthImage {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.json = null;
    }
    else {
      if (initObj.hasOwnProperty('json')) {
        this.json = initObj.json
      }
      else {
        this.json = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ColorDepthImage
    // Serialize message field [json]
    bufferOffset = _arraySerializer.string(obj.json, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ColorDepthImage
    let len;
    let data = new ColorDepthImage(null);
    // Deserialize message field [json]
    data.json = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.json.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'symbolic_msgs/ColorDepthImage';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2518043d6087e4ba95ef63957da66e6b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] json
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ColorDepthImage(null);
    if (msg.json !== undefined) {
      resolved.json = msg.json;
    }
    else {
      resolved.json = []
    }

    return resolved;
    }
};

module.exports = ColorDepthImage;
