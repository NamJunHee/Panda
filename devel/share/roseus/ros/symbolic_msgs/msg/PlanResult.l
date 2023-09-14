;; Auto-generated. Do not edit!


(when (boundp 'symbolic_msgs::PlanResult)
  (if (not (find-package "SYMBOLIC_MSGS"))
    (make-package "SYMBOLIC_MSGS"))
  (shadow 'PlanResult (find-package "SYMBOLIC_MSGS")))
(unless (find-package "SYMBOLIC_MSGS::PLANRESULT")
  (make-package "SYMBOLIC_MSGS::PLANRESULT"))

(in-package "ROS")
;;//! \htmlinclude PlanResult.msg.html


(intern "*SUCCESS*" (find-package "SYMBOLIC_MSGS::PLANRESULT"))
(shadow '*SUCCESS* (find-package "SYMBOLIC_MSGS::PLANRESULT"))
(defconstant symbolic_msgs::PlanResult::*SUCCESS* 1)
(intern "*FAILED*" (find-package "SYMBOLIC_MSGS::PLANRESULT"))
(shadow '*FAILED* (find-package "SYMBOLIC_MSGS::PLANRESULT"))
(defconstant symbolic_msgs::PlanResult::*FAILED* -1)

(defun symbolic_msgs::PlanResult-to-symbol (const)
  (cond
        ((= const 1) 'symbolic_msgs::PlanResult::*SUCCESS*)
        ((= const -1) 'symbolic_msgs::PlanResult::*FAILED*)
        (t nil)))

(defclass symbolic_msgs::PlanResult
  :super ros::object
  :slots (_task_id _plan _result ))

(defmethod symbolic_msgs::PlanResult
  (:init
   (&key
    ((:task_id __task_id) 0)
    ((:plan __plan) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:result __result) 0)
    )
   (send-super :init)
   (setq _task_id (round __task_id))
   (setq _plan __plan)
   (setq _result (round __result))
   self)
  (:task_id
   (&optional __task_id)
   (if __task_id (setq _task_id __task_id)) _task_id)
  (:plan
   (&optional __plan)
   (if __plan (setq _plan __plan)) _plan)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; int32 _task_id
    4
    ;; string[] _plan
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _plan)) 4
    ;; int32 _result
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _task_id
       (write-long _task_id s)
     ;; string[] _plan
     (write-long (length _plan) s)
     (dolist (elem _plan)
       (write-long (length elem) s) (princ elem s)
       )
     ;; int32 _result
       (write-long _result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _task_id
     (setq _task_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string[] _plan
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _plan (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _plan i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; int32 _result
     (setq _result (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get symbolic_msgs::PlanResult :md5sum-) "38cc8a1052b509b68d15938d07f568f0")
(setf (get symbolic_msgs::PlanResult :datatype-) "symbolic_msgs/PlanResult")
(setf (get symbolic_msgs::PlanResult :definition-)
      "int32 task_id
string[] plan
int32 result

# result
int32 SUCCESS = 1
int32 FAILED = -1
")



(provide :symbolic_msgs/PlanResult "38cc8a1052b509b68d15938d07f568f0")


