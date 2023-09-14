; Auto-generated. Do not edit!


(cl:in-package njh_panda_moveit_pkg-srv)


;//! \htmlinclude test_moveit_service-request.msg.html

(cl:defclass <test_moveit_service-request> (roslisp-msg-protocol:ros-message)
  ((a
    :reader a
    :initarg :a
    :type cl:integer
    :initform 0)
   (b
    :reader b
    :initarg :b
    :type cl:integer
    :initform 0))
)

(cl:defclass test_moveit_service-request (<test_moveit_service-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <test_moveit_service-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'test_moveit_service-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name njh_panda_moveit_pkg-srv:<test_moveit_service-request> is deprecated: use njh_panda_moveit_pkg-srv:test_moveit_service-request instead.")))

(cl:ensure-generic-function 'a-val :lambda-list '(m))
(cl:defmethod a-val ((m <test_moveit_service-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader njh_panda_moveit_pkg-srv:a-val is deprecated.  Use njh_panda_moveit_pkg-srv:a instead.")
  (a m))

(cl:ensure-generic-function 'b-val :lambda-list '(m))
(cl:defmethod b-val ((m <test_moveit_service-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader njh_panda_moveit_pkg-srv:b-val is deprecated.  Use njh_panda_moveit_pkg-srv:b instead.")
  (b m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <test_moveit_service-request>) ostream)
  "Serializes a message object of type '<test_moveit_service-request>"
  (cl:let* ((signed (cl:slot-value msg 'a)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'b)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <test_moveit_service-request>) istream)
  "Deserializes a message object of type '<test_moveit_service-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'a) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'b) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<test_moveit_service-request>)))
  "Returns string type for a service object of type '<test_moveit_service-request>"
  "njh_panda_moveit_pkg/test_moveit_serviceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'test_moveit_service-request)))
  "Returns string type for a service object of type 'test_moveit_service-request"
  "njh_panda_moveit_pkg/test_moveit_serviceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<test_moveit_service-request>)))
  "Returns md5sum for a message object of type '<test_moveit_service-request>"
  "6a2e34150c00229791cc89ff309fff21")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'test_moveit_service-request)))
  "Returns md5sum for a message object of type 'test_moveit_service-request"
  "6a2e34150c00229791cc89ff309fff21")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<test_moveit_service-request>)))
  "Returns full string definition for message of type '<test_moveit_service-request>"
  (cl:format cl:nil "~%int64 a~%int64 b~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'test_moveit_service-request)))
  "Returns full string definition for message of type 'test_moveit_service-request"
  (cl:format cl:nil "~%int64 a~%int64 b~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <test_moveit_service-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <test_moveit_service-request>))
  "Converts a ROS message object to a list"
  (cl:list 'test_moveit_service-request
    (cl:cons ':a (a msg))
    (cl:cons ':b (b msg))
))
;//! \htmlinclude test_moveit_service-response.msg.html

(cl:defclass <test_moveit_service-response> (roslisp-msg-protocol:ros-message)
  ((sum
    :reader sum
    :initarg :sum
    :type cl:integer
    :initform 0))
)

(cl:defclass test_moveit_service-response (<test_moveit_service-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <test_moveit_service-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'test_moveit_service-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name njh_panda_moveit_pkg-srv:<test_moveit_service-response> is deprecated: use njh_panda_moveit_pkg-srv:test_moveit_service-response instead.")))

(cl:ensure-generic-function 'sum-val :lambda-list '(m))
(cl:defmethod sum-val ((m <test_moveit_service-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader njh_panda_moveit_pkg-srv:sum-val is deprecated.  Use njh_panda_moveit_pkg-srv:sum instead.")
  (sum m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <test_moveit_service-response>) ostream)
  "Serializes a message object of type '<test_moveit_service-response>"
  (cl:let* ((signed (cl:slot-value msg 'sum)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <test_moveit_service-response>) istream)
  "Deserializes a message object of type '<test_moveit_service-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sum) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<test_moveit_service-response>)))
  "Returns string type for a service object of type '<test_moveit_service-response>"
  "njh_panda_moveit_pkg/test_moveit_serviceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'test_moveit_service-response)))
  "Returns string type for a service object of type 'test_moveit_service-response"
  "njh_panda_moveit_pkg/test_moveit_serviceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<test_moveit_service-response>)))
  "Returns md5sum for a message object of type '<test_moveit_service-response>"
  "6a2e34150c00229791cc89ff309fff21")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'test_moveit_service-response)))
  "Returns md5sum for a message object of type 'test_moveit_service-response"
  "6a2e34150c00229791cc89ff309fff21")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<test_moveit_service-response>)))
  "Returns full string definition for message of type '<test_moveit_service-response>"
  (cl:format cl:nil "~%int64 sum~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'test_moveit_service-response)))
  "Returns full string definition for message of type 'test_moveit_service-response"
  (cl:format cl:nil "~%int64 sum~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <test_moveit_service-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <test_moveit_service-response>))
  "Converts a ROS message object to a list"
  (cl:list 'test_moveit_service-response
    (cl:cons ':sum (sum msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'test_moveit_service)))
  'test_moveit_service-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'test_moveit_service)))
  'test_moveit_service-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'test_moveit_service)))
  "Returns string type for a service object of type '<test_moveit_service>"
  "njh_panda_moveit_pkg/test_moveit_service")