;; Auto-generated. Do not edit!


(when (boundp 'symbolic_msgs::perception)
  (if (not (find-package "SYMBOLIC_MSGS"))
    (make-package "SYMBOLIC_MSGS"))
  (shadow 'perception (find-package "SYMBOLIC_MSGS")))
(unless (find-package "SYMBOLIC_MSGS::PERCEPTION")
  (make-package "SYMBOLIC_MSGS::PERCEPTION"))
(unless (find-package "SYMBOLIC_MSGS::PERCEPTIONREQUEST")
  (make-package "SYMBOLIC_MSGS::PERCEPTIONREQUEST"))
(unless (find-package "SYMBOLIC_MSGS::PERCEPTIONRESPONSE")
  (make-package "SYMBOLIC_MSGS::PERCEPTIONRESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))
(if (not (find-package "VISION_MSGS"))
  (ros::roseus-add-msgs "vision_msgs"))


(defclass symbolic_msgs::perceptionRequest
  :super ros::object
  :slots (_detect_obj _place ))

(defmethod symbolic_msgs::perceptionRequest
  (:init
   (&key
    ((:detect_obj __detect_obj) nil)
    ((:place __place) 0)
    )
   (send-super :init)
   (setq _detect_obj __detect_obj)
   (setq _place (round __place))
   self)
  (:detect_obj
   (&optional (__detect_obj :null))
   (if (not (eq __detect_obj :null)) (setq _detect_obj __detect_obj)) _detect_obj)
  (:place
   (&optional __place)
   (if __place (setq _place __place)) _place)
  (:serialization-length
   ()
   (+
    ;; bool _detect_obj
    1
    ;; int32 _place
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _detect_obj
       (if _detect_obj (write-byte -1 s) (write-byte 0 s))
     ;; int32 _place
       (write-long _place s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _detect_obj
     (setq _detect_obj (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int32 _place
     (setq _place (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass symbolic_msgs::perceptionResponse
  :super ros::object
  :slots (_success _det_2d _instance_id _det_3d _grasp_pose _table_pose _shelf_pose ))

(defmethod symbolic_msgs::perceptionResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:det_2d __det_2d) (instance vision_msgs::Detection2DArray :init))
    ((:instance_id __instance_id) (instance std_msgs::Int16MultiArray :init))
    ((:det_3d __det_3d) (instance vision_msgs::Detection3DArray :init))
    ((:grasp_pose __grasp_pose) (instance geometry_msgs::PoseArray :init))
    ((:table_pose __table_pose) (instance vision_msgs::BoundingBox3D :init))
    ((:shelf_pose __shelf_pose) (instance vision_msgs::BoundingBox3D :init))
    )
   (send-super :init)
   (setq _success __success)
   (setq _det_2d __det_2d)
   (setq _instance_id __instance_id)
   (setq _det_3d __det_3d)
   (setq _grasp_pose __grasp_pose)
   (setq _table_pose __table_pose)
   (setq _shelf_pose __shelf_pose)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:det_2d
   (&rest __det_2d)
   (if (keywordp (car __det_2d))
       (send* _det_2d __det_2d)
     (progn
       (if __det_2d (setq _det_2d (car __det_2d)))
       _det_2d)))
  (:instance_id
   (&rest __instance_id)
   (if (keywordp (car __instance_id))
       (send* _instance_id __instance_id)
     (progn
       (if __instance_id (setq _instance_id (car __instance_id)))
       _instance_id)))
  (:det_3d
   (&rest __det_3d)
   (if (keywordp (car __det_3d))
       (send* _det_3d __det_3d)
     (progn
       (if __det_3d (setq _det_3d (car __det_3d)))
       _det_3d)))
  (:grasp_pose
   (&rest __grasp_pose)
   (if (keywordp (car __grasp_pose))
       (send* _grasp_pose __grasp_pose)
     (progn
       (if __grasp_pose (setq _grasp_pose (car __grasp_pose)))
       _grasp_pose)))
  (:table_pose
   (&rest __table_pose)
   (if (keywordp (car __table_pose))
       (send* _table_pose __table_pose)
     (progn
       (if __table_pose (setq _table_pose (car __table_pose)))
       _table_pose)))
  (:shelf_pose
   (&rest __shelf_pose)
   (if (keywordp (car __shelf_pose))
       (send* _shelf_pose __shelf_pose)
     (progn
       (if __shelf_pose (setq _shelf_pose (car __shelf_pose)))
       _shelf_pose)))
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; vision_msgs/Detection2DArray _det_2d
    (send _det_2d :serialization-length)
    ;; std_msgs/Int16MultiArray _instance_id
    (send _instance_id :serialization-length)
    ;; vision_msgs/Detection3DArray _det_3d
    (send _det_3d :serialization-length)
    ;; geometry_msgs/PoseArray _grasp_pose
    (send _grasp_pose :serialization-length)
    ;; vision_msgs/BoundingBox3D _table_pose
    (send _table_pose :serialization-length)
    ;; vision_msgs/BoundingBox3D _shelf_pose
    (send _shelf_pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; vision_msgs/Detection2DArray _det_2d
       (send _det_2d :serialize s)
     ;; std_msgs/Int16MultiArray _instance_id
       (send _instance_id :serialize s)
     ;; vision_msgs/Detection3DArray _det_3d
       (send _det_3d :serialize s)
     ;; geometry_msgs/PoseArray _grasp_pose
       (send _grasp_pose :serialize s)
     ;; vision_msgs/BoundingBox3D _table_pose
       (send _table_pose :serialize s)
     ;; vision_msgs/BoundingBox3D _shelf_pose
       (send _shelf_pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; vision_msgs/Detection2DArray _det_2d
     (send _det_2d :deserialize buf ptr-) (incf ptr- (send _det_2d :serialization-length))
   ;; std_msgs/Int16MultiArray _instance_id
     (send _instance_id :deserialize buf ptr-) (incf ptr- (send _instance_id :serialization-length))
   ;; vision_msgs/Detection3DArray _det_3d
     (send _det_3d :deserialize buf ptr-) (incf ptr- (send _det_3d :serialization-length))
   ;; geometry_msgs/PoseArray _grasp_pose
     (send _grasp_pose :deserialize buf ptr-) (incf ptr- (send _grasp_pose :serialization-length))
   ;; vision_msgs/BoundingBox3D _table_pose
     (send _table_pose :deserialize buf ptr-) (incf ptr- (send _table_pose :serialization-length))
   ;; vision_msgs/BoundingBox3D _shelf_pose
     (send _shelf_pose :deserialize buf ptr-) (incf ptr- (send _shelf_pose :serialization-length))
   ;;
   self)
  )

(defclass symbolic_msgs::perception
  :super ros::object
  :slots ())

(setf (get symbolic_msgs::perception :md5sum-) "66a96c4350836d51ca0d6a2c28ae7f73")
(setf (get symbolic_msgs::perception :datatype-) "symbolic_msgs/perception")
(setf (get symbolic_msgs::perception :request) symbolic_msgs::perceptionRequest)
(setf (get symbolic_msgs::perception :response) symbolic_msgs::perceptionResponse)

(defmethod symbolic_msgs::perceptionRequest
  (:response () (instance symbolic_msgs::perceptionResponse :init)))

(setf (get symbolic_msgs::perceptionRequest :md5sum-) "66a96c4350836d51ca0d6a2c28ae7f73")
(setf (get symbolic_msgs::perceptionRequest :datatype-) "symbolic_msgs/perceptionRequest")
(setf (get symbolic_msgs::perceptionRequest :definition-)
      "# request
bool detect_obj
int32 place
---
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
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
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
# contents of the \"fields\" array.

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
")

(setf (get symbolic_msgs::perceptionResponse :md5sum-) "66a96c4350836d51ca0d6a2c28ae7f73")
(setf (get symbolic_msgs::perceptionResponse :datatype-) "symbolic_msgs/perceptionResponse")
(setf (get symbolic_msgs::perceptionResponse :definition-)
      "# request
bool detect_obj
int32 place
---
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
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
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
# contents of the \"fields\" array.

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
")



(provide :symbolic_msgs/perception "66a96c4350836d51ca0d6a2c28ae7f73")


