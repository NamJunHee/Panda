; Auto-generated. Do not edit!


(cl:in-package symbolic_msgs-srv)


;//! \htmlinclude perception-request.msg.html

(cl:defclass <perception-request> (roslisp-msg-protocol:ros-message)
  ((detect_obj
    :reader detect_obj
    :initarg :detect_obj
    :type cl:boolean
    :initform cl:nil)
   (place
    :reader place
    :initarg :place
    :type cl:integer
    :initform 0))
)

(cl:defclass perception-request (<perception-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <perception-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'perception-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name symbolic_msgs-srv:<perception-request> is deprecated: use symbolic_msgs-srv:perception-request instead.")))

(cl:ensure-generic-function 'detect_obj-val :lambda-list '(m))
(cl:defmethod detect_obj-val ((m <perception-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader symbolic_msgs-srv:detect_obj-val is deprecated.  Use symbolic_msgs-srv:detect_obj instead.")
  (detect_obj m))

(cl:ensure-generic-function 'place-val :lambda-list '(m))
(cl:defmethod place-val ((m <perception-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader symbolic_msgs-srv:place-val is deprecated.  Use symbolic_msgs-srv:place instead.")
  (place m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <perception-request>) ostream)
  "Serializes a message object of type '<perception-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'detect_obj) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'place)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <perception-request>) istream)
  "Deserializes a message object of type '<perception-request>"
    (cl:setf (cl:slot-value msg 'detect_obj) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'place) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<perception-request>)))
  "Returns string type for a service object of type '<perception-request>"
  "symbolic_msgs/perceptionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'perception-request)))
  "Returns string type for a service object of type 'perception-request"
  "symbolic_msgs/perceptionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<perception-request>)))
  "Returns md5sum for a message object of type '<perception-request>"
  "66a96c4350836d51ca0d6a2c28ae7f73")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'perception-request)))
  "Returns md5sum for a message object of type 'perception-request"
  "66a96c4350836d51ca0d6a2c28ae7f73")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<perception-request>)))
  "Returns full string definition for message of type '<perception-request>"
  (cl:format cl:nil "# request~%bool detect_obj~%int32 place~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'perception-request)))
  "Returns full string definition for message of type 'perception-request"
  (cl:format cl:nil "# request~%bool detect_obj~%int32 place~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <perception-request>))
  (cl:+ 0
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <perception-request>))
  "Converts a ROS message object to a list"
  (cl:list 'perception-request
    (cl:cons ':detect_obj (detect_obj msg))
    (cl:cons ':place (place msg))
))
;//! \htmlinclude perception-response.msg.html

(cl:defclass <perception-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (det_2d
    :reader det_2d
    :initarg :det_2d
    :type vision_msgs-msg:Detection2DArray
    :initform (cl:make-instance 'vision_msgs-msg:Detection2DArray))
   (instance_id
    :reader instance_id
    :initarg :instance_id
    :type std_msgs-msg:Int16MultiArray
    :initform (cl:make-instance 'std_msgs-msg:Int16MultiArray))
   (det_3d
    :reader det_3d
    :initarg :det_3d
    :type vision_msgs-msg:Detection3DArray
    :initform (cl:make-instance 'vision_msgs-msg:Detection3DArray))
   (grasp_pose
    :reader grasp_pose
    :initarg :grasp_pose
    :type geometry_msgs-msg:PoseArray
    :initform (cl:make-instance 'geometry_msgs-msg:PoseArray))
   (table_pose
    :reader table_pose
    :initarg :table_pose
    :type vision_msgs-msg:BoundingBox3D
    :initform (cl:make-instance 'vision_msgs-msg:BoundingBox3D))
   (shelf_pose
    :reader shelf_pose
    :initarg :shelf_pose
    :type vision_msgs-msg:BoundingBox3D
    :initform (cl:make-instance 'vision_msgs-msg:BoundingBox3D)))
)

(cl:defclass perception-response (<perception-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <perception-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'perception-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name symbolic_msgs-srv:<perception-response> is deprecated: use symbolic_msgs-srv:perception-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <perception-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader symbolic_msgs-srv:success-val is deprecated.  Use symbolic_msgs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'det_2d-val :lambda-list '(m))
(cl:defmethod det_2d-val ((m <perception-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader symbolic_msgs-srv:det_2d-val is deprecated.  Use symbolic_msgs-srv:det_2d instead.")
  (det_2d m))

(cl:ensure-generic-function 'instance_id-val :lambda-list '(m))
(cl:defmethod instance_id-val ((m <perception-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader symbolic_msgs-srv:instance_id-val is deprecated.  Use symbolic_msgs-srv:instance_id instead.")
  (instance_id m))

(cl:ensure-generic-function 'det_3d-val :lambda-list '(m))
(cl:defmethod det_3d-val ((m <perception-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader symbolic_msgs-srv:det_3d-val is deprecated.  Use symbolic_msgs-srv:det_3d instead.")
  (det_3d m))

(cl:ensure-generic-function 'grasp_pose-val :lambda-list '(m))
(cl:defmethod grasp_pose-val ((m <perception-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader symbolic_msgs-srv:grasp_pose-val is deprecated.  Use symbolic_msgs-srv:grasp_pose instead.")
  (grasp_pose m))

(cl:ensure-generic-function 'table_pose-val :lambda-list '(m))
(cl:defmethod table_pose-val ((m <perception-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader symbolic_msgs-srv:table_pose-val is deprecated.  Use symbolic_msgs-srv:table_pose instead.")
  (table_pose m))

(cl:ensure-generic-function 'shelf_pose-val :lambda-list '(m))
(cl:defmethod shelf_pose-val ((m <perception-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader symbolic_msgs-srv:shelf_pose-val is deprecated.  Use symbolic_msgs-srv:shelf_pose instead.")
  (shelf_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <perception-response>) ostream)
  "Serializes a message object of type '<perception-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'det_2d) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'instance_id) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'det_3d) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'grasp_pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'table_pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'shelf_pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <perception-response>) istream)
  "Deserializes a message object of type '<perception-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'det_2d) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'instance_id) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'det_3d) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'grasp_pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'table_pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'shelf_pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<perception-response>)))
  "Returns string type for a service object of type '<perception-response>"
  "symbolic_msgs/perceptionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'perception-response)))
  "Returns string type for a service object of type 'perception-response"
  "symbolic_msgs/perceptionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<perception-response>)))
  "Returns md5sum for a message object of type '<perception-response>"
  "66a96c4350836d51ca0d6a2c28ae7f73")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'perception-response)))
  "Returns md5sum for a message object of type 'perception-response"
  "66a96c4350836d51ca0d6a2c28ae7f73")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<perception-response>)))
  "Returns full string definition for message of type '<perception-response>"
  (cl:format cl:nil "# rosponse~%bool success~%vision_msgs/Detection2DArray det_2d~%std_msgs/Int16MultiArray instance_id~%vision_msgs/Detection3DArray det_3d~%geometry_msgs/PoseArray grasp_pose~%vision_msgs/BoundingBox3D table_pose~%vision_msgs/BoundingBox3D shelf_pose~%~%================================================================================~%MSG: vision_msgs/Detection2DArray~%# A list of 2D detections, for a multi-object 2D detector.~%~%Header header~%~%# A list of the detected proposals. A multi-proposal detector might generate~%#   this list with many candidate detections generated from a single input.~%Detection2D[] detections~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: vision_msgs/Detection2D~%# Defines a 2D detection result.~%#~%# This is similar to a 2D classification, but includes position information,~%#   allowing a classification result for a specific crop or image point to~%#   to be located in the larger image.~%~%Header header~%~%# Class probabilities~%ObjectHypothesisWithPose[] results~%~%# 2D bounding box surrounding the object.~%BoundingBox2D bbox~%~%# The 2D data that generated these results (i.e. region proposal cropped out of~%#   the image). Not required for all use cases, so it may be empty.~%sensor_msgs/Image source_img~%~%================================================================================~%MSG: vision_msgs/ObjectHypothesisWithPose~%# An object hypothesis that contains position information.~%~%# The unique numeric ID of object detected. To get additional information about~%#   this ID, such as its human-readable name, listeners should perform a lookup~%#   in a metadata database. See vision_msgs/VisionInfo.msg for more detail.~%int64 id~%~%# The probability or confidence value of the detected object. By convention,~%#   this value should lie in the range [0-1].~%float64 score~%~%# The 6D pose of the object hypothesis. This pose should be~%#   defined as the pose of some fixed reference point on the object, such a~%#   the geometric center of the bounding box or the center of mass of the~%#   object.~%# Note that this pose is not stamped; frame information can be defined by~%#   parent messages.~%# Also note that different classes predicted for the same input data may have~%#   different predicted 6D poses.~%geometry_msgs/PoseWithCovariance pose~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: vision_msgs/BoundingBox2D~%# A 2D bounding box that can be rotated about its center.~%# All dimensions are in pixels, but represented using floating-point~%#   values to allow sub-pixel precision. If an exact pixel crop is required~%#   for a rotated bounding box, it can be calculated using Bresenham's line~%#   algorithm.~%~%# The 2D position (in pixels) and orientation of the bounding box center.~%geometry_msgs/Pose2D center~%~%# The size (in pixels) of the bounding box surrounding the object relative~%#   to the pose of its center.~%float64 size_x~%float64 size_y~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Int16MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%int16[]           data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%================================================================================~%MSG: vision_msgs/Detection3DArray~%# A list of 3D detections, for a multi-object 3D detector.~%~%Header header~%~%# A list of the detected proposals. A multi-proposal detector might generate~%#   this list with many candidate detections generated from a single input.~%Detection3D[] detections~%~%================================================================================~%MSG: vision_msgs/Detection3D~%# Defines a 3D detection result.~%#~%# This extends a basic 3D classification by including position information,~%#   allowing a classification result for a specific position in an image to~%#   to be located in the larger image.~%~%Header header~%~%# Class probabilities. Does not have to include hypotheses for all possible~%#   object ids, the scores for any ids not listed are assumed to be 0.~%ObjectHypothesisWithPose[] results~%~%# 3D bounding box surrounding the object.~%BoundingBox3D bbox~%~%# The 3D data that generated these results (i.e. region proposal cropped out of~%#   the image). This information is not required for all detectors, so it may~%#   be empty.~%sensor_msgs/PointCloud2 source_cloud~%~%================================================================================~%MSG: vision_msgs/BoundingBox3D~%# A 3D bounding box that can be positioned and rotated about its center (6 DOF)~%# Dimensions of this box are in meters, and as such, it may be migrated to~%#   another package, such as geometry_msgs, in the future.~%~%# The 3D position and orientation of the bounding box center~%geometry_msgs/Pose center~%~%# The size of the bounding box, in meters, surrounding the object's center~%#   pose.~%geometry_msgs/Vector3 size~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%================================================================================~%MSG: geometry_msgs/PoseArray~%# An array of poses with a header for global reference.~%~%Header header~%~%Pose[] poses~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'perception-response)))
  "Returns full string definition for message of type 'perception-response"
  (cl:format cl:nil "# rosponse~%bool success~%vision_msgs/Detection2DArray det_2d~%std_msgs/Int16MultiArray instance_id~%vision_msgs/Detection3DArray det_3d~%geometry_msgs/PoseArray grasp_pose~%vision_msgs/BoundingBox3D table_pose~%vision_msgs/BoundingBox3D shelf_pose~%~%================================================================================~%MSG: vision_msgs/Detection2DArray~%# A list of 2D detections, for a multi-object 2D detector.~%~%Header header~%~%# A list of the detected proposals. A multi-proposal detector might generate~%#   this list with many candidate detections generated from a single input.~%Detection2D[] detections~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: vision_msgs/Detection2D~%# Defines a 2D detection result.~%#~%# This is similar to a 2D classification, but includes position information,~%#   allowing a classification result for a specific crop or image point to~%#   to be located in the larger image.~%~%Header header~%~%# Class probabilities~%ObjectHypothesisWithPose[] results~%~%# 2D bounding box surrounding the object.~%BoundingBox2D bbox~%~%# The 2D data that generated these results (i.e. region proposal cropped out of~%#   the image). Not required for all use cases, so it may be empty.~%sensor_msgs/Image source_img~%~%================================================================================~%MSG: vision_msgs/ObjectHypothesisWithPose~%# An object hypothesis that contains position information.~%~%# The unique numeric ID of object detected. To get additional information about~%#   this ID, such as its human-readable name, listeners should perform a lookup~%#   in a metadata database. See vision_msgs/VisionInfo.msg for more detail.~%int64 id~%~%# The probability or confidence value of the detected object. By convention,~%#   this value should lie in the range [0-1].~%float64 score~%~%# The 6D pose of the object hypothesis. This pose should be~%#   defined as the pose of some fixed reference point on the object, such a~%#   the geometric center of the bounding box or the center of mass of the~%#   object.~%# Note that this pose is not stamped; frame information can be defined by~%#   parent messages.~%# Also note that different classes predicted for the same input data may have~%#   different predicted 6D poses.~%geometry_msgs/PoseWithCovariance pose~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: vision_msgs/BoundingBox2D~%# A 2D bounding box that can be rotated about its center.~%# All dimensions are in pixels, but represented using floating-point~%#   values to allow sub-pixel precision. If an exact pixel crop is required~%#   for a rotated bounding box, it can be calculated using Bresenham's line~%#   algorithm.~%~%# The 2D position (in pixels) and orientation of the bounding box center.~%geometry_msgs/Pose2D center~%~%# The size (in pixels) of the bounding box surrounding the object relative~%#   to the pose of its center.~%float64 size_x~%float64 size_y~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Int16MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%int16[]           data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%================================================================================~%MSG: vision_msgs/Detection3DArray~%# A list of 3D detections, for a multi-object 3D detector.~%~%Header header~%~%# A list of the detected proposals. A multi-proposal detector might generate~%#   this list with many candidate detections generated from a single input.~%Detection3D[] detections~%~%================================================================================~%MSG: vision_msgs/Detection3D~%# Defines a 3D detection result.~%#~%# This extends a basic 3D classification by including position information,~%#   allowing a classification result for a specific position in an image to~%#   to be located in the larger image.~%~%Header header~%~%# Class probabilities. Does not have to include hypotheses for all possible~%#   object ids, the scores for any ids not listed are assumed to be 0.~%ObjectHypothesisWithPose[] results~%~%# 3D bounding box surrounding the object.~%BoundingBox3D bbox~%~%# The 3D data that generated these results (i.e. region proposal cropped out of~%#   the image). This information is not required for all detectors, so it may~%#   be empty.~%sensor_msgs/PointCloud2 source_cloud~%~%================================================================================~%MSG: vision_msgs/BoundingBox3D~%# A 3D bounding box that can be positioned and rotated about its center (6 DOF)~%# Dimensions of this box are in meters, and as such, it may be migrated to~%#   another package, such as geometry_msgs, in the future.~%~%# The 3D position and orientation of the bounding box center~%geometry_msgs/Pose center~%~%# The size of the bounding box, in meters, surrounding the object's center~%#   pose.~%geometry_msgs/Vector3 size~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%================================================================================~%MSG: geometry_msgs/PoseArray~%# An array of poses with a header for global reference.~%~%Header header~%~%Pose[] poses~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <perception-response>))
  (cl:+ 0
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'det_2d))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'instance_id))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'det_3d))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'grasp_pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'table_pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'shelf_pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <perception-response>))
  "Converts a ROS message object to a list"
  (cl:list 'perception-response
    (cl:cons ':success (success msg))
    (cl:cons ':det_2d (det_2d msg))
    (cl:cons ':instance_id (instance_id msg))
    (cl:cons ':det_3d (det_3d msg))
    (cl:cons ':grasp_pose (grasp_pose msg))
    (cl:cons ':table_pose (table_pose msg))
    (cl:cons ':shelf_pose (shelf_pose msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'perception)))
  'perception-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'perception)))
  'perception-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'perception)))
  "Returns string type for a service object of type '<perception>"
  "symbolic_msgs/perception")