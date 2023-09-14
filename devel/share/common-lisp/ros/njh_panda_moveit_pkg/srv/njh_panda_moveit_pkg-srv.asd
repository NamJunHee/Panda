
(cl:in-package :asdf)

(defsystem "njh_panda_moveit_pkg-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "test_moveit_service" :depends-on ("_package_test_moveit_service"))
    (:file "_package_test_moveit_service" :depends-on ("_package"))
  ))