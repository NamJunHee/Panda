;; Auto-generated. Do not edit!


(when (boundp 'symbolic_msgs::TaskInfo)
  (if (not (find-package "SYMBOLIC_MSGS"))
    (make-package "SYMBOLIC_MSGS"))
  (shadow 'TaskInfo (find-package "SYMBOLIC_MSGS")))
(unless (find-package "SYMBOLIC_MSGS::TASKINFO")
  (make-package "SYMBOLIC_MSGS::TASKINFO"))

(in-package "ROS")
;;//! \htmlinclude TaskInfo.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))
(if (not (find-package "VISION_MSGS"))
  (ros::roseus-add-msgs "vision_msgs"))


(defclass symbolic_msgs::TaskInfo
  :super ros::object
  :slots (_Detection_3D_Array _Grasp_Pose _Object_List _Object_Feature _Object_Symbolic_Data _Task_Goal ))

(defmethod symbolic_msgs::TaskInfo
  (:init
   (&key
    ((:Detection_3D_Array __Detection_3D_Array) (instance vision_msgs::Detection3DArray :init))
    ((:Grasp_Pose __Grasp_Pose) (instance geometry_msgs::Pose :init))
    ((:Object_List __Object_List) ())
    ((:Object_Feature __Object_Feature) ())
    ((:Object_Symbolic_Data __Object_Symbolic_Data) ())
    ((:Task_Goal __Task_Goal) ())
    )
   (send-super :init)
   (setq _Detection_3D_Array __Detection_3D_Array)
   (setq _Grasp_Pose __Grasp_Pose)
   (setq _Object_List __Object_List)
   (setq _Object_Feature __Object_Feature)
   (setq _Object_Symbolic_Data __Object_Symbolic_Data)
   (setq _Task_Goal __Task_Goal)
   self)
  (:Detection_3D_Array
   (&rest __Detection_3D_Array)
   (if (keywordp (car __Detection_3D_Array))
       (send* _Detection_3D_Array __Detection_3D_Array)
     (progn
       (if __Detection_3D_Array (setq _Detection_3D_Array (car __Detection_3D_Array)))
       _Detection_3D_Array)))
  (:Grasp_Pose
   (&rest __Grasp_Pose)
   (if (keywordp (car __Grasp_Pose))
       (send* _Grasp_Pose __Grasp_Pose)
     (progn
       (if __Grasp_Pose (setq _Grasp_Pose (car __Grasp_Pose)))
       _Grasp_Pose)))
  (:Object_List
   (&rest __Object_List)
   (if (keywordp (car __Object_List))
       (send* _Object_List __Object_List)
     (progn
       (if __Object_List (setq _Object_List (car __Object_List)))
       _Object_List)))
  (:Object_Feature
   (&rest __Object_Feature)
   (if (keywordp (car __Object_Feature))
       (send* _Object_Feature __Object_Feature)
     (progn
       (if __Object_Feature (setq _Object_Feature (car __Object_Feature)))
       _Object_Feature)))
  (:Object_Symbolic_Data
   (&rest __Object_Symbolic_Data)
   (if (keywordp (car __Object_Symbolic_Data))
       (send* _Object_Symbolic_Data __Object_Symbolic_Data)
     (progn
       (if __Object_Symbolic_Data (setq _Object_Symbolic_Data (car __Object_Symbolic_Data)))
       _Object_Symbolic_Data)))
  (:Task_Goal
   (&rest __Task_Goal)
   (if (keywordp (car __Task_Goal))
       (send* _Task_Goal __Task_Goal)
     (progn
       (if __Task_Goal (setq _Task_Goal (car __Task_Goal)))
       _Task_Goal)))
  (:serialization-length
   ()
   (+
    ;; vision_msgs/Detection3DArray _Detection_3D_Array
    (send _Detection_3D_Array :serialization-length)
    ;; geometry_msgs/Pose _Grasp_Pose
    (send _Grasp_Pose :serialization-length)
    ;; std_msgs/String[] _Object_List
    (apply #'+ (send-all _Object_List :serialization-length)) 4
    ;; std_msgs/String[] _Object_Feature
    (apply #'+ (send-all _Object_Feature :serialization-length)) 4
    ;; std_msgs/String[] _Object_Symbolic_Data
    (apply #'+ (send-all _Object_Symbolic_Data :serialization-length)) 4
    ;; std_msgs/String[] _Task_Goal
    (apply #'+ (send-all _Task_Goal :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; vision_msgs/Detection3DArray _Detection_3D_Array
       (send _Detection_3D_Array :serialize s)
     ;; geometry_msgs/Pose _Grasp_Pose
       (send _Grasp_Pose :serialize s)
     ;; std_msgs/String[] _Object_List
     (write-long (length _Object_List) s)
     (dolist (elem _Object_List)
       (send elem :serialize s)
       )
     ;; std_msgs/String[] _Object_Feature
     (write-long (length _Object_Feature) s)
     (dolist (elem _Object_Feature)
       (send elem :serialize s)
       )
     ;; std_msgs/String[] _Object_Symbolic_Data
     (write-long (length _Object_Symbolic_Data) s)
     (dolist (elem _Object_Symbolic_Data)
       (send elem :serialize s)
       )
     ;; std_msgs/String[] _Task_Goal
     (write-long (length _Task_Goal) s)
     (dolist (elem _Task_Goal)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; vision_msgs/Detection3DArray _Detection_3D_Array
     (send _Detection_3D_Array :deserialize buf ptr-) (incf ptr- (send _Detection_3D_Array :serialization-length))
   ;; geometry_msgs/Pose _Grasp_Pose
     (send _Grasp_Pose :deserialize buf ptr-) (incf ptr- (send _Grasp_Pose :serialization-length))
   ;; std_msgs/String[] _Object_List
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _Object_List (let (r) (dotimes (i n) (push (instance std_msgs::String :init) r)) r))
     (dolist (elem- _Object_List)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; std_msgs/String[] _Object_Feature
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _Object_Feature (let (r) (dotimes (i n) (push (instance std_msgs::String :init) r)) r))
     (dolist (elem- _Object_Feature)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; std_msgs/String[] _Object_Symbolic_Data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _Object_Symbolic_Data (let (r) (dotimes (i n) (push (instance std_msgs::String :init) r)) r))
     (dolist (elem- _Object_Symbolic_Data)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; std_msgs/String[] _Task_Goal
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _Task_Goal (let (r) (dotimes (i n) (push (instance std_msgs::String :init) r)) r))
     (dolist (elem- _Task_Goal)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get symbolic_msgs::TaskInfo :md5sum-) "4a0d32656f5b9bd118d9cc7e00f8102a")
(setf (get symbolic_msgs::TaskInfo :datatype-) "symbolic_msgs/TaskInfo")
(setf (get symbolic_msgs::TaskInfo :definition-)
      "vision_msgs/Detection3DArray Detection_3D_Array
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
MSG: std_msgs/String
string data

")



(provide :symbolic_msgs/TaskInfo "4a0d32656f5b9bd118d9cc7e00f8102a")


