;; Auto-generated. Do not edit!


(when (boundp 'njh_panda_moveit_pkg::test_moveit_service)
  (if (not (find-package "NJH_PANDA_MOVEIT_PKG"))
    (make-package "NJH_PANDA_MOVEIT_PKG"))
  (shadow 'test_moveit_service (find-package "NJH_PANDA_MOVEIT_PKG")))
(unless (find-package "NJH_PANDA_MOVEIT_PKG::TEST_MOVEIT_SERVICE")
  (make-package "NJH_PANDA_MOVEIT_PKG::TEST_MOVEIT_SERVICE"))
(unless (find-package "NJH_PANDA_MOVEIT_PKG::TEST_MOVEIT_SERVICEREQUEST")
  (make-package "NJH_PANDA_MOVEIT_PKG::TEST_MOVEIT_SERVICEREQUEST"))
(unless (find-package "NJH_PANDA_MOVEIT_PKG::TEST_MOVEIT_SERVICERESPONSE")
  (make-package "NJH_PANDA_MOVEIT_PKG::TEST_MOVEIT_SERVICERESPONSE"))

(in-package "ROS")





(defclass njh_panda_moveit_pkg::test_moveit_serviceRequest
  :super ros::object
  :slots (_a _b ))

(defmethod njh_panda_moveit_pkg::test_moveit_serviceRequest
  (:init
   (&key
    ((:a __a) 0)
    ((:b __b) 0)
    )
   (send-super :init)
   (setq _a (round __a))
   (setq _b (round __b))
   self)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:serialization-length
   ()
   (+
    ;; int64 _a
    8
    ;; int64 _b
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _a
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _a (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _a) (= (length (_a . bv)) 2)) ;; bignum
              (write-long (ash (elt (_a . bv) 0) 0) s)
              (write-long (ash (elt (_a . bv) 1) -1) s))
             ((and (class _a) (= (length (_a . bv)) 1)) ;; big1
              (write-long (elt (_a . bv) 0) s)
              (write-long (if (>= _a 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _a s)(write-long (if (>= _a 0) 0 #xffffffff) s)))
     ;; int64 _b
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _b (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _b) (= (length (_b . bv)) 2)) ;; bignum
              (write-long (ash (elt (_b . bv) 0) 0) s)
              (write-long (ash (elt (_b . bv) 1) -1) s))
             ((and (class _b) (= (length (_b . bv)) 1)) ;; big1
              (write-long (elt (_b . bv) 0) s)
              (write-long (if (>= _b 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _b s)(write-long (if (>= _b 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _a
#+(or :alpha :irix6 :x86_64)
      (setf _a (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _a (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _b
#+(or :alpha :irix6 :x86_64)
      (setf _b (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _b (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass njh_panda_moveit_pkg::test_moveit_serviceResponse
  :super ros::object
  :slots (_sum ))

(defmethod njh_panda_moveit_pkg::test_moveit_serviceResponse
  (:init
   (&key
    ((:sum __sum) 0)
    )
   (send-super :init)
   (setq _sum (round __sum))
   self)
  (:sum
   (&optional __sum)
   (if __sum (setq _sum __sum)) _sum)
  (:serialization-length
   ()
   (+
    ;; int64 _sum
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _sum
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _sum (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _sum) (= (length (_sum . bv)) 2)) ;; bignum
              (write-long (ash (elt (_sum . bv) 0) 0) s)
              (write-long (ash (elt (_sum . bv) 1) -1) s))
             ((and (class _sum) (= (length (_sum . bv)) 1)) ;; big1
              (write-long (elt (_sum . bv) 0) s)
              (write-long (if (>= _sum 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _sum s)(write-long (if (>= _sum 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _sum
#+(or :alpha :irix6 :x86_64)
      (setf _sum (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _sum (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass njh_panda_moveit_pkg::test_moveit_service
  :super ros::object
  :slots ())

(setf (get njh_panda_moveit_pkg::test_moveit_service :md5sum-) "6a2e34150c00229791cc89ff309fff21")
(setf (get njh_panda_moveit_pkg::test_moveit_service :datatype-) "njh_panda_moveit_pkg/test_moveit_service")
(setf (get njh_panda_moveit_pkg::test_moveit_service :request) njh_panda_moveit_pkg::test_moveit_serviceRequest)
(setf (get njh_panda_moveit_pkg::test_moveit_service :response) njh_panda_moveit_pkg::test_moveit_serviceResponse)

(defmethod njh_panda_moveit_pkg::test_moveit_serviceRequest
  (:response () (instance njh_panda_moveit_pkg::test_moveit_serviceResponse :init)))

(setf (get njh_panda_moveit_pkg::test_moveit_serviceRequest :md5sum-) "6a2e34150c00229791cc89ff309fff21")
(setf (get njh_panda_moveit_pkg::test_moveit_serviceRequest :datatype-) "njh_panda_moveit_pkg/test_moveit_serviceRequest")
(setf (get njh_panda_moveit_pkg::test_moveit_serviceRequest :definition-)
      "
int64 a
int64 b

---

int64 sum


")

(setf (get njh_panda_moveit_pkg::test_moveit_serviceResponse :md5sum-) "6a2e34150c00229791cc89ff309fff21")
(setf (get njh_panda_moveit_pkg::test_moveit_serviceResponse :datatype-) "njh_panda_moveit_pkg/test_moveit_serviceResponse")
(setf (get njh_panda_moveit_pkg::test_moveit_serviceResponse :definition-)
      "
int64 a
int64 b

---

int64 sum


")



(provide :njh_panda_moveit_pkg/test_moveit_service "6a2e34150c00229791cc89ff309fff21")


