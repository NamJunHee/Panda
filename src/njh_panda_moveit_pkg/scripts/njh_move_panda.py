#!/usr/bin/env python

import rospy
import copy
import numpy as np
import sys
import tf
import tf.transformations
import math
from math import pi
from scipy.spatial.transform import Rotation as R
from geometry_msgs.msg import Pose
import moveit_commander
from moveit_commander import MoveGroupCommander, roscpp_initialize
from vision_msgs.msg import Detection3DArray

from symbolic_msgs.srv import*
import moveit_msgs.msg
from std_msgs.msg import String

group_name = "arm"
move_group = MoveGroupCommander(group_name)
move_group.set_pose_reference_frame("panda_link0")

# def get_vision():
#     rospy.wait_for_service('perception_command')
#     target_pose = Pose()

#     try:
#         service_proxy = rospy.ServiceProxy('perception_command', perception)

#         #request
#         request = perceptionRequest()
#         request.detect_obj = True
#         request.place = 1

#         response = service_proxy(request)

#         #response
#         position = response.det_3d.detections[0].bbox.center.position
#         orientation = response.det_3d.detctionp[0].bbox.center.orientation

#         # Calculate transformation from panda_link0 to object
#         translation = np.array([position.x, position.y, position.z])
#         rotation = R.from_quat([orientation.x, orientation.y, orientation.z, orientation.w])
#         transform = np.eye(4)
#         transform2[:3, :3] = rotation.as_matrix()
        
#     except rospy.ServiceException as e:
#         print ("Service Call Failed : %s" %e)
    
def plan_certesian_path(scale=1):
   
   waypoints = []

   wpose = move_group.get_current_pose().pose
   wpose.position.z -= scale * 0.1
   wpose.position.y += scale * 0.2
   waypoints.append(copy.deepcopy(wpose))

def move_panda():
   
   moveit_commander.roscpp_initialize(sys.argv)
   rospy.init_node("njh_move_panda",anonymous=True)

   robot = moveit_commander.RobotCommander()
   scene = moveit_commander.PlanningSceneInterface()

   display_trajectory_publisher = rospy.Publisher("/move_group/display_planned_path",moveit_msgs.msg.DisplayTrajectory,queue_size=20,)

   planning_frame = move_group.get_planning_frame()
   print("============ Planning frame: %s" % planning_frame)
   eef_link = move_group.get_end_effector_link()
   print("============ End effector link: %s" % eef_link)
   
   print("============ Printing robot state")
   print(robot.get_current_state())
   print("")

   #좌표 목표 계획 및 실행
   pose_goal = geometry_msgs.msg.Pose()
   pose_goal.orientation.w = 0.0
   pose_goal.position.x = 0.6
   pose_goal.position.y = 0.0
   pose_goal.position.z = 0.35

   # quaternion = tf.transformations.quaternion_from_euler(0, 0, 0, 'rzyx')
   # 회전 순서 y->z->x
   quaternion = tf.transformations.quaternion_from_euler(np.pi/2, 0, 0, 'ryzx')
   pose_goal.orientation.x = quaternion[0]
   pose_goal.orientation.y = quaternion[1]
   pose_goal.orientation.z = quaternion[2]
   pose_goal.orientation.w = quaternion[3]
#    quaternion = tf.transformations.quaternion_from_euler(0, 0, 0, 'ryzx')
#    pose_goal.orientation.x = quaternion[0]
#    pose_goal.orientation.y = quaternion[1]
#    pose_goal.orientation.z = quaternion[2]
#    pose_goal.orientation.w = quaternion[3]


   move_group.set_pose_target(pose_goal)

   plan = move_group.plan()

   display_tracjectory = moveit_msgs.msg.DisplayTrajectory()
   display_tracjectory.trajectory_start = move_group.get_current_state()
   display_tracjectory.trajectory.append(plan)

   operation = input("operation : ")
   
   if(operation == 'move'):

      move_group.go(wait = True)
      move_group.stop()
      return
   
   elif(operation == 'stop'):

      print("STOP")

   

if __name__ == "__main__":
    try:
        move_panda()
    except rospy.ROSInterruptException:
        pass

    
