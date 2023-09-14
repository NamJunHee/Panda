; Auto-generated. Do not edit!


(cl:in-package symbolic_msgs-msg)


;//! \htmlinclude PlanResult.msg.html

(cl:defclass <PlanResult> (roslisp-msg-protocol:ros-message)
  ((task_id
    :reader task_id
    :initarg :task_id
    :type cl:integer
    :initform 0)
   (plan
    :reader plan
    :initarg :plan
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (result
    :reader result
    :initarg :result
    :type cl:integer
    :initform 0))
)

(cl:defclass PlanResult (<PlanResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PlanResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PlanResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name symbolic_msgs-msg:<PlanResult> is deprecated: use symbolic_msgs-msg:PlanResult instead.")))

(cl:ensure-generic-function 'task_id-val :lambda-list '(m))
(cl:defmethod task_id-val ((m <PlanResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader symbolic_msgs-msg:task_id-val is deprecated.  Use symbolic_msgs-msg:task_id instead.")
  (task_id m))

(cl:ensure-generic-function 'plan-val :lambda-list '(m))
(cl:defmethod plan-val ((m <PlanResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader symbolic_msgs-msg:plan-val is deprecated.  Use symbolic_msgs-msg:plan instead.")
  (plan m))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <PlanResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader symbolic_msgs-msg:result-val is deprecated.  Use symbolic_msgs-msg:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<PlanResult>)))
    "Constants for message type '<PlanResult>"
  '((:SUCCESS . 1)
    (:FAILED . -1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'PlanResult)))
    "Constants for message type 'PlanResult"
  '((:SUCCESS . 1)
    (:FAILED . -1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PlanResult>) ostream)
  "Serializes a message object of type '<PlanResult>"
  (cl:let* ((signed (cl:slot-value msg 'task_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'plan))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'plan))
  (cl:let* ((signed (cl:slot-value msg 'result)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PlanResult>) istream)
  "Deserializes a message object of type '<PlanResult>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'task_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'plan) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'plan)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PlanResult>)))
  "Returns string type for a message object of type '<PlanResult>"
  "symbolic_msgs/PlanResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlanResult)))
  "Returns string type for a message object of type 'PlanResult"
  "symbolic_msgs/PlanResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PlanResult>)))
  "Returns md5sum for a message object of type '<PlanResult>"
  "38cc8a1052b509b68d15938d07f568f0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PlanResult)))
  "Returns md5sum for a message object of type 'PlanResult"
  "38cc8a1052b509b68d15938d07f568f0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PlanResult>)))
  "Returns full string definition for message of type '<PlanResult>"
  (cl:format cl:nil "int32 task_id~%string[] plan~%int32 result~%~%# result~%int32 SUCCESS = 1~%int32 FAILED = -1~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PlanResult)))
  "Returns full string definition for message of type 'PlanResult"
  (cl:format cl:nil "int32 task_id~%string[] plan~%int32 result~%~%# result~%int32 SUCCESS = 1~%int32 FAILED = -1~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PlanResult>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'plan) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PlanResult>))
  "Converts a ROS message object to a list"
  (cl:list 'PlanResult
    (cl:cons ':task_id (task_id msg))
    (cl:cons ':plan (plan msg))
    (cl:cons ':result (result msg))
))
