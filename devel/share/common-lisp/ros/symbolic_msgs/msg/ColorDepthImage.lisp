; Auto-generated. Do not edit!


(cl:in-package symbolic_msgs-msg)


;//! \htmlinclude ColorDepthImage.msg.html

(cl:defclass <ColorDepthImage> (roslisp-msg-protocol:ros-message)
  ((json
    :reader json
    :initarg :json
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass ColorDepthImage (<ColorDepthImage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ColorDepthImage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ColorDepthImage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name symbolic_msgs-msg:<ColorDepthImage> is deprecated: use symbolic_msgs-msg:ColorDepthImage instead.")))

(cl:ensure-generic-function 'json-val :lambda-list '(m))
(cl:defmethod json-val ((m <ColorDepthImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader symbolic_msgs-msg:json-val is deprecated.  Use symbolic_msgs-msg:json instead.")
  (json m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ColorDepthImage>) ostream)
  "Serializes a message object of type '<ColorDepthImage>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'json))))
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
   (cl:slot-value msg 'json))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ColorDepthImage>) istream)
  "Deserializes a message object of type '<ColorDepthImage>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'json) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'json)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ColorDepthImage>)))
  "Returns string type for a message object of type '<ColorDepthImage>"
  "symbolic_msgs/ColorDepthImage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ColorDepthImage)))
  "Returns string type for a message object of type 'ColorDepthImage"
  "symbolic_msgs/ColorDepthImage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ColorDepthImage>)))
  "Returns md5sum for a message object of type '<ColorDepthImage>"
  "2518043d6087e4ba95ef63957da66e6b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ColorDepthImage)))
  "Returns md5sum for a message object of type 'ColorDepthImage"
  "2518043d6087e4ba95ef63957da66e6b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ColorDepthImage>)))
  "Returns full string definition for message of type '<ColorDepthImage>"
  (cl:format cl:nil "string[] json~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ColorDepthImage)))
  "Returns full string definition for message of type 'ColorDepthImage"
  (cl:format cl:nil "string[] json~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ColorDepthImage>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'json) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ColorDepthImage>))
  "Converts a ROS message object to a list"
  (cl:list 'ColorDepthImage
    (cl:cons ':json (json msg))
))
