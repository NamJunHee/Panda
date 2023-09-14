#!/usr/bin/env python

import rospy
import numpy as np
import sys
import tf
import math
from math import pi
from scipy.spatial.transform import Rotation as R
from geometry_msgs.msg import Pose
import moveit_commander
from moveit_commander import MoveGroupCommander, roscpp_initialize
from vision_msgs.msg import Detection3DArray

# import moveit_commander
# import moveit_msgs.msg
# import geometry_msgs.msg

# from math import pi
# from std_msgs.msg import String
# import tf.transformations as tfm
# import numpy as np
# from sensor_msgs.msg import *
# from vision_msgs.msg import *
# from geometry_msgs.msg import *
# from std_msgs.msg import *

# #from obj_msg.msg import *
# from visualization_msgs.msg import Marker
# from vision_msgs.msg import Detection3DArray
# #from draw_panda_env import *
# from scipy.spatial import distance




class get_vision():
    def __init__(self):
        self.target_pose = Pose()
        rospy.Subscriber('/bbox_3d', Detection3DArray, self._callback_bbox_3d)

    def _callback_bbox_3d(self, data):
        if data.detections:
            # Extract position and orientation from the first detection
            position = data.detections[0].bbox.center.position
            orientation = data.detections[0].bbox.center.orientation

            # Calculate transformation from panda_link0 to object
            translation2 = np.array([position.x, position.y, position.z])
            rotation2 = R.from_quat([orientation.x, orientation.y, orientation.z, orientation.w])
            transform2 = np.eye(4)
            transform2[:3, :3] = rotation2.as_matrix()
            transform2[:3, 3] = translation2
            # print(position.x, position.y, position.z)

            # Transformation from base_link to panda_link0
            translation1 = np.array([0.254, 0.0, 0.5764])
            rotation1 = R.from_quat([0.0, 0.0, 0.0, 1.0])
            transform1 = np.eye(4)
            transform1[:3, :3] = rotation1.as_matrix()
            transform1[:3, 3] = translation1

            # Calculate final transformation from base_link to object
            final_transform = np.dot(transform1, transform2)
            final_translation = final_transform[:3, 3]
            final_rotation = R.from_matrix(final_transform[:3, :3]).as_quat()

            
            # self.target_pose.position.x = final_translation[0] 
            # self.target_pose.position.y = final_translation[1]
            # self.target_pose.position.z = final_translation[2]
            self.target_pose.position.x = position.x + 0.20
            self.target_pose.position.y = position.y
            self.target_pose.position.z = position.z + 0.25
             
            # End-effector의 방향을 x축과 평행하게 설정
            quaternion = tf.transformations.quaternion_from_euler(np.pi, -np.pi/2 - np.pi/18, 0, 'rzyx')
            self.target_pose.orientation.x = quaternion[0]
            self.target_pose.orientation.y = quaternion[1]
            self.target_pose.orientation.z = quaternion[2]
            self.target_pose.orientation.w = quaternion[3]

            # # Set target pose for manipulator
            # self.target_pose.position.x = final_translation[0]
            # self.target_pose.position.y = final_translation[1]
            # self.target_pose.position.z = final_translation[2]
            # self.target_pose.orientation.x = 1
            # self.target_pose.orientation.y = 0
            # self.target_pose.orientation.z = 0
            # self.target_pose.orientation.w = 0




def move_panda():
    # Initialize moveit_commander and rospy
    roscpp_initialize(sys.argv)
    rospy.init_node('ksh_move_panda_node', anonymous=True)

    # Create get_vision object and wait for detection
    vision = get_vision()
    rospy.sleep(1)  # Wait for a moment to make sure first detection is received

    # Create move group
    group = MoveGroupCommander("arm")
    group.set_pose_reference_frame("panda_link0")

    # Get current pose (just for checking)
    current_pose = group.get_current_pose()
    print("Current pose: ", current_pose)

    # Set target pose
    group.set_pose_target(vision.target_pose)

    # Plan 
    plan = group.plan()
    group.go(wait=True)

    # # Additional movement
    # additional_pose = Pose()
    # additional_pose.position.x = vision.target_pose.position.x + 0.1
    # additional_pose.position.y = vision.target_pose.position.y
    # additional_pose.position.z = vision.target_pose.position.z
    # additional_pose.orientation.x = vision.target_pose.orientation.x
    # additional_pose.orientation.y = vision.target_pose.orientation.y
    # additional_pose.orientation.z = vision.target_pose.orientation.z
    # additional_pose.orientation.w = vision.target_pose.orientation.w

    # # Set additional pose
    # group.set_pose_target(additional_pose)

    # # Plan and move to the additional pose
    # plan = group.plan()
    # group.go(wait=True)



if __name__ == '__main__':
    try:
        move_panda()
    except rospy.ROSInterruptException:
        pass





# #!/usr/bin/env python
# #just move

# import sys
# import rospy
# import tf
# import moveit_commander
# import moveit_msgs.msg
# import geometry_msgs.msg

# from math import pi
# from std_msgs.msg import String
# import tf.transformations as tfm
# import numpy as np
# from sensor_msgs.msg import *
# from vision_msgs.msg import *
# from geometry_msgs.msg import *
# from std_msgs.msg import *

# #from obj_msg.msg import *
# from visualization_msgs.msg import Marker
# from vision_msgs.msg import Detection3DArray
# #from draw_panda_env import *
# from scipy.spatial import distance

# # panda+robotiq variable
# ROBOT_ARM_GROUP = 'arm'
# ROBOT_EE_GROUP = 'hand'
# ROBOT_EE_LINK = 'panda_link8'
# ROBOT_FRAME = 'panda_link0'

# class get_vision():
#     def __init__(self):
#         self.dataset = []
#         self.base_to_camera_mat = {'mat': None, 'trans': None, 'rot': None}
#         self.base_to_camera_mat = {'mat': None, 'trans': None, 'rot': None}
#         self.head_to_camera_mat = {'mat': None, 'trans': None, 'rot': None}
#         self.detected_object = []
#         self.listener = tf.TransformListener()
#         self.current_obstacles = {}
#         self.table = []

#         # Subscriber
#         # rospy.Subscriber('/obj_info', ObjInfoArrayMsg, self._callback_objects)
#         # rospy.Subscriber('/gr_info', GraspArray, self._callback_grasp)
#         rospy.Subscriber('/bbox_3d', Detection3DArray, self._callback_bbox_3d)

#     def _callback_bbox_3d(self, data):
#         # print("test_callback")
#         self.detected_object = []
#         for d3d in data.detections:
#             d3d.bbox.size.z += 0.04
#             d3d.bbox.center.position.z += 0.02
#             self.detected_object.append(d3d)

#             # add static object(table)
#         d3d = Detection3D()
#         d3d.tracking_id = int(0)
#         d3d.bbox.center.position.x = 0.55
#         d3d.bbox.center.position.y = 0.0
#         d3d.bbox.center.position.z = 0.80 / 2
#         d3d.bbox.center.orientation.x = 0.0
#         d3d.bbox.center.orientation.y = 0.0
#         d3d.bbox.center.orientation.z = 0.0
#         d3d.bbox.center.orientation.w = 1.0
#         d3d.bbox.size.x = 0.60  # 0.5
#         d3d.bbox.size.y = 1.2 #1.0  # 0.8
#         d3d.bbox.size.z = 0.80  # 0.8
#         self.table.append(d3d)



# def move_panda():

#     # moveit_commander 및 rospy 초기화
#     moveit_commander.roscpp_initialize(sys.argv)
#     rospy.init_node('ksh_move_panda_node', anonymous=True)
    
    
#     group = moveit_commander.MoveGroupCommander("arm")

#     # 로봇의 현재 상태를 가져옴
#     reference_frame = "/panda_link0"
#     group.set_pose_reference_frame(reference_frame)

#     # 목표 위치 설정
#     target_pose = geometry_msgs.msg.Pose()
#     target_pose.position.x = 0.88130628
#     target_pose.position.y = -0.10518341
#     target_pose.position.z = 1.05326279
#     target_pose.orientation.x = 0
#     target_pose.orientation.y = 0
#     target_pose.orientation.z = -0.1096924
#     target_pose.orientation.w = 0.99396558

#     # 로봇 팔을 목표 위치로 이동
#     group.set_pose_target(target_pose)
#     plan = group.plan()
#     # group.go(wait=True)


# # Final translation from base_link to object:  [ 0.88130628 -0.10518341  1.05326279]

# # Final rotation from base_link to object (in quaternion):  [ 0.          0.         -0.1096924   0.99396558]

#     rospy.sleep(5)

# if __name__ == '__main__':
#     try:
#         move_panda()
#     except rospy.ROSInterruptException:
#         pass

# #!/usr/bin/env python
# #get tf

# import rospy
# import tf

# if __name__ == '__main__':
#     rospy.init_node('tf_listener')

#     listener = tf.TransformListener()

#     rate = rospy.Rate(10.0) 

#     while not rospy.is_shutdown():
#         try:
            
#             now = rospy.Time.now()
#             listener.waitForTransform("/base_link", "/panda_link0", now, rospy.Duration(1.0))
#             (trans,rot) = listener.lookupTransform("/base_link", "/panda_link0", now)

#             print("Transform from base_link to panda_link0: ")
#             print("Translation: {0}".format(trans))
#             print("Rotation in Quaternion: {0}".format(rot))

#         except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
#             continue

#         rate.sleep()



# #!/usr/bin/env python

# import rospy
# import tf
# import sys
# import moveit_commander
# import geometry_msgs.msg
# from tf.transformations import *
# from vision_msgs.msg import Detection3DArray

# class get_vision():
#     def __init__(self):
#         self.detected_object = []
#         self.listener = tf.TransformListener()
#         self.base_to_object_trans_rot = None
#         self.move_group = moveit_commander.MoveGroupCommander("arm")

#         rospy.Subscriber('/bbox_3d', Detection3DArray, self._callback_bbox_3d)

#     def _callback_bbox_3d(self, data):
#         if data.detections:
#             obj = data.detections[0]
#             trans2 = [obj.bbox.center.position.x, obj.bbox.center.position.y, obj.bbox.center.position.z]
#             rot2 = [obj.bbox.center.orientation.x, obj.bbox.center.orientation.y, 
#                      obj.bbox.center.orientation.z, obj.bbox.center.orientation.w]

#             now = rospy.Time.now()
#             self.listener.waitForTransform("/panda_link0", "/base_link", now, rospy.Duration(1.0))
#             (trans1, rot1) = self.listener.lookupTransform("/panda_link0", "/base_link", now)

#             matrix1 = concatenate_matrices(translation_matrix(trans1), quaternion_matrix(rot1))
#             matrix2 = concatenate_matrices(translation_matrix(trans2), quaternion_matrix(rot2))
#             final_matrix = concatenate_matrices(matrix1, matrix2)

#             self.base_to_object_trans_rot = (translation_from_matrix(final_matrix), 
#                                              quaternion_from_matrix(final_matrix))

#             self.move_panda()

#     def move_panda(self):
#         if self.base_to_object_trans_rot:
#             target_pose = geometry_msgs.msg.Pose()
#             target_pose.position.x, target_pose.position.y, target_pose.position.z = self.base_to_object_trans_rot[0]
#             target_pose.orientation.w, target_pose.orientation.x, target_pose.orientation.y, target_pose.orientation.z = self.base_to_object_trans_rot[1]

#             self.move_group.set_pose_target(target_pose)

#             # Plan the trajectory
#             planned_path = self.move_group.plan()

#             # self.move_group.go(wait=True)

#             # rospy.sleep(5)


# if __name__ == '__main__':
#     moveit_commander.roscpp_initialize(sys.argv)
#     rospy.init_node('ksh_move0615')
#     gv = get_vision()
#     rospy.spin()




# #!/usr/bin/env python

# import rospy
# import tf
# import sys
# import moveit_commander
# import geometry_msgs.msg
# from tf.transformations import *
# from vision_msgs.msg import Detection3DArray

# class get_vision():
#     def __init__(self):
#         self.detected_object = []
#         self.listener = tf.TransformListener()
#         self.base_to_object_trans_rot = None
#         self.move_group = moveit_commander.MoveGroupCommander("arm")

#         rospy.Subscriber('/bbox_3d', Detection3DArray, self._callback_bbox_3d)

#     def _callback_bbox_3d(self, data):
#         if data.detections:
#             obj = data.detections[0]
#             trans2 = [obj.bbox.center.position.x, obj.bbox.center.position.y, obj.bbox.center.position.z]
#             rot2 = [obj.bbox.center.orientation.x, obj.bbox.center.orientation.y, 
#                      obj.bbox.center.orientation.z, obj.bbox.center.orientation.w]

#             now = rospy.Time.now()
#             self.listener.waitForTransform("/base_link", "/panda_link0", now, rospy.Duration(1.0))
#             (trans1, rot1) = self.listener.lookupTransform("/base_link", "/panda_link0", now)

#             matrix1 = concatenate_matrices(translation_matrix(trans1), quaternion_matrix(rot1))
#             matrix2 = concatenate_matrices(translation_matrix(trans2), quaternion_matrix(rot2))
#             final_matrix = concatenate_matrices(matrix1, matrix2)
            
#             self.base_to_object_trans_rot = (translation_from_matrix(final_matrix), 
#                                              quaternion_from_matrix(final_matrix))

#             self.move_panda()

#     def move_panda(self):
#         if self.base_to_object_trans_rot:
#             target_pose = geometry_msgs.msg.Pose()
#             target_pose.position.x, target_pose.position.y, target_pose.position.z = self.base_to_object_trans_rot[0]
#             target_pose.orientation.x, target_pose.orientation.y, target_pose.orientation.z, target_pose.orientation.w = self.base_to_object_trans_rot[1]

#             self.move_group.set_pose_target(target_pose)

#             # Plan the trajectory
#             planned_path = self.move_group.plan()

#             # self.move_group.go(wait=True)

#             rospy.sleep(5)

# if __name__ == '__main__':
#     moveit_commander.roscpp_initialize(sys.argv)
#     rospy.init_node('ksh_move0615')
#     gv = get_vision()
#     rospy.spin()



# #!/usr/bin/env python
# #just move

# import sys
# import rospy
# import tf
# import moveit_commander
# import moveit_msgs.msg
# import geometry_msgs.msg

# from math import pi
# from std_msgs.msg import String
# import tf.transformations as tfm
# import numpy as np
# from sensor_msgs.msg import *
# from vision_msgs.msg import *
# from geometry_msgs.msg import *
# from std_msgs.msg import *

# #from obj_msg.msg import *
# from visualization_msgs.msg import Marker
# from vision_msgs.msg import Detection3DArray
# #from draw_panda_env import *
# from scipy.spatial import distance

# # panda+robotiq variable
# ROBOT_ARM_GROUP = 'arm'
# ROBOT_EE_GROUP = 'hand'
# ROBOT_EE_LINK = 'panda_link8'
# ROBOT_FRAME = 'panda_link0'

# class get_vision():
#     def __init__(self):
#         self.dataset = []
#         self.base_to_camera_mat = {'mat': None, 'trans': None, 'rot': None}
#         self.base_to_camera_mat = {'mat': None, 'trans': None, 'rot': None}
#         self.head_to_camera_mat = {'mat': None, 'trans': None, 'rot': None}
#         self.detected_object = []
#         self.listener = tf.TransformListener()
#         self.current_obstacles = {}
#         self.table = []

#         # Subscriber
#         # rospy.Subscriber('/obj_info', ObjInfoArrayMsg, self._callback_objects)
#         # rospy.Subscriber('/gr_info', GraspArray, self._callback_grasp)
#         rospy.Subscriber('/bbox_3d', Detection3DArray, self._callback_bbox_3d)

#     def _callback_bbox_3d(self, data):
#         # print("test_callback")
#         self.detected_object = []
#         for d3d in data.detections:
#             d3d.bbox.size.z += 0.04
#             d3d.bbox.center.position.z += 0.02
#             self.detected_object.append(d3d)

#             # add static object(table)
#         d3d = Detection3D()
#         d3d.tracking_id = int(0)
#         d3d.bbox.center.position.x = 0.55
#         d3d.bbox.center.position.y = 0.0
#         d3d.bbox.center.position.z = 0.80 / 2
#         d3d.bbox.center.orientation.x = 0.0
#         d3d.bbox.center.orientation.y = 0.0
#         d3d.bbox.center.orientation.z = 0.0
#         d3d.bbox.center.orientation.w = 1.0
#         d3d.bbox.size.x = 0.60  # 0.5
#         d3d.bbox.size.y = 1.2 #1.0  # 0.8
#         d3d.bbox.size.z = 0.80  # 0.8
#         self.table.append(d3d)



# def move_panda():

#     # moveit_commander 및 rospy 초기화
#     moveit_commander.roscpp_initialize(sys.argv)
#     rospy.init_node('ksh_move_panda_node', anonymous=True)
    
    
#     group = moveit_commander.MoveGroupCommander("arm")

#     # 로봇의 현재 상태를 가져옴
#     reference_frame = "/panda_link0"
#     group.set_pose_reference_frame(reference_frame)

#     # 목표 위치 설정
#     target_pose = geometry_msgs.msg.Pose()
#     target_pose.position.x = 0.6
#     target_pose.position.y = -0.1
#     target_pose.position.z = 1.0
#     target_pose.orientation.x = 0
#     target_pose.orientation.y = 0
#     target_pose.orientation.z = 0
#     target_pose.orientation.w = 1

#     # 로봇 팔을 목표 위치로 이동
#     group.set_pose_target(target_pose)
#     plan = group.plan()
#     group.go(wait=True)

#     rospy.sleep(5)

# if __name__ == '__main__':
#     try:
#         move_panda()
#     except rospy.ROSInterruptException:
#         pass


# #!/usr/bin/env python

# import rospy
# import tf
# import sys
# import moveit_commander
# import geometry_msgs.msg
# from tf.transformations import *
# from vision_msgs.msg import Detection3DArray

# class get_vision():
#     def __init__(self):
#         self.detected_object = []
#         self.listener = tf.TransformListener()
#         self.base_to_object_trans_rot = None
#         self.move_group = moveit_commander.MoveGroupCommander("arm")

#         rospy.Subscriber('/bbox_3d', Detection3DArray, self._callback_bbox_3d)

#     def _callback_bbox_3d(self, data):
#         if data.detections:
#             obj = data.detections[0]
#             trans2 = [obj.bbox.center.position.x, obj.bbox.center.position.y, obj.bbox.center.position.z]
#             rot2 = [obj.bbox.center.orientation.x, obj.bbox.center.orientation.y, 
#                      obj.bbox.center.orientation.z, obj.bbox.center.orientation.w]

#             now = rospy.Time.now()
#             self.listener.waitForTransform("/panda_link0", "/base_link", now, rospy.Duration(1.0))
#             (trans1, rot1) = self.listener.lookupTransform("/panda_link0", "/base_link", now)

#             matrix1 = concatenate_matrices(translation_matrix(trans1), quaternion_matrix(rot1))
#             matrix2 = concatenate_matrices(translation_matrix(trans2), quaternion_matrix(rot2))
#             final_matrix = concatenate_matrices(matrix1, matrix2)
            
#             self.base_to_object_trans_rot = (translation_from_matrix(final_matrix), 
#                                              quaternion_from_matrix(final_matrix))

#             self.move_panda()

#     def move_panda(self):
#         if self.base_to_object_trans_rot:
#             target_pose = geometry_msgs.msg.Pose()
#             target_pose.position.x, target_pose.position.y, target_pose.position.z = self.base_to_object_trans_rot[0]
#             target_pose.orientation.x, target_pose.orientation.y, target_pose.orientation.z, target_pose.orientation.w = self.base_to_object_trans_rot[1]

#             self.move_group.set_pose_target(target_pose)

#             # Plan the trajectory
#             planned_path = self.move_group.plan()

#             # # Check if a plan was found
#             # if len(planned_path.joint_trajectory.points) > 0:
#             #     rospy.loginfo("Plan found.")
#             # else:
#             #     rospy.logwarn("No plan found.")


#             # self.move_group.go(wait=True)

#             # rospy.sleep(5)

# if __name__ == '__main__':
#     moveit_commander.roscpp_initialize(sys.argv)
#     rospy.init_node('ksh_move0615')
#     gv = get_vision()
#     rospy.spin()




# #!/usr/bin/env python
# #get tf

# import rospy
# import tf

# if __name__ == '__main__':
#     rospy.init_node('my_tf_listener')

#     listener = tf.TransformListener()

#     rate = rospy.Rate(10.0) 

#     while not rospy.is_shutdown():
#         try:
            
#             now = rospy.Time.now()
#             listener.waitForTransform("/panda_link0", "/base_link", now, rospy.Duration(1.0))
#             (trans,rot) = listener.lookupTransform("/panda_link0", "/base_link", now)

#             print("Transform from base_link to panda_link0: ")
#             print("Translation: {0}".format(trans))
#             print("Rotation in Quaternion: {0}".format(rot))

#         except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
#             continue

#         rate.sleep()




# import sys
# import rospy
# import tf
# import moveit_commander
# import moveit_msgs.msg
# import geometry_msgs.msg

# from math import pi
# from std_msgs.msg import String
# import tf.transformations as tfm
# import numpy as np
# from sensor_msgs.msg import *
# from vision_msgs.msg import *
# from geometry_msgs.msg import *
# from std_msgs.msg import *

# #from obj_msg.msg import *
# from visualization_msgs.msg import Marker
# from vision_msgs.msg import Detection3DArray
# #from draw_panda_env import *
# from scipy.spatial import distance



# # panda+robotiq variable
# ROBOT_ARM_GROUP = 'arm'
# ROBOT_EE_GROUP = 'hand'
# ROBOT_EE_LINK = 'panda_link8'
# ROBOT_FRAME = 'panda_link0'

# class get_vision():
#     def __init__(self):
#         self.dataset = []
#         self.base_to_camera_mat = {'mat': None, 'trans': None, 'rot': None}
#         self.base_to_camera_mat = {'mat': None, 'trans': None, 'rot': None}
#         self.head_to_camera_mat = {'mat': None, 'trans': None, 'rot': None}
#         self.detected_object = []
#         self.listener = tf.TransformListener()
#         self.current_obstacles = {}
#         self.table = []

#         # Subscriber
#         # rospy.Subscriber('/obj_info', ObjInfoArrayMsg, self._callback_objects)
#         # rospy.Subscriber('/gr_info', GraspArray, self._callback_grasp)
#         rospy.Subscriber('/bbox_3d', Detection3DArray, self._callback_bbox_3d)

#     def _callback_bbox_3d(self, data):
#         # print("test_callback")
#         self.detected_object = []
#         for d3d in data.detections:
#             d3d.bbox.size.z += 0.04
#             d3d.bbox.center.position.z += 0.02
#             self.detected_object.append(d3d)

#             # add static object(table)
#         d3d = Detection3D()
#         d3d.tracking_id = int(0)
#         d3d.bbox.center.position.x = 0.55
#         d3d.bbox.center.position.y = 0.0
#         d3d.bbox.center.position.z = 0.80 / 2
#         d3d.bbox.center.orientation.x = 0.0
#         d3d.bbox.center.orientation.y = 0.0
#         d3d.bbox.center.orientation.z = 0.0
#         d3d.bbox.center.orientation.w = 1.0
#         d3d.bbox.size.x = 0.60  # 0.5
#         d3d.bbox.size.y = 1.2 #1.0  # 0.8
#         d3d.bbox.size.z = 0.80  # 0.8
#         self.table.append(d3d)



# def move_panda():

#     # moveit_commander 및 rospy 초기화
#     moveit_commander.roscpp_initialize(sys.argv)
#     rospy.init_node('ksh_move_panda_node', anonymous=True)
    
    
#     group = moveit_commander.MoveGroupCommander("arm")

#     # 로봇의 현재 상태를 가져옴
#     reference_frame = "panda_link0"
#     group.set_pose_reference_frame(reference_frame)
#     rospy.sleep(1)

#     current_frame = group.get_pose_reference_frame()
#     print("current_frame", current_frame)

#     current_pose = group.get_current_pose()
#     print("current_pose", current_pose)

#     # 목표 위치 설정
#     target_pose = geometry_msgs.msg.Pose()
#     target_pose.position.x = 0.3
#     target_pose.position.y = 0.2
#     target_pose.position.z = 0.5
#     target_pose.orientation.x = 0
#     target_pose.orientation.y = 0
#     target_pose.orientation.z = 0
#     target_pose.orientation.w = 1

#     # 로봇 팔을 목표 위치로 이동
#     # group.set_pose_target(target_pose)
#     # plan = group.plan()
#     #group.go(wait=True)

#     rospy.sleep(5)

# if __name__ == '__main__':
#     try:
#         move_panda()
#     except rospy.ROSInterruptException:
#         pass







# #!/usr/bin/env python

#0614_1840

# import sys
# import rospy
# import tf
# import copy
# import moveit_commander
# import moveit_msgs.msg
# import geometry_msgs.msg

# from math import pi
# from std_msgs.msg import String
# import tf.transformations as tfm
# import numpy as np
# # from sensor_msgs.msg import *
# from vision_msgs.msg import *
# from geometry_msgs.msg import *
# from std_msgs.msg import *
# from geometry_msgs.msg import PoseStamped

# #from obj_msg.msg import *
# # from visualization_msgs.msg import Marker
# from vision_msgs.msg import Detection3DArray
# #from draw_panda_env import *
# # from scipy.spatial import distance


# # panda+robotiq variable
# ROBOT_ARM_GROUP = 'arm'
# ROBOT_EE_GROUP = 'hand'
# ROBOT_EE_LINK = 'panda_link8'
# ROBOT_FRAME = 'panda_link0'


# class get_vision():
#     def __init__(self):
#         self.dataset = []
#         self.base_to_camera_mat = {'mat': None, 'trans': None, 'rot': None}
#         self.head_to_camera_mat = {'mat': None, 'trans': None, 'rot': None}
#         self.detected_object = []
#         self.listener = tf.TransformListener()
#         self.current_obstacles = {}
#         self.table = []

#         # Subscriber
#         rospy.Subscriber('/bbox_3d', Detection3DArray, self._callback_bbox_3d)

#     def _callback_bbox_3d(self, data):
#         # print("test_callback")
#         self.detected_object = []
#         for d3d in data.detections:
#             d3d.bbox.size.z += 0.04
#             d3d.bbox.center.position.z += 0.02
#             self.detected_object.append(d3d)

#             # add static object(table)
#         d3d = Detection3D()
#         d3d.tracking_id = int(0)
#         d3d.bbox.center.position.x = 0.55
#         d3d.bbox.center.position.y = 0.0
#         d3d.bbox.center.position.z = 0.80 / 2
#         d3d.bbox.center.orientation.x = 0.0
#         d3d.bbox.center.orientation.y = 0.0
#         d3d.bbox.center.orientation.z = 0.0
#         d3d.bbox.center.orientation.w = 1.0
#         d3d.bbox.size.x = 0.60  # 0.5
#         d3d.bbox.size.y = 1.2 #1.0  # 0.8
#         d3d.bbox.size.z = 0.80  # 0.8
#         self.table.append(d3d)


# def move_arm_to_position(move_group, position, orientation):
#     pose_goal = PoseStamped()
#     pose_goal.header.frame_id = "panda_link8"
#     pose_goal.pose.position.x = position[0]
#     pose_goal.pose.position.y = position[1]
#     pose_goal.pose.position.z = position[2]
#     pose_goal.pose.orientation.x = orientation[0]
#     pose_goal.pose.orientation.y = orientation[1]
#     pose_goal.pose.orientation.z = orientation[2]
#     pose_goal.pose.orientation.w = orientation[3]
    
#     move_group.set_pose_target(pose_goal)
#     plan = move_group.plan() # Actual movement is not executed for safety. You can use go() instead if you want.
#     print("Plan generated")
#     move_group.stop()
#     move_group.clear_pose_targets()

# if __name__ == "__main__":
#     moveit_commander.roscpp_initialize(sys.argv)
#     rospy.init_node('test_ksh', anonymous=True)
    
#     vision = get_vision()
#     move_group = moveit_commander.MoveGroupCommander('arm')
    
#     while not rospy.is_shutdown():
#         if vision.detected_object:
#             bbox = vision.detected_object[0].bbox.center
#             position = [bbox.position.x, bbox.position.y, bbox.position.z]
#             orientation = [bbox.orientation.x, bbox.orientation.y, bbox.orientation.z, bbox.orientation.w]
#             move_arm_to_position(move_group, position, orientation)
#             break
#         rospy.sleep(1)

# 0614
# #!/usr/bin/env python

# import sys
# import rospy
# import tf
# import copy
# import moveit_commander
# import moveit_msgs.msg
# import geometry_msgs.msg

# from math import pi
# from std_msgs.msg import String
# import tf.transformations as tfm
# import numpy as np
# # from sensor_msgs.msg import *
# from vision_msgs.msg import *
# from geometry_msgs.msg import *
# from std_msgs.msg import *

# #from obj_msg.msg import *
# # from visualization_msgs.msg import Marker
# from vision_msgs.msg import Detection3DArray
# #from draw_panda_env import *
# # from scipy.spatial import distance


# # panda+robotiq variable
# ROBOT_ARM_GROUP = 'arm'
# ROBOT_EE_GROUP = 'hand'
# ROBOT_EE_LINK = 'panda_link8'
# ROBOT_FRAME = 'panda_link0'


# class get_vision():
#     def __init__(self):
#         self.dataset = []
#         self.base_to_camera_mat = {'mat': None, 'trans': None, 'rot': None}
#         self.head_to_camera_mat = {'mat': None, 'trans': None, 'rot': None}
#         self.detected_object = []
#         self.listener = tf.TransformListener()
#         self.current_obstacles = {}
#         self.table = []

#         # Subscriber
#         rospy.Subscriber('/bbox_3d', Detection3DArray, self._callback_bbox_3d)

#     def _callback_bbox_3d(self, data):
#         # print("test_callback")
#         self.detected_object = []
#         for d3d in data.detections:
#             d3d.bbox.size.z += 0.04
#             d3d.bbox.center.position.z += 0.02
#             self.detected_object.append(d3d)

#             # add static object(table)
#         d3d = Detection3D()
#         d3d.tracking_id = int(0)
#         d3d.bbox.center.position.x = 0.55
#         d3d.bbox.center.position.y = 0.0
#         d3d.bbox.center.position.z = 0.80 / 2
#         d3d.bbox.center.orientation.x = 0.0
#         d3d.bbox.center.orientation.y = 0.0
#         d3d.bbox.center.orientation.z = 0.0
#         d3d.bbox.center.orientation.w = 1.0
#         d3d.bbox.size.x = 0.60  # 0.5
#         d3d.bbox.size.y = 1.2 #1.0  # 0.8
#         d3d.bbox.size.z = 0.80  # 0.8
#         self.table.append(d3d)


# def move_arm_to_position(move_group, position):

#     pose_goal = geometry_msgs.msg.Pose()
#     pose_goal.position.x = position[0]
#     pose_goal.position.y = position[1]
#     pose_goal.position.z = position[2]
#     pose_goal.orientation.x = 0
#     pose_goal.orientation.y = 0
#     pose_goal.orientation.z = 0
#     pose_goal.orientation.w = 1
#     move_group.set_pose_target(pose_goal)

#     plan = move_group.plan()

#     move_group.stop()
#     move_group.clear_pose_targets()

#     # move_group.go(wait=True)
#     # move_group.stop()
#     # move_group.clear_pose_targets()


# if __name__ == "__main__":

#     moveit_commander.roscpp_initialize(sys.argv)
#     rospy.init_node('test_ksh', anonymous=True)

#     vision = get_vision()
#     # group_name = "panda_arm"
#     move_group = moveit_commander.MoveGroupCommander('arm')
    
#     while not rospy.is_shutdown():
#         if vision.detected_object:
#             position = vision.detected_object[0].bbox.center.position
#             move_arm_to_position(move_group, [position.x, position.y, position.z])
#             break
#         rospy.sleep(1)




# #!/usr/bin/env python

# import sys
# import rospy
# import tf
# import moveit_commander
# import moveit_msgs.msg
# import geometry_msgs.msg

# from math import pi
# from std_msgs.msg import String
# import tf.transformations as tfm
# import numpy as np
# from sensor_msgs.msg import *
# from vision_msgs.msg import *
# from geometry_msgs.msg import *
# from std_msgs.msg import *

# #from obj_msg.msg import *
# from visualization_msgs.msg import Marker
# from vision_msgs.msg import Detection3DArray
# #from draw_panda_env import *
# from scipy.spatial import distance

# # panda+robotiq variable
# ROBOT_ARM_GROUP = 'arm'
# ROBOT_EE_GROUP = 'hand'
# ROBOT_EE_LINK = 'panda_link8'
# ROBOT_FRAME = 'panda_link0'

# class get_vision():
#     def __init__(self):
#         self.dataset = []
#         self.base_to_camera_mat = {'mat': None, 'trans': None, 'rot': None}
#         self.base_to_camera_mat = {'mat': None, 'trans': None, 'rot': None}
#         self.head_to_camera_mat = {'mat': None, 'trans': None, 'rot': None}
#         self.detected_object = []
#         self.listener = tf.TransformListener()
#         self.current_obstacles = {}
#         self.table = []

#         # Subscriber
#         # rospy.Subscriber('/obj_info', ObjInfoArrayMsg, self._callback_objects)
#         # rospy.Subscriber('/gr_info', GraspArray, self._callback_grasp)
#         rospy.Subscriber('/bbox_3d', Detection3DArray, self._callback_bbox_3d)

#     def _callback_bbox_3d(self, data):
#         # print("test_callback")
#         self.detected_object = []
#         for d3d in data.detections:
#             d3d.bbox.size.z += 0.04
#             d3d.bbox.center.position.z += 0.02
#             self.detected_object.append(d3d)

#             # add static object(table)
#         d3d = Detection3D()
#         d3d.tracking_id = int(0)
#         d3d.bbox.center.position.x = 0.55
#         d3d.bbox.center.position.y = 0.0
#         d3d.bbox.center.position.z = 0.80 / 2
#         d3d.bbox.center.orientation.x = 0.0
#         d3d.bbox.center.orientation.y = 0.0
#         d3d.bbox.center.orientation.z = 0.0
#         d3d.bbox.center.orientation.w = 1.0
#         d3d.bbox.size.x = 0.60  # 0.5
#         d3d.bbox.size.y = 1.2 #1.0  # 0.8
#         d3d.bbox.size.z = 0.80  # 0.8
#         self.table.append(d3d)



# def move_panda():

#     # moveit_commander 및 rospy 초기화
#     moveit_commander.roscpp_initialize(sys.argv)
#     rospy.init_node('ksh_move_panda_node', anonymous=True)
    
    
#     group = moveit_commander.MoveGroupCommander("arm")

#     # 로봇의 현재 상태를 가져옴
#     reference_frame = "/panda_link0"
#     group.set_pose_reference_frame(reference_frame)

#     # 목표 위치 설정
#     target_pose = geometry_msgs.msg.Pose()
#     target_pose.position.x = 0.3
#     target_pose.position.y = 0.2
#     target_pose.position.z = 0.5
#     target_pose.orientation.x = 0
#     target_pose.orientation.y = 0
#     target_pose.orientation.z = 0
#     target_pose.orientation.w = 1

#     # 로봇 팔을 목표 위치로 이동
#     group.set_pose_target(target_pose)
#     plan = group.plan()
#     #group.go(wait=True)

#     rospy.sleep(5)

# if __name__ == '__main__':
#     try:
#         move_panda()
#     except rospy.ROSInterruptException:
#         pass










    # group = moveit_commander.MoveGroupCommander("panda_arm")

    # # 로봇의 현재 상태를 가져옴
    # reference_frame = "/panda_link0"
    # group.set_pose_reference_frame(reference_frame)

    # # 목표 위치 설정
    # target_pose = geometry_msgs.msg.Pose()
    # target_pose.position.x = 0.3
    # target_pose.position.y = 0.2
    # target_pose.position.z = 0.5
    # target_pose.orientation.x = 0
    # target_pose.orientation.y = 0
    # target_pose.orientation.z = 0
    # target_pose.orientation.w = 1

    # # 로봇 팔을 목표 위치로 이동
    # group.set_pose_target(target_pose)
    # group.go(wait=True)

    # rospy.sleep(5)


# def move_arm_to_position(move_group, position, orientation):

#     pose_goal = geometry_msgs.msg.Pose()
#     pose_goal.position.x = position[0]
#     pose_goal.position.y = position[1]
#     pose_goal.position.z = position[2]
#     pose_goal.orientation.x = orientation[0]
#     pose_goal.orientation.y = orientation[1]
#     pose_goal.orientation.z = orientation[2]
#     pose_goal.orientation.w = orientation[3]
#     move_group.set_pose_target(pose_goal)

#     plan = move_group.plan()
#     print("Plan generated")

#     move_group.stop()
#     move_group.clear_pose_targets()

# if __name__ == "__main__":

#     moveit_commander.roscpp_initialize(sys.argv)
#     rospy.init_node('test_ksh', anonymous=True)

#     vision = get_vision()
#     # group_name = "panda_arm"
#     move_group = moveit_commander.MoveGroupCommander('arm')
#     listener = tf.TransformListener()
    
#     while not rospy.is_shutdown():
#         if vision.detected_object:
#             bbox = vision.detected_object[0].bbox.center
#             position = [bbox.position.x, bbox.position.y, bbox.position.z]
#             orientation = [bbox.orientation.x, bbox.orientation.y, bbox.orientation.z, bbox.orientation.w]
#             try:
#                 (trans,rot) = listener.lookupTransform('/camera_depth_optical_frame', '/panda_link0', rospy.Time(0))
#                 position, orientation = listener.transformPose('/panda_link0', position, orientation)
#             except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
#                 continue
#             move_arm_to_position(move_group, position, orientation)
