; Auto-generated. Do not edit!


(cl:in-package symbolic_msgs-msg)


;//! \htmlinclude ActionResult.msg.html

(cl:defclass <ActionResult> (roslisp-msg-protocol:ros-message)
  ((action_id
    :reader action_id
    :initarg :action_id
    :type cl:integer
    :initform 0)
   (objects
    :reader objects
    :initarg :objects
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (result
    :reader result
    :initarg :result
    :type cl:integer
    :initform 0))
)

(cl:defclass ActionResult (<ActionResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ActionResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ActionResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name symbolic_msgs-msg:<ActionResult> is deprecated: use symbolic_msgs-msg:ActionResult instead.")))

(cl:ensure-generic-function 'action_id-val :lambda-list '(m))
(cl:defmethod action_id-val ((m <ActionResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader symbolic_msgs-msg:action_id-val is deprecated.  Use symbolic_msgs-msg:action_id instead.")
  (action_id m))

(cl:ensure-generic-function 'objects-val :lambda-list '(m))
(cl:defmethod objects-val ((m <ActionResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader symbolic_msgs-msg:objects-val is deprecated.  Use symbolic_msgs-msg:objects instead.")
  (objects m))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <ActionResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader symbolic_msgs-msg:result-val is deprecated.  Use symbolic_msgs-msg:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<ActionResult>)))
    "Constants for message type '<ActionResult>"
  '((:ACTION_MOVE_FREE . 100)
    (:ACTION_MOVE_HOLDING . 101)
    (:ACTION_PICK . 102)
    (:ACTION_PLACE_ON . 103)
    (:ACTION_PLACE_IN . 104)
    (:ACTION_STACK_IN . 105)
    (:SUCCESS . 1)
    (:STATE_UPDATE_REQUIRED . 0)
    (:FAILED . -1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'ActionResult)))
    "Constants for message type 'ActionResult"
  '((:ACTION_MOVE_FREE . 100)
    (:ACTION_MOVE_HOLDING . 101)
    (:ACTION_PICK . 102)
    (:ACTION_PLACE_ON . 103)
    (:ACTION_PLACE_IN . 104)
    (:ACTION_STACK_IN . 105)
    (:SUCCESS . 1)
    (:STATE_UPDATE_REQUIRED . 0)
    (:FAILED . -1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ActionResult>) ostream)
  "Serializes a message object of type '<ActionResult>"
  (cl:let* ((signed (cl:slot-value msg 'action_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'objects))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'objects))
  (cl:let* ((signed (cl:slot-value msg 'result)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ActionResult>) istream)
  "Deserializes a message object of type '<ActionResult>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'action_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'objects) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'objects)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ActionResult>)))
  "Returns string type for a message object of type '<ActionResult>"
  "symbolic_msgs/ActionResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ActionResult)))
  "Returns string type for a message object of type 'ActionResult"
  "symbolic_msgs/ActionResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ActionResult>)))
  "Returns md5sum for a message object of type '<ActionResult>"
  "f7072e87515b1c12d8c225bf21a0bcf4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ActionResult)))
  "Returns md5sum for a message object of type 'ActionResult"
  "f7072e87515b1c12d8c225bf21a0bcf4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ActionResult>)))
  "Returns full string definition for message of type '<ActionResult>"
  (cl:format cl:nil "int32 action_id~%int32[] objects~%int32 result~%~%# action_id~%int32 ACTION_MOVE_FREE = 100 # objects = []~%int32 ACTION_MOVE_HOLDING = 101 # objects = [holding_object]~%int32 ACTION_PICK = 102 # objects = [picked_object]~%int32 ACTION_PLACE_ON = 103 # objects = [object_top, object_bottom]~%int32 ACTION_PLACE_IN = 104 # objects = [object_inner, object_outer]~%int32 ACTION_STACK_IN = 105 # objects = [object_top, object_bottom]~%~%# result~%int32 SUCCESS = 1~%int32 STATE_UPDATE_REQUIRED = 0~%int32 FAILED = -1~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ActionResult)))
  "Returns full string definition for message of type 'ActionResult"
  (cl:format cl:nil "int32 action_id~%int32[] objects~%int32 result~%~%# action_id~%int32 ACTION_MOVE_FREE = 100 # objects = []~%int32 ACTION_MOVE_HOLDING = 101 # objects = [holding_object]~%int32 ACTION_PICK = 102 # objects = [picked_object]~%int32 ACTION_PLACE_ON = 103 # objects = [object_top, object_bottom]~%int32 ACTION_PLACE_IN = 104 # objects = [object_inner, object_outer]~%int32 ACTION_STACK_IN = 105 # objects = [object_top, object_bottom]~%~%# result~%int32 SUCCESS = 1~%int32 STATE_UPDATE_REQUIRED = 0~%int32 FAILED = -1~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ActionResult>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'objects) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ActionResult>))
  "Converts a ROS message object to a list"
  (cl:list 'ActionResult
    (cl:cons ':action_id (action_id msg))
    (cl:cons ':objects (objects msg))
    (cl:cons ':result (result msg))
))
