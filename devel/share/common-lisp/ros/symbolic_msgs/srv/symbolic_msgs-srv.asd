
(cl:in-package :asdf)

(defsystem "symbolic_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
               :vision_msgs-msg
)
  :components ((:file "_package")
    (:file "perception" :depends-on ("_package_perception"))
    (:file "_package_perception" :depends-on ("_package"))
  ))