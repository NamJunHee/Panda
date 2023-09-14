
(cl:in-package :asdf)

(defsystem "service_pkg-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "service_srv" :depends-on ("_package_service_srv"))
    (:file "_package_service_srv" :depends-on ("_package"))
  ))