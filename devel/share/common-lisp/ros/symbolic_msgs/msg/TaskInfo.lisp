; Auto-generated. Do not edit!


(cl:in-package symbolic_msgs-msg)


;//! \htmlinclude TaskInfo.msg.html

(cl:defclass <TaskInfo> (roslisp-msg-protocol:ros-message)
  ((Detection_3D_Array
    :reader Detection_3D_Array
    :initarg :Detection_3D_Array
    :type vision_msgs-msg:Detection3DArray
    :initform (cl:make-instance 'vision_msgs-msg:Detection3DArray))
   (Grasp_Pose
    :reader Grasp_Pose
    :initarg :Grasp_Pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (Object_List
    :reader Object_List
    :initarg :Object_List
    :type (cl:vector std_msgs-msg:String)
   :initform (cl:make-array 0 :element-type 'std_msgs-msg:String :initial-element (cl:make-instance 'std_msgs-msg:String)))
   (Object_Feature
    :reader Object_Feature
    :initarg :Object_Feature
    :type (cl:vector std_msgs-msg:String)
   :initform (cl:make-array 0 :element-type 'std_msgs-msg:String :initial-element (cl:make-instance 'std_msgs-msg:String)))
   (Object_Symbolic_Data
    :reader Object_Symbolic_Data
    :initarg :Object_Symbolic_Data
    :type (cl:vector std_msgs-msg:String)
   :initform (cl:make-array 0 :element-type 'std_msgs-msg:String :initial-element (cl:make-instance 'std_msgs-msg:String)))
   (Task_Goal
    :reader Task_Goal
    :initarg :Task_Goal
    :type (cl:vector std_msgs-msg:String)
   :initform (cl:make-array 0 :element-type 'std_msgs-msg:String :initial-element (cl:make-instance 'std_msgs-msg:String))))
)

(cl:defclass TaskInfo (<TaskInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TaskInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TaskInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name symbolic_msgs-msg:<TaskInfo> is deprecated: use symbolic_msgs-msg:TaskInfo instead.")))

(cl:ensure-generic-function 'Detection_3D_Array-val :lambda-list '(m))
(cl:defmethod Detection_3D_Array-val ((m <TaskInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader symbolic_msgs-msg:Detection_3D_Array-val is deprecated.  Use symbolic_msgs-msg:Detection_3D_Array instead.")
  (Detection_3D_Array m))

(cl:ensure-generic-function 'Grasp_Pose-val :lambda-list '(m))
(cl:defmethod Grasp_Pose-val ((m <TaskInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader symbolic_msgs-msg:Grasp_Pose-val is deprecated.  Use symbolic_msgs-msg:Grasp_Pose instead.")
  (Grasp_Pose m))

(cl:ensure-generic-function 'Object_List-val :lambda-list '(m))
(cl:defmethod Object_List-val ((m <TaskInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader symbolic_msgs-msg:Object_List-val is deprecated.  Use symbolic_msgs-msg:Object_List instead.")
  (Object_List m))

(cl:ensure-generic-function 'Object_Feature-val :lambda-list '(m))
(cl:defmethod Object_Feature-val ((m <TaskInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader symbolic_msgs-msg:Object_Feature-val is deprecated.  Use symbolic_msgs-msg:Object_Feature instead.")
  (Object_Feature m))

(cl:ensure-generic-function 'Object_Symbolic_Data-val :lambda-list '(m))
(cl:defmethod Object_Symbolic_Data-val ((m <TaskInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader symbolic_msgs-msg:Object_Symbolic_Data-val is deprecated.  Use symbolic_msgs-msg:Object_Symbolic_Data instead.")
  (Object_Symbolic_Data m))

(cl:ensure-generic-function 'Task_Goal-val :lambda-list '(m))
(cl:defmethod Task_Goal-val ((m <TaskInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader symbolic_msgs-msg:Task_Goal-val is deprecated.  Use symbolic_msgs-msg:Task_Goal instead.")
  (Task_Goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TaskInfo>) ostream)
  "Serializes a message object of type '<TaskInfo>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Detection_3D_Array) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Grasp_Pose) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'Object_List))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'Object_List))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'Object_Feature))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'Object_Feature))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'Object_Symbolic_Data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'Object_Symbolic_Data))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'Task_Goal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'Task_Goal))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TaskInfo>) istream)
  "Deserializes a message object of type '<TaskInfo>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Detection_3D_Array) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Grasp_Pose) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'Object_List) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'Object_List)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'std_msgs-msg:String))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'Object_Feature) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'Object_Feature)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'std_msgs-msg:String))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'Object_Symbolic_Data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'Object_Symbolic_Data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'std_msgs-msg:String))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'Task_Goal) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'Task_Goal)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'std_msgs-msg:String))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TaskInfo>)))
  "Returns string type for a message object of type '<TaskInfo>"
  "symbolic_msgs/TaskInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TaskInfo)))
  "Returns string type for a message object of type 'TaskInfo"
  "symbolic_msgs/TaskInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TaskInfo>)))
  "Returns md5sum for a message object of type '<TaskInfo>"
  "4a0d32656f5b9bd118d9cc7e00f8102a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TaskInfo)))
  "Returns md5sum for a message object of type 'TaskInfo"
  "4a0d32656f5b9bd118d9cc7e00f8102a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TaskInfo>)))
  "Returns full string definition for message of type '<TaskInfo>"
  (cl:format cl:nil "vision_msgs/Detection3DArray Detection_3D_Array~%geometry_msgs/Pose Grasp_Pose~%std_msgs/String[] Object_List~%std_msgs/String[] Object_Feature~%std_msgs/String[] Object_Symbolic_Data~%std_msgs/String[] Task_Goal~%~%~%================================================================================~%MSG: vision_msgs/Detection3DArray~%# A list of 3D detections, for a multi-object 3D detector.~%~%Header header~%~%# A list of the detected proposals. A multi-proposal detector might generate~%#   this list with many candidate detections generated from a single input.~%Detection3D[] detections~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: vision_msgs/Detection3D~%# Defines a 3D detection result.~%#~%# This extends a basic 3D classification by including position information,~%#   allowing a classification result for a specific position in an image to~%#   to be located in the larger image.~%~%Header header~%~%# Class probabilities. Does not have to include hypotheses for all possible~%#   object ids, the scores for any ids not listed are assumed to be 0.~%ObjectHypothesisWithPose[] results~%~%# 3D bounding box surrounding the object.~%BoundingBox3D bbox~%~%# The 3D data that generated these results (i.e. region proposal cropped out of~%#   the image). This information is not required for all detectors, so it may~%#   be empty.~%sensor_msgs/PointCloud2 source_cloud~%~%================================================================================~%MSG: vision_msgs/ObjectHypothesisWithPose~%# An object hypothesis that contains position information.~%~%# The unique numeric ID of object detected. To get additional information about~%#   this ID, such as its human-readable name, listeners should perform a lookup~%#   in a metadata database. See vision_msgs/VisionInfo.msg for more detail.~%int64 id~%~%# The probability or confidence value of the detected object. By convention,~%#   this value should lie in the range [0-1].~%float64 score~%~%# The 6D pose of the object hypothesis. This pose should be~%#   defined as the pose of some fixed reference point on the object, such a~%#   the geometric center of the bounding box or the center of mass of the~%#   object.~%# Note that this pose is not stamped; frame information can be defined by~%#   parent messages.~%# Also note that different classes predicted for the same input data may have~%#   different predicted 6D poses.~%geometry_msgs/PoseWithCovariance pose~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: vision_msgs/BoundingBox3D~%# A 3D bounding box that can be positioned and rotated about its center (6 DOF)~%# Dimensions of this box are in meters, and as such, it may be migrated to~%#   another package, such as geometry_msgs, in the future.~%~%# The 3D position and orientation of the bounding box center~%geometry_msgs/Pose center~%~%# The size of the bounding box, in meters, surrounding the object's center~%#   pose.~%geometry_msgs/Vector3 size~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TaskInfo)))
  "Returns full string definition for message of type 'TaskInfo"
  (cl:format cl:nil "vision_msgs/Detection3DArray Detection_3D_Array~%geometry_msgs/Pose Grasp_Pose~%std_msgs/String[] Object_List~%std_msgs/String[] Object_Feature~%std_msgs/String[] Object_Symbolic_Data~%std_msgs/String[] Task_Goal~%~%~%================================================================================~%MSG: vision_msgs/Detection3DArray~%# A list of 3D detections, for a multi-object 3D detector.~%~%Header header~%~%# A list of the detected proposals. A multi-proposal detector might generate~%#   this list with many candidate detections generated from a single input.~%Detection3D[] detections~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: vision_msgs/Detection3D~%# Defines a 3D detection result.~%#~%# This extends a basic 3D classification by including position information,~%#   allowing a classification result for a specific position in an image to~%#   to be located in the larger image.~%~%Header header~%~%# Class probabilities. Does not have to include hypotheses for all possible~%#   object ids, the scores for any ids not listed are assumed to be 0.~%ObjectHypothesisWithPose[] results~%~%# 3D bounding box surrounding the object.~%BoundingBox3D bbox~%~%# The 3D data that generated these results (i.e. region proposal cropped out of~%#   the image). This information is not required for all detectors, so it may~%#   be empty.~%sensor_msgs/PointCloud2 source_cloud~%~%================================================================================~%MSG: vision_msgs/ObjectHypothesisWithPose~%# An object hypothesis that contains position information.~%~%# The unique numeric ID of object detected. To get additional information about~%#   this ID, such as its human-readable name, listeners should perform a lookup~%#   in a metadata database. See vision_msgs/VisionInfo.msg for more detail.~%int64 id~%~%# The probability or confidence value of the detected object. By convention,~%#   this value should lie in the range [0-1].~%float64 score~%~%# The 6D pose of the object hypothesis. This pose should be~%#   defined as the pose of some fixed reference point on the object, such a~%#   the geometric center of the bounding box or the center of mass of the~%#   object.~%# Note that this pose is not stamped; frame information can be defined by~%#   parent messages.~%# Also note that different classes predicted for the same input data may have~%#   different predicted 6D poses.~%geometry_msgs/PoseWithCovariance pose~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: vision_msgs/BoundingBox3D~%# A 3D bounding box that can be positioned and rotated about its center (6 DOF)~%# Dimensions of this box are in meters, and as such, it may be migrated to~%#   another package, such as geometry_msgs, in the future.~%~%# The 3D position and orientation of the bounding box center~%geometry_msgs/Pose center~%~%# The size of the bounding box, in meters, surrounding the object's center~%#   pose.~%geometry_msgs/Vector3 size~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TaskInfo>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Detection_3D_Array))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Grasp_Pose))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'Object_List) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'Object_Feature) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'Object_Symbolic_Data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'Task_Goal) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TaskInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'TaskInfo
    (cl:cons ':Detection_3D_Array (Detection_3D_Array msg))
    (cl:cons ':Grasp_Pose (Grasp_Pose msg))
    (cl:cons ':Object_List (Object_List msg))
    (cl:cons ':Object_Feature (Object_Feature msg))
    (cl:cons ':Object_Symbolic_Data (Object_Symbolic_Data msg))
    (cl:cons ':Task_Goal (Task_Goal msg))
))
