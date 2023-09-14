// Auto-generated. Do not edit!

// (in-package symbolic_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let vision_msgs = _finder('vision_msgs');
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class perceptionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.detect_obj = null;
      this.place = null;
    }
    else {
      if (initObj.hasOwnProperty('detect_obj')) {
        this.detect_obj = initObj.detect_obj
      }
      else {
        this.detect_obj = false;
      }
      if (initObj.hasOwnProperty('place')) {
        this.place = initObj.place
      }
      else {
        this.place = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type perceptionRequest
    // Serialize message field [detect_obj]
    bufferOffset = _serializer.bool(obj.detect_obj, buffer, bufferOffset);
    // Serialize message field [place]
    bufferOffset = _serializer.int32(obj.place, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type perceptionRequest
    let len;
    let data = new perceptionRequest(null);
    // Deserialize message field [detect_obj]
    data.detect_obj = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [place]
    data.place = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'symbolic_msgs/perceptionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a56b4c511424086489b1c3d34bfcfd4f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # request
    bool detect_obj
    int32 place
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new perceptionRequest(null);
    if (msg.detect_obj !== undefined) {
      resolved.detect_obj = msg.detect_obj;
    }
    else {
      resolved.detect_obj = false
    }

    if (msg.place !== undefined) {
      resolved.place = msg.place;
    }
    else {
      resolved.place = 0
    }

    return resolved;
    }
};

class perceptionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.det_2d = null;
      this.instance_id = null;
      this.det_3d = null;
      this.grasp_pose = null;
      this.table_pose = null;
      this.shelf_pose = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('det_2d')) {
        this.det_2d = initObj.det_2d
      }
      else {
        this.det_2d = new vision_msgs.msg.Detection2DArray();
      }
      if (initObj.hasOwnProperty('instance_id')) {
        this.instance_id = initObj.instance_id
      }
      else {
        this.instance_id = new std_msgs.msg.Int16MultiArray();
      }
      if (initObj.hasOwnProperty('det_3d')) {
        this.det_3d = initObj.det_3d
      }
      else {
        this.det_3d = new vision_msgs.msg.Detection3DArray();
      }
      if (initObj.hasOwnProperty('grasp_pose')) {
        this.grasp_pose = initObj.grasp_pose
      }
      else {
        this.grasp_pose = new geometry_msgs.msg.PoseArray();
      }
      if (initObj.hasOwnProperty('table_pose')) {
        this.table_pose = initObj.table_pose
      }
      else {
        this.table_pose = new vision_msgs.msg.BoundingBox3D();
      }
      if (initObj.hasOwnProperty('shelf_pose')) {
        this.shelf_pose = initObj.shelf_pose
      }
      else {
        this.shelf_pose = new vision_msgs.msg.BoundingBox3D();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type perceptionResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [det_2d]
    bufferOffset = vision_msgs.msg.Detection2DArray.serialize(obj.det_2d, buffer, bufferOffset);
    // Serialize message field [instance_id]
    bufferOffset = std_msgs.msg.Int16MultiArray.serialize(obj.instance_id, buffer, bufferOffset);
    // Serialize message field [det_3d]
    bufferOffset = vision_msgs.msg.Detection3DArray.serialize(obj.det_3d, buffer, bufferOffset);
    // Serialize message field [grasp_pose]
    bufferOffset = geometry_msgs.msg.PoseArray.serialize(obj.grasp_pose, buffer, bufferOffset);
    // Serialize message field [table_pose]
    bufferOffset = vision_msgs.msg.BoundingBox3D.serialize(obj.table_pose, buffer, bufferOffset);
    // Serialize message field [shelf_pose]
    bufferOffset = vision_msgs.msg.BoundingBox3D.serialize(obj.shelf_pose, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type perceptionResponse
    let len;
    let data = new perceptionResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [det_2d]
    data.det_2d = vision_msgs.msg.Detection2DArray.deserialize(buffer, bufferOffset);
    // Deserialize message field [instance_id]
    data.instance_id = std_msgs.msg.Int16MultiArray.deserialize(buffer, bufferOffset);
    // Deserialize message field [det_3d]
    data.det_3d = vision_msgs.msg.Detection3DArray.deserialize(buffer, bufferOffset);
    // Deserialize message field [grasp_pose]
    data.grasp_pose = geometry_msgs.msg.PoseArray.deserialize(buffer, bufferOffset);
    // Deserialize message field [table_pose]
    data.table_pose = vision_msgs.msg.BoundingBox3D.deserialize(buffer, bufferOffset);
    // Deserialize message field [shelf_pose]
    data.shelf_pose = vision_msgs.msg.BoundingBox3D.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += vision_msgs.msg.Detection2DArray.getMessageSize(object.det_2d);
    length += std_msgs.msg.Int16MultiArray.getMessageSize(object.instance_id);
    length += vision_msgs.msg.Detection3DArray.getMessageSize(object.det_3d);
    length += geometry_msgs.msg.PoseArray.getMessageSize(object.grasp_pose);
    return length + 161;
  }

  static datatype() {
    // Returns string type for a service object
    return 'symbolic_msgs/perceptionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a0b9e0274823afa5f617b0cb4bacf180';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # rosponse
    bool success
    vision_msgs/Detection2DArray det_2d
    std_msgs/Int16MultiArray instance_id
    vision_msgs/Detection3DArray det_3d
    geometry_msgs/PoseArray grasp_pose
    vision_msgs/BoundingBox3D table_pose
    vision_msgs/BoundingBox3D shelf_pose
    
    ================================================================================
    MSG: vision_msgs/Detection2DArray
    # A list of 2D detections, for a multi-object 2D detector.
    
    Header header
    
    # A list of the detected proposals. A multi-proposal detector might generate
    #   this list with many candidate detections generated from a single input.
    Detection2D[] detections
    
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
    MSG: vision_msgs/Detection2D
    # Defines a 2D detection result.
    #
    # This is similar to a 2D classification, but includes position information,
    #   allowing a classification result for a specific crop or image point to
    #   to be located in the larger image.
    
    Header header
    
    # Class probabilities
    ObjectHypothesisWithPose[] results
    
    # 2D bounding box surrounding the object.
    BoundingBox2D bbox
    
    # The 2D data that generated these results (i.e. region proposal cropped out of
    #   the image). Not required for all use cases, so it may be empty.
    sensor_msgs/Image source_img
    
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
    MSG: vision_msgs/BoundingBox2D
    # A 2D bounding box that can be rotated about its center.
    # All dimensions are in pixels, but represented using floating-point
    #   values to allow sub-pixel precision. If an exact pixel crop is required
    #   for a rotated bounding box, it can be calculated using Bresenham's line
    #   algorithm.
    
    # The 2D position (in pixels) and orientation of the bounding box center.
    geometry_msgs/Pose2D center
    
    # The size (in pixels) of the bounding box surrounding the object relative
    #   to the pose of its center.
    float64 size_x
    float64 size_y
    
    ================================================================================
    MSG: geometry_msgs/Pose2D
    # Deprecated
    # Please use the full 3D pose.
    
    # In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.
    
    # If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.
    
    
    # This expresses a position and orientation on a 2D manifold.
    
    float64 x
    float64 y
    float64 theta
    
    ================================================================================
    MSG: sensor_msgs/Image
    # This message contains an uncompressed image
    # (0, 0) is at top-left corner of image
    #
    
    Header header        # Header timestamp should be acquisition time of image
                         # Header frame_id should be optical frame of camera
                         # origin of frame should be optical center of camera
                         # +x should point to the right in the image
                         # +y should point down in the image
                         # +z should point into to plane of the image
                         # If the frame_id here and the frame_id of the CameraInfo
                         # message associated with the image conflict
                         # the behavior is undefined
    
    uint32 height         # image height, that is, number of rows
    uint32 width          # image width, that is, number of columns
    
    # The legal values for encoding are in file src/image_encodings.cpp
    # If you want to standardize a new string format, join
    # ros-users@lists.sourceforge.net and send an email proposing a new encoding.
    
    string encoding       # Encoding of pixels -- channel meaning, ordering, size
                          # taken from the list of strings in include/sensor_msgs/image_encodings.h
    
    uint8 is_bigendian    # is this data bigendian?
    uint32 step           # Full row length in bytes
    uint8[] data          # actual matrix data, size is (step * rows)
    
    ================================================================================
    MSG: std_msgs/Int16MultiArray
    # Please look at the MultiArrayLayout message definition for
    # documentation on all multiarrays.
    
    MultiArrayLayout  layout        # specification of data layout
    int16[]           data          # array of data
    
    
    ================================================================================
    MSG: std_msgs/MultiArrayLayout
    # The multiarray declares a generic multi-dimensional array of a
    # particular data type.  Dimensions are ordered from outer most
    # to inner most.
    
    MultiArrayDimension[] dim # Array of dimension properties
    uint32 data_offset        # padding elements at front of data
    
    # Accessors should ALWAYS be written in terms of dimension stride
    # and specified outer-most dimension first.
    # 
    # multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
    #
    # A standard, 3-channel 640x480 image with interleaved color channels
    # would be specified as:
    #
    # dim[0].label  = "height"
    # dim[0].size   = 480
    # dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
    # dim[1].label  = "width"
    # dim[1].size   = 640
    # dim[1].stride = 3*640 = 1920
    # dim[2].label  = "channel"
    # dim[2].size   = 3
    # dim[2].stride = 3
    #
    # multiarray(i,j,k) refers to the ith row, jth column, and kth channel.
    
    ================================================================================
    MSG: std_msgs/MultiArrayDimension
    string label   # label of given dimension
    uint32 size    # size of given dimension (in type units)
    uint32 stride  # stride of given dimension
    ================================================================================
    MSG: vision_msgs/Detection3DArray
    # A list of 3D detections, for a multi-object 3D detector.
    
    Header header
    
    # A list of the detected proposals. A multi-proposal detector might generate
    #   this list with many candidate detections generated from a single input.
    Detection3D[] detections
    
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
    MSG: geometry_msgs/PoseArray
    # An array of poses with a header for global reference.
    
    Header header
    
    Pose[] poses
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new perceptionResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.det_2d !== undefined) {
      resolved.det_2d = vision_msgs.msg.Detection2DArray.Resolve(msg.det_2d)
    }
    else {
      resolved.det_2d = new vision_msgs.msg.Detection2DArray()
    }

    if (msg.instance_id !== undefined) {
      resolved.instance_id = std_msgs.msg.Int16MultiArray.Resolve(msg.instance_id)
    }
    else {
      resolved.instance_id = new std_msgs.msg.Int16MultiArray()
    }

    if (msg.det_3d !== undefined) {
      resolved.det_3d = vision_msgs.msg.Detection3DArray.Resolve(msg.det_3d)
    }
    else {
      resolved.det_3d = new vision_msgs.msg.Detection3DArray()
    }

    if (msg.grasp_pose !== undefined) {
      resolved.grasp_pose = geometry_msgs.msg.PoseArray.Resolve(msg.grasp_pose)
    }
    else {
      resolved.grasp_pose = new geometry_msgs.msg.PoseArray()
    }

    if (msg.table_pose !== undefined) {
      resolved.table_pose = vision_msgs.msg.BoundingBox3D.Resolve(msg.table_pose)
    }
    else {
      resolved.table_pose = new vision_msgs.msg.BoundingBox3D()
    }

    if (msg.shelf_pose !== undefined) {
      resolved.shelf_pose = vision_msgs.msg.BoundingBox3D.Resolve(msg.shelf_pose)
    }
    else {
      resolved.shelf_pose = new vision_msgs.msg.BoundingBox3D()
    }

    return resolved;
    }
};

module.exports = {
  Request: perceptionRequest,
  Response: perceptionResponse,
  md5sum() { return '66a96c4350836d51ca0d6a2c28ae7f73'; },
  datatype() { return 'symbolic_msgs/perception'; }
};
