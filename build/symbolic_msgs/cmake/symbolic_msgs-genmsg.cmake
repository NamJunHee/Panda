# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "symbolic_msgs: 4 messages, 1 services")

set(MSG_I_FLAGS "-Isymbolic_msgs:/home/user/catkin_ws/src/symbolic_msgs/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Ivision_msgs:/opt/ros/noetic/share/vision_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(symbolic_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/msg/ColorDepthImage.msg" NAME_WE)
add_custom_target(_symbolic_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "symbolic_msgs" "/home/user/catkin_ws/src/symbolic_msgs/msg/ColorDepthImage.msg" ""
)

get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/msg/TaskInfo.msg" NAME_WE)
add_custom_target(_symbolic_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "symbolic_msgs" "/home/user/catkin_ws/src/symbolic_msgs/msg/TaskInfo.msg" "vision_msgs/BoundingBox3D:sensor_msgs/PointCloud2:std_msgs/String:std_msgs/Header:vision_msgs/ObjectHypothesisWithPose:geometry_msgs/PoseWithCovariance:geometry_msgs/Pose:vision_msgs/Detection3DArray:geometry_msgs/Point:sensor_msgs/PointField:geometry_msgs/Vector3:geometry_msgs/Quaternion:vision_msgs/Detection3D"
)

get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/msg/ActionResult.msg" NAME_WE)
add_custom_target(_symbolic_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "symbolic_msgs" "/home/user/catkin_ws/src/symbolic_msgs/msg/ActionResult.msg" ""
)

get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/msg/PlanResult.msg" NAME_WE)
add_custom_target(_symbolic_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "symbolic_msgs" "/home/user/catkin_ws/src/symbolic_msgs/msg/PlanResult.msg" ""
)

get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/srv/perception.srv" NAME_WE)
add_custom_target(_symbolic_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "symbolic_msgs" "/home/user/catkin_ws/src/symbolic_msgs/srv/perception.srv" "std_msgs/Int16MultiArray:std_msgs/Header:std_msgs/MultiArrayDimension:geometry_msgs/PoseWithCovariance:sensor_msgs/PointField:geometry_msgs/Quaternion:sensor_msgs/Image:vision_msgs/BoundingBox3D:vision_msgs/ObjectHypothesisWithPose:geometry_msgs/Pose2D:geometry_msgs/Vector3:vision_msgs/Detection3D:geometry_msgs/PoseArray:vision_msgs/Detection2DArray:sensor_msgs/PointCloud2:vision_msgs/BoundingBox2D:geometry_msgs/Pose:std_msgs/MultiArrayLayout:geometry_msgs/Point:vision_msgs/Detection3DArray:vision_msgs/Detection2D"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/msg/ColorDepthImage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/symbolic_msgs
)
_generate_msg_cpp(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/msg/TaskInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/vision_msgs/cmake/../msg/BoundingBox3D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/ObjectHypothesisWithPose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection3DArray.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection3D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/symbolic_msgs
)
_generate_msg_cpp(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/msg/ActionResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/symbolic_msgs
)
_generate_msg_cpp(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/msg/PlanResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/symbolic_msgs
)

### Generating Services
_generate_srv_cpp(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/srv/perception.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Int16MultiArray.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/BoundingBox3D.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/ObjectHypothesisWithPose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection3D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseArray.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection2DArray.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/BoundingBox2D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection3DArray.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/symbolic_msgs
)

### Generating Module File
_generate_module_cpp(symbolic_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/symbolic_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(symbolic_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(symbolic_msgs_generate_messages symbolic_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/msg/ColorDepthImage.msg" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_cpp _symbolic_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/msg/TaskInfo.msg" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_cpp _symbolic_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/msg/ActionResult.msg" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_cpp _symbolic_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/msg/PlanResult.msg" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_cpp _symbolic_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/srv/perception.srv" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_cpp _symbolic_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(symbolic_msgs_gencpp)
add_dependencies(symbolic_msgs_gencpp symbolic_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS symbolic_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/msg/ColorDepthImage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/symbolic_msgs
)
_generate_msg_eus(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/msg/TaskInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/vision_msgs/cmake/../msg/BoundingBox3D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/ObjectHypothesisWithPose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection3DArray.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection3D.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/symbolic_msgs
)
_generate_msg_eus(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/msg/ActionResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/symbolic_msgs
)
_generate_msg_eus(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/msg/PlanResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/symbolic_msgs
)

### Generating Services
_generate_srv_eus(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/srv/perception.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Int16MultiArray.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/BoundingBox3D.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/ObjectHypothesisWithPose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection3D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseArray.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection2DArray.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/BoundingBox2D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection3DArray.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/symbolic_msgs
)

### Generating Module File
_generate_module_eus(symbolic_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/symbolic_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(symbolic_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(symbolic_msgs_generate_messages symbolic_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/msg/ColorDepthImage.msg" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_eus _symbolic_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/msg/TaskInfo.msg" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_eus _symbolic_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/msg/ActionResult.msg" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_eus _symbolic_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/msg/PlanResult.msg" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_eus _symbolic_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/srv/perception.srv" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_eus _symbolic_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(symbolic_msgs_geneus)
add_dependencies(symbolic_msgs_geneus symbolic_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS symbolic_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/msg/ColorDepthImage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/symbolic_msgs
)
_generate_msg_lisp(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/msg/TaskInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/vision_msgs/cmake/../msg/BoundingBox3D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/ObjectHypothesisWithPose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection3DArray.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection3D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/symbolic_msgs
)
_generate_msg_lisp(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/msg/ActionResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/symbolic_msgs
)
_generate_msg_lisp(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/msg/PlanResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/symbolic_msgs
)

### Generating Services
_generate_srv_lisp(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/srv/perception.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Int16MultiArray.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/BoundingBox3D.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/ObjectHypothesisWithPose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection3D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseArray.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection2DArray.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/BoundingBox2D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection3DArray.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/symbolic_msgs
)

### Generating Module File
_generate_module_lisp(symbolic_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/symbolic_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(symbolic_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(symbolic_msgs_generate_messages symbolic_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/msg/ColorDepthImage.msg" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_lisp _symbolic_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/msg/TaskInfo.msg" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_lisp _symbolic_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/msg/ActionResult.msg" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_lisp _symbolic_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/msg/PlanResult.msg" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_lisp _symbolic_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/srv/perception.srv" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_lisp _symbolic_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(symbolic_msgs_genlisp)
add_dependencies(symbolic_msgs_genlisp symbolic_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS symbolic_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/msg/ColorDepthImage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/symbolic_msgs
)
_generate_msg_nodejs(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/msg/TaskInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/vision_msgs/cmake/../msg/BoundingBox3D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/ObjectHypothesisWithPose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection3DArray.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection3D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/symbolic_msgs
)
_generate_msg_nodejs(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/msg/ActionResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/symbolic_msgs
)
_generate_msg_nodejs(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/msg/PlanResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/symbolic_msgs
)

### Generating Services
_generate_srv_nodejs(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/srv/perception.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Int16MultiArray.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/BoundingBox3D.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/ObjectHypothesisWithPose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection3D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseArray.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection2DArray.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/BoundingBox2D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection3DArray.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/symbolic_msgs
)

### Generating Module File
_generate_module_nodejs(symbolic_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/symbolic_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(symbolic_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(symbolic_msgs_generate_messages symbolic_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/msg/ColorDepthImage.msg" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_nodejs _symbolic_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/msg/TaskInfo.msg" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_nodejs _symbolic_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/msg/ActionResult.msg" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_nodejs _symbolic_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/msg/PlanResult.msg" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_nodejs _symbolic_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/srv/perception.srv" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_nodejs _symbolic_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(symbolic_msgs_gennodejs)
add_dependencies(symbolic_msgs_gennodejs symbolic_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS symbolic_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/msg/ColorDepthImage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/symbolic_msgs
)
_generate_msg_py(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/msg/TaskInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/vision_msgs/cmake/../msg/BoundingBox3D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/ObjectHypothesisWithPose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection3DArray.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection3D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/symbolic_msgs
)
_generate_msg_py(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/msg/ActionResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/symbolic_msgs
)
_generate_msg_py(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/msg/PlanResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/symbolic_msgs
)

### Generating Services
_generate_srv_py(symbolic_msgs
  "/home/user/catkin_ws/src/symbolic_msgs/srv/perception.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Int16MultiArray.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/BoundingBox3D.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/ObjectHypothesisWithPose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection3D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseArray.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection2DArray.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/BoundingBox2D.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection3DArray.msg;/opt/ros/noetic/share/vision_msgs/cmake/../msg/Detection2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/symbolic_msgs
)

### Generating Module File
_generate_module_py(symbolic_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/symbolic_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(symbolic_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(symbolic_msgs_generate_messages symbolic_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/msg/ColorDepthImage.msg" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_py _symbolic_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/msg/TaskInfo.msg" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_py _symbolic_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/msg/ActionResult.msg" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_py _symbolic_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/msg/PlanResult.msg" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_py _symbolic_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/symbolic_msgs/srv/perception.srv" NAME_WE)
add_dependencies(symbolic_msgs_generate_messages_py _symbolic_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(symbolic_msgs_genpy)
add_dependencies(symbolic_msgs_genpy symbolic_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS symbolic_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/symbolic_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/symbolic_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(symbolic_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(symbolic_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET vision_msgs_generate_messages_cpp)
  add_dependencies(symbolic_msgs_generate_messages_cpp vision_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/symbolic_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/symbolic_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(symbolic_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(symbolic_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET vision_msgs_generate_messages_eus)
  add_dependencies(symbolic_msgs_generate_messages_eus vision_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/symbolic_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/symbolic_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(symbolic_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(symbolic_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET vision_msgs_generate_messages_lisp)
  add_dependencies(symbolic_msgs_generate_messages_lisp vision_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/symbolic_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/symbolic_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(symbolic_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(symbolic_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET vision_msgs_generate_messages_nodejs)
  add_dependencies(symbolic_msgs_generate_messages_nodejs vision_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/symbolic_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/symbolic_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/symbolic_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(symbolic_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(symbolic_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET vision_msgs_generate_messages_py)
  add_dependencies(symbolic_msgs_generate_messages_py vision_msgs_generate_messages_py)
endif()
