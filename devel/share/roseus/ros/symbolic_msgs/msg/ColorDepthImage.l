;; Auto-generated. Do not edit!


(when (boundp 'symbolic_msgs::ColorDepthImage)
  (if (not (find-package "SYMBOLIC_MSGS"))
    (make-package "SYMBOLIC_MSGS"))
  (shadow 'ColorDepthImage (find-package "SYMBOLIC_MSGS")))
(unless (find-package "SYMBOLIC_MSGS::COLORDEPTHIMAGE")
  (make-package "SYMBOLIC_MSGS::COLORDEPTHIMAGE"))

(in-package "ROS")
;;//! \htmlinclude ColorDepthImage.msg.html


(defclass symbolic_msgs::ColorDepthImage
  :super ros::object
  :slots (_json ))

(defmethod symbolic_msgs::ColorDepthImage
  (:init
   (&key
    ((:json __json) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _json __json)
   self)
  (:json
   (&optional __json)
   (if __json (setq _json __json)) _json)
  (:serialization-length
   ()
   (+
    ;; string[] _json
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _json)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _json
     (write-long (length _json) s)
     (dolist (elem _json)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _json
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _json (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _json i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(setf (get symbolic_msgs::ColorDepthImage :md5sum-) "2518043d6087e4ba95ef63957da66e6b")
(setf (get symbolic_msgs::ColorDepthImage :datatype-) "symbolic_msgs/ColorDepthImage")
(setf (get symbolic_msgs::ColorDepthImage :definition-)
      "string[] json

")



(provide :symbolic_msgs/ColorDepthImage "2518043d6087e4ba95ef63957da66e6b")


