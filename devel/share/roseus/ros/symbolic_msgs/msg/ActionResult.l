;; Auto-generated. Do not edit!


(when (boundp 'symbolic_msgs::ActionResult)
  (if (not (find-package "SYMBOLIC_MSGS"))
    (make-package "SYMBOLIC_MSGS"))
  (shadow 'ActionResult (find-package "SYMBOLIC_MSGS")))
(unless (find-package "SYMBOLIC_MSGS::ACTIONRESULT")
  (make-package "SYMBOLIC_MSGS::ACTIONRESULT"))

(in-package "ROS")
;;//! \htmlinclude ActionResult.msg.html


(intern "*ACTION_MOVE_FREE*" (find-package "SYMBOLIC_MSGS::ACTIONRESULT"))
(shadow '*ACTION_MOVE_FREE* (find-package "SYMBOLIC_MSGS::ACTIONRESULT"))
(defconstant symbolic_msgs::ActionResult::*ACTION_MOVE_FREE* 100)
(intern "*ACTION_MOVE_HOLDING*" (find-package "SYMBOLIC_MSGS::ACTIONRESULT"))
(shadow '*ACTION_MOVE_HOLDING* (find-package "SYMBOLIC_MSGS::ACTIONRESULT"))
(defconstant symbolic_msgs::ActionResult::*ACTION_MOVE_HOLDING* 101)
(intern "*ACTION_PICK*" (find-package "SYMBOLIC_MSGS::ACTIONRESULT"))
(shadow '*ACTION_PICK* (find-package "SYMBOLIC_MSGS::ACTIONRESULT"))
(defconstant symbolic_msgs::ActionResult::*ACTION_PICK* 102)
(intern "*ACTION_PLACE_ON*" (find-package "SYMBOLIC_MSGS::ACTIONRESULT"))
(shadow '*ACTION_PLACE_ON* (find-package "SYMBOLIC_MSGS::ACTIONRESULT"))
(defconstant symbolic_msgs::ActionResult::*ACTION_PLACE_ON* 103)
(intern "*ACTION_PLACE_IN*" (find-package "SYMBOLIC_MSGS::ACTIONRESULT"))
(shadow '*ACTION_PLACE_IN* (find-package "SYMBOLIC_MSGS::ACTIONRESULT"))
(defconstant symbolic_msgs::ActionResult::*ACTION_PLACE_IN* 104)
(intern "*ACTION_STACK_IN*" (find-package "SYMBOLIC_MSGS::ACTIONRESULT"))
(shadow '*ACTION_STACK_IN* (find-package "SYMBOLIC_MSGS::ACTIONRESULT"))
(defconstant symbolic_msgs::ActionResult::*ACTION_STACK_IN* 105)
(intern "*SUCCESS*" (find-package "SYMBOLIC_MSGS::ACTIONRESULT"))
(shadow '*SUCCESS* (find-package "SYMBOLIC_MSGS::ACTIONRESULT"))
(defconstant symbolic_msgs::ActionResult::*SUCCESS* 1)
(intern "*STATE_UPDATE_REQUIRED*" (find-package "SYMBOLIC_MSGS::ACTIONRESULT"))
(shadow '*STATE_UPDATE_REQUIRED* (find-package "SYMBOLIC_MSGS::ACTIONRESULT"))
(defconstant symbolic_msgs::ActionResult::*STATE_UPDATE_REQUIRED* 0)
(intern "*FAILED*" (find-package "SYMBOLIC_MSGS::ACTIONRESULT"))
(shadow '*FAILED* (find-package "SYMBOLIC_MSGS::ACTIONRESULT"))
(defconstant symbolic_msgs::ActionResult::*FAILED* -1)

(defun symbolic_msgs::ActionResult-to-symbol (const)
  (cond
        ((= const 100) 'symbolic_msgs::ActionResult::*ACTION_MOVE_FREE*)
        ((= const 101) 'symbolic_msgs::ActionResult::*ACTION_MOVE_HOLDING*)
        ((= const 102) 'symbolic_msgs::ActionResult::*ACTION_PICK*)
        ((= const 103) 'symbolic_msgs::ActionResult::*ACTION_PLACE_ON*)
        ((= const 104) 'symbolic_msgs::ActionResult::*ACTION_PLACE_IN*)
        ((= const 105) 'symbolic_msgs::ActionResult::*ACTION_STACK_IN*)
        ((= const 1) 'symbolic_msgs::ActionResult::*SUCCESS*)
        ((= const 0) 'symbolic_msgs::ActionResult::*STATE_UPDATE_REQUIRED*)
        ((= const -1) 'symbolic_msgs::ActionResult::*FAILED*)
        (t nil)))

(defclass symbolic_msgs::ActionResult
  :super ros::object
  :slots (_action_id _objects _result ))

(defmethod symbolic_msgs::ActionResult
  (:init
   (&key
    ((:action_id __action_id) 0)
    ((:objects __objects) (make-array 0 :initial-element 0 :element-type :integer))
    ((:result __result) 0)
    )
   (send-super :init)
   (setq _action_id (round __action_id))
   (setq _objects __objects)
   (setq _result (round __result))
   self)
  (:action_id
   (&optional __action_id)
   (if __action_id (setq _action_id __action_id)) _action_id)
  (:objects
   (&optional __objects)
   (if __objects (setq _objects __objects)) _objects)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; int32 _action_id
    4
    ;; int32[] _objects
    (* 4    (length _objects)) 4
    ;; int32 _result
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _action_id
       (write-long _action_id s)
     ;; int32[] _objects
     (write-long (length _objects) s)
     (dotimes (i (length _objects))
       (write-long (elt _objects i) s)
       )
     ;; int32 _result
       (write-long _result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _action_id
     (setq _action_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32[] _objects
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _objects (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _objects i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32 _result
     (setq _result (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get symbolic_msgs::ActionResult :md5sum-) "f7072e87515b1c12d8c225bf21a0bcf4")
(setf (get symbolic_msgs::ActionResult :datatype-) "symbolic_msgs/ActionResult")
(setf (get symbolic_msgs::ActionResult :definition-)
      "int32 action_id
int32[] objects
int32 result

# action_id
int32 ACTION_MOVE_FREE = 100 # objects = []
int32 ACTION_MOVE_HOLDING = 101 # objects = [holding_object]
int32 ACTION_PICK = 102 # objects = [picked_object]
int32 ACTION_PLACE_ON = 103 # objects = [object_top, object_bottom]
int32 ACTION_PLACE_IN = 104 # objects = [object_inner, object_outer]
int32 ACTION_STACK_IN = 105 # objects = [object_top, object_bottom]

# result
int32 SUCCESS = 1
int32 STATE_UPDATE_REQUIRED = 0
int32 FAILED = -1

")



(provide :symbolic_msgs/ActionResult "f7072e87515b1c12d8c225bf21a0bcf4")


