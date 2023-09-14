# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "njh_panda_moveit_pkg: 0 messages, 1 services")

set(MSG_I_FLAGS "-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Imoveit_msgs:/opt/ros/noetic/share/moveit_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Ivision_msgs:/opt/ros/noetic/share/vision_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Itrajectory_msgs:/opt/ros/noetic/share/trajectory_msgs/cmake/../msg;-Ishape_msgs:/opt/ros/noetic/share/shape_msgs/cmake/../msg;-Iobject_recognition_msgs:/opt/ros/noetic/share/object_recognition_msgs/cmake/../msg;-Ioctomap_msgs:/opt/ros/noetic/share/octomap_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(njh_panda_moveit_pkg_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/user/catkin_ws/src/njh_panda_moveit_pkg/srv/test_moveit_service.srv" NAME_WE)
add_custom_target(_njh_panda_moveit_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "njh_panda_moveit_pkg" "/home/user/catkin_ws/src/njh_panda_moveit_pkg/srv/test_moveit_service.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(njh_panda_moveit_pkg
  "/home/user/catkin_ws/src/njh_panda_moveit_pkg/srv/test_moveit_service.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/njh_panda_moveit_pkg
)

### Generating Module File
_generate_module_cpp(njh_panda_moveit_pkg
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/njh_panda_moveit_pkg
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(njh_panda_moveit_pkg_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(njh_panda_moveit_pkg_generate_messages njh_panda_moveit_pkg_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/catkin_ws/src/njh_panda_moveit_pkg/srv/test_moveit_service.srv" NAME_WE)
add_dependencies(njh_panda_moveit_pkg_generate_messages_cpp _njh_panda_moveit_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(njh_panda_moveit_pkg_gencpp)
add_dependencies(njh_panda_moveit_pkg_gencpp njh_panda_moveit_pkg_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS njh_panda_moveit_pkg_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(njh_panda_moveit_pkg
  "/home/user/catkin_ws/src/njh_panda_moveit_pkg/srv/test_moveit_service.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/njh_panda_moveit_pkg
)

### Generating Module File
_generate_module_eus(njh_panda_moveit_pkg
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/njh_panda_moveit_pkg
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(njh_panda_moveit_pkg_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(njh_panda_moveit_pkg_generate_messages njh_panda_moveit_pkg_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/catkin_ws/src/njh_panda_moveit_pkg/srv/test_moveit_service.srv" NAME_WE)
add_dependencies(njh_panda_moveit_pkg_generate_messages_eus _njh_panda_moveit_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(njh_panda_moveit_pkg_geneus)
add_dependencies(njh_panda_moveit_pkg_geneus njh_panda_moveit_pkg_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS njh_panda_moveit_pkg_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(njh_panda_moveit_pkg
  "/home/user/catkin_ws/src/njh_panda_moveit_pkg/srv/test_moveit_service.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/njh_panda_moveit_pkg
)

### Generating Module File
_generate_module_lisp(njh_panda_moveit_pkg
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/njh_panda_moveit_pkg
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(njh_panda_moveit_pkg_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(njh_panda_moveit_pkg_generate_messages njh_panda_moveit_pkg_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/catkin_ws/src/njh_panda_moveit_pkg/srv/test_moveit_service.srv" NAME_WE)
add_dependencies(njh_panda_moveit_pkg_generate_messages_lisp _njh_panda_moveit_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(njh_panda_moveit_pkg_genlisp)
add_dependencies(njh_panda_moveit_pkg_genlisp njh_panda_moveit_pkg_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS njh_panda_moveit_pkg_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(njh_panda_moveit_pkg
  "/home/user/catkin_ws/src/njh_panda_moveit_pkg/srv/test_moveit_service.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/njh_panda_moveit_pkg
)

### Generating Module File
_generate_module_nodejs(njh_panda_moveit_pkg
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/njh_panda_moveit_pkg
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(njh_panda_moveit_pkg_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(njh_panda_moveit_pkg_generate_messages njh_panda_moveit_pkg_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/catkin_ws/src/njh_panda_moveit_pkg/srv/test_moveit_service.srv" NAME_WE)
add_dependencies(njh_panda_moveit_pkg_generate_messages_nodejs _njh_panda_moveit_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(njh_panda_moveit_pkg_gennodejs)
add_dependencies(njh_panda_moveit_pkg_gennodejs njh_panda_moveit_pkg_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS njh_panda_moveit_pkg_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(njh_panda_moveit_pkg
  "/home/user/catkin_ws/src/njh_panda_moveit_pkg/srv/test_moveit_service.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/njh_panda_moveit_pkg
)

### Generating Module File
_generate_module_py(njh_panda_moveit_pkg
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/njh_panda_moveit_pkg
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(njh_panda_moveit_pkg_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(njh_panda_moveit_pkg_generate_messages njh_panda_moveit_pkg_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/catkin_ws/src/njh_panda_moveit_pkg/srv/test_moveit_service.srv" NAME_WE)
add_dependencies(njh_panda_moveit_pkg_generate_messages_py _njh_panda_moveit_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(njh_panda_moveit_pkg_genpy)
add_dependencies(njh_panda_moveit_pkg_genpy njh_panda_moveit_pkg_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS njh_panda_moveit_pkg_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/njh_panda_moveit_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/njh_panda_moveit_pkg
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(njh_panda_moveit_pkg_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET moveit_msgs_generate_messages_cpp)
  add_dependencies(njh_panda_moveit_pkg_generate_messages_cpp moveit_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(njh_panda_moveit_pkg_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET vision_msgs_generate_messages_cpp)
  add_dependencies(njh_panda_moveit_pkg_generate_messages_cpp vision_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/njh_panda_moveit_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/njh_panda_moveit_pkg
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(njh_panda_moveit_pkg_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET moveit_msgs_generate_messages_eus)
  add_dependencies(njh_panda_moveit_pkg_generate_messages_eus moveit_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(njh_panda_moveit_pkg_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET vision_msgs_generate_messages_eus)
  add_dependencies(njh_panda_moveit_pkg_generate_messages_eus vision_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/njh_panda_moveit_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/njh_panda_moveit_pkg
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(njh_panda_moveit_pkg_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET moveit_msgs_generate_messages_lisp)
  add_dependencies(njh_panda_moveit_pkg_generate_messages_lisp moveit_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(njh_panda_moveit_pkg_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET vision_msgs_generate_messages_lisp)
  add_dependencies(njh_panda_moveit_pkg_generate_messages_lisp vision_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/njh_panda_moveit_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/njh_panda_moveit_pkg
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(njh_panda_moveit_pkg_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET moveit_msgs_generate_messages_nodejs)
  add_dependencies(njh_panda_moveit_pkg_generate_messages_nodejs moveit_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(njh_panda_moveit_pkg_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET vision_msgs_generate_messages_nodejs)
  add_dependencies(njh_panda_moveit_pkg_generate_messages_nodejs vision_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/njh_panda_moveit_pkg)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/njh_panda_moveit_pkg\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/njh_panda_moveit_pkg
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(njh_panda_moveit_pkg_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET moveit_msgs_generate_messages_py)
  add_dependencies(njh_panda_moveit_pkg_generate_messages_py moveit_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(njh_panda_moveit_pkg_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET vision_msgs_generate_messages_py)
  add_dependencies(njh_panda_moveit_pkg_generate_messages_py vision_msgs_generate_messages_py)
endif()
