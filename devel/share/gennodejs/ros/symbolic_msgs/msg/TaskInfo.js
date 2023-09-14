// Auto-generated. Do not edit!

// (in-package symbolic_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');
let vision_msgs = _finder('vision_msgs');

//-----------------------------------------------------------

class TaskInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Detection_3D_Array = null;
      this.Grasp_Pose = null;
      this.Object_List = null;
      this.Object_Feature = null;
      this.Object_Symbolic_Data = null;
      this.Task_Goal = null;
    }
    else {
      if (initObj.hasOwnProperty('Detection_3D_Array')) {
        this.Detection_3D_Array = initObj.Detection_3D_Array
      }
      else {
        this.Detection_3D_Array = new vision_msgs.msg.Detection3DArray();
      }
      if (initObj.hasOwnProperty('Grasp_Pose')) {
        this.Grasp_Pose = initObj.Grasp_Pose
      }
      else {
        this.Grasp_Pose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('Object_List')) {
        this.Object_List = initObj.Object_List
      }
      else {
        this.Object_List = [];
      }
      if (initObj.hasOwnProperty('Object_Feature')) {
        this.Object_Feature = initObj.Object_Feature
      }
      else {
        this.Object_Feature = [];
      }
      if (initObj.hasOwnProperty('Object_Symbolic_Data')) {
        this.Object_Symbolic_Data = initObj.Object_Symbolic_Data
      }
      else {
        this.Object_Symbolic_Data = [];
      }
      if (initObj.hasOwnProperty('Task_Goal')) {
        this.Task_Goal = initObj.Task_Goal
      }
      else {
        this.Task_Goal = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TaskInfo
    // Serialize message field [Detection_3D_Array]
    bufferOffset = vision_msgs.msg.Detection3DArray.serialize(obj.Detection_3D_Array, buffer, bufferOffset);
    // Serialize message field [Grasp_Pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.Grasp_Pose, buffer, bufferOffset);
    // Serialize message field [Object_List]
    // Serialize the length for message field [Object_List]
    bufferOffset = _serializer.uint32(obj.Object_List.length, buffer, bufferOffset);
    obj.Object_List.forEach((val) => {
      bufferOffset = std_msgs.msg.String.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [Object_Feature]
    // Serialize the length for message field [Object_Feature]
    bufferOffset = _serializer.uint32(obj.Object_Feature.length, buffer, bufferOffset);
    obj.Object_Feature.forEach((val) => {
      bufferOffset = std_msgs.msg.String.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [Object_Symbolic_Data]
    // Serialize the length for message field [Object_Symbolic_Data]
    bufferOffset = _serializer.uint32(obj.Object_Symbolic_Data.length, buffer, bufferOffset);
    obj.Object_Symbolic_Data.forEach((val) => {
      bufferOffset = std_msgs.msg.String.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [Task_Goal]
    // Serialize the length for message field [Task_Goal]
    bufferOffset = _serializer.uint32(obj.Task_Goal.length, buffer, bufferOffset);
    obj.Task_Goal.forEach((val) => {
      bufferOffset = std_msgs.msg.String.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TaskInfo
    let len;
    let data = new TaskInfo(null);
    // Deserialize message field [Detection_3D_Array]
    data.Detection_3D_Array = vision_msgs.msg.Detection3DArray.deserialize(buffer, bufferOffset);
    // Deserialize message field [Grasp_Pose]
    data.Grasp_Pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [Object_List]
    // Deserialize array length for message field [Object_List]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.Object_List = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.Object_List[i] = std_msgs.msg.String.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [Object_Feature]
    // Deserialize array length for message field [Object_Feature]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.Object_Feature = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.Object_Feature[i] = std_msgs.msg.String.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [Object_Symbolic_Data]
    // Deserialize array length for message field [Object_Symbolic_Data]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.Object_Symbolic_Data = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.Object_Symbolic_Data[i] = std_msgs.msg.String.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [Task_Goal]
    // Deserialize array length for message field [Task_Goal]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.Task_Goal = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.Task_Goal[i] = std_msgs.msg.String.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += vision_msgs.msg.Detection3DArray.getMessageSize(object.Detection_3D_Array);
    object.Object_List.forEach((val) => {
      length += std_msgs.msg.String.getMessageSize(val);
    });
    object.Object_Feature.forEach((val) => {
      length += std_msgs.msg.String.getMessageSize(val);
    });
    object.Object_Symbolic_Data.forEach((val) => {
      length += std_msgs.msg.String.getMessageSize(val);
    });
    object.Task_Goal.forEach((val) => {
      length += std_msgs.msg.String.getMessageSize(val);
    });
    return length + 72;
  }

  static datatype() {
    // Returns string type for a message object
    return 'symbolic_msgs/TaskInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4a0d32656f5b9bd118d9cc7e00f8102a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    vision_msgs/Detection3DArray Detection_3D_Array
    geometry_msgs/Pose Grasp_Pose
    std_msgs/String[] Object_List
    std_msgs/String[] Object_Feature
    std_msgs/String[] Object_Symbolic_Data
    std_msgs/String[] Task_Goal
    
    
    ================================================================================
    MSG: vision_msgs/Detection3DArray
    # A list of 3D detections, for a multi-object 3D detector.
    
    Header header
    
    # A list of the detected proposals. A multi-proposal detector might generate
    #   this list with many candidate detections generated from a single input.
    Detection3D[] detections
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: vision_msgs/Detection3D
    # Defines a 3D detection result.
    #
    # This extends a basic 3D classification by including position information,
    #   allowing a classification result for a specific position in an image to
    #   to be located in the larger image.
    
    Header header
    
    # Class probabilities. Does not have to include hypotheses for all possible
    #   object ids, the scores for any ids not listed are assumed to be 0.
    ObjectHypothesisWithPose[] results
    
    # 3D bounding box surrounding the object.
    BoundingBox3D bbox
    
    # The 3D data that generated these results (i.e. region proposal cropped out of
    #   the image). This information is not required for all detectors, so it may
    #   be empty.
    sensor_msgs/PointCloud2 source_cloud
    
    ================================================================================
    MSG: vision_msgs/ObjectHypothesisWithPose
    # An object hypothesis that contains position information.
    
    # The unique numeric ID of object detected. To get additional information about
    #   this ID, such as its human-readable name, listeners should perform a lookup
    #   in a metadata database. See vision_msgs/VisionInfo.msg for more detail.
    int64 id
    
    # The probability or confidence value of the detected object. By convention,
    #   this value should lie in the range [0-1].
    float64 score
    
    # The 6D pose of the object hypothesis. This pose should be
    #   defined as the pose of some fixed reference point on the object, such a
    #   the geometric center of the bounding box or the center of mass of the
    #   object.
    # Note that this pose is not stamped; frame information can be defined by
    #   parent messages.
    # Also note that different classes predicted for the same input data may have
    #   different predicted 6D poses.
    geometry_msgs/PoseWithCovariance pose
    ================================================================================
    MSG: geometry_msgs/PoseWithCovariance
    # This represents a pose in free space with uncertainty.
    
    Pose pose
    
    # Row-major representation of the 6x6 covariance matrix
    # The orientation parameters use a fixed-axis representation.
    # In order, the parameters are:
    # (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
    float64[36] covariance
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    ================================================================================
    MSG: vision_msgs/BoundingBox3D
    # A 3D bounding box that can be positioned and rotated about its center (6 DOF)
    # Dimensions of this box are in meters, and as such, it may be migrated to
    #   another package, such as geometry_msgs, in the future.
    
    # The 3D position and orientation of the bounding box center
    geometry_msgs/Pose center
    
    # The size of the bounding box, in meters, surrounding the object's center
    #   pose.
    geometry_msgs/Vector3 size
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    ================================================================================
    MSG: sensor_msgs/PointCloud2
    # This message holds a collection of N-dimensional points, which may
    # contain additional information such as normals, intensity, etc. The
    # point data is stored as a binary blob, its layout described by the
    # contents of the "fields" array.
    
    # The point cloud data may be organized 2d (image-like) or 1d
    # (unordered). Point clouds organized as 2d images may be produced by
    # camera depth sensors such as stereo or time-of-flight.
    
    # Time of sensor data acquisition, and the coordinate frame ID (for 3d
    # points).
    Header header
    
    # 2D structure of the point cloud. If the cloud is unordered, height is
    # 1 and width is the length of the point cloud.
    uint32 height
    uint32 width
    
    # Describes the channels and their layout in the binary data blob.
    PointField[] fields
    
    bool    is_bigendian # Is this data bigendian?
    uint32  point_step   # Length of a point in bytes
    uint32  row_step     # Length of a row in bytes
    uint8[] data         # Actual point data, size is (row_step*height)
    
    bool is_dense        # True if there are no invalid points
    
    ================================================================================
    MSG: sensor_msgs/PointField
    # This message holds the description of one point entry in the
    # PointCloud2 message format.
    uint8 INT8    = 1
    uint8 UINT8   = 2
    uint8 INT16   = 3
    uint8 UINT16  = 4
    uint8 INT32   = 5
    uint8 UINT32  = 6
    uint8 FLOAT32 = 7
    uint8 FLOAT64 = 8
    
    string name      # Name of field
    uint32 offset    # Offset from start of point struct
    uint8  datatype  # Datatype enumeration, see above
    uint32 count     # How many elements in the field
    
    ================================================================================
    MSG: std_msgs/String
    string data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TaskInfo(null);
    if (msg.Detection_3D_Array !== undefined) {
      resolved.Detection_3D_Array = vision_msgs.msg.Detection3DArray.Resolve(msg.Detection_3D_Array)
    }
    else {
      resolved.Detection_3D_Array = new vision_msgs.msg.Detection3DArray()
    }

    if (msg.Grasp_Pose !== undefined) {
      resolved.Grasp_Pose = geometry_msgs.msg.Pose.Resolve(msg.Grasp_Pose)
    }
    else {
      resolved.Grasp_Pose = new geometry_msgs.msg.Pose()
    }

    if (msg.Object_List !== undefined) {
      resolved.Object_List = new Array(msg.Object_List.length);
      for (let i = 0; i < resolved.Object_List.length; ++i) {
        resolved.Object_List[i] = std_msgs.msg.String.Resolve(msg.Object_List[i]);
      }
    }
    else {
      resolved.Object_List = []
    }

    if (msg.Object_Feature !== undefined) {
      resolved.Object_Feature = new Array(msg.Object_Feature.length);
      for (let i = 0; i < resolved.Object_Feature.length; ++i) {
        resolved.Object_Feature[i] = std_msgs.msg.String.Resolve(msg.Object_Feature[i]);
      }
    }
    else {
      resolved.Object_Feature = []
    }

    if (msg.Object_Symbolic_Data !== undefined) {
      resolved.Object_Symbolic_Data = new Array(msg.Object_Symbolic_Data.length);
      for (let i = 0; i < resolved.Object_Symbolic_Data.length; ++i) {
        resolved.Object_Symbolic_Data[i] = std_msgs.msg.String.Resolve(msg.Object_Symbolic_Data[i]);
      }
    }
    else {
      resolved.Object_Symbolic_Data = []
    }

    if (msg.Task_Goal !== undefined) {
      resolved.Task_Goal = new Array(msg.Task_Goal.length);
      for (let i = 0; i < resolved.Task_Goal.length; ++i) {
        resolved.Task_Goal[i] = std_msgs.msg.String.Resolve(msg.Task_Goal[i]);
      }
    }
    else {
      resolved.Task_Goal = []
    }

    return resolved;
    }
};

module.exports = TaskInfo;
