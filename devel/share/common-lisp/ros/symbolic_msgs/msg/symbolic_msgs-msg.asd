
(cl:in-package :asdf)

(defsystem "symbolic_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
               :vision_msgs-msg
)
  :components ((:file "_package")
    (:file "ActionResult" :depends-on ("_package_ActionResult"))
    (:file "_package_ActionResult" :depends-on ("_package"))
    (:file "ColorDepthImage" :depends-on ("_package_ColorDepthImage"))
    (:file "_package_ColorDepthImage" :depends-on ("_package"))
    (:file "PlanResult" :depends-on ("_package_PlanResult"))
    (:file "_package_PlanResult" :depends-on ("_package"))
    (:file "TaskInfo" :depends-on ("_package_TaskInfo"))
    (:file "_package_TaskInfo" :depends-on ("_package"))
  ))