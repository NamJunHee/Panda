#!/usr/bin/env python

import rospy
import copy
import numpy as np
import sys
import tf
import tf.transformations
import math
import moveit_commander
import moveit_msgs.msg

from math import pi
from scipy.spatial.transform import Rotation as R
from geometry_msgs.msg import Pose
from vision_msgs.msg import Detection3DArray
from shape_msgs.msg import SolidPrimitive
from tkinter import *

from symbolic_msgs.srv import*
from std_msgs.msg import String


class NJH_MovePanda(object):

   def __init__(self):

      super(NJH_MovePanda, self).__init__()

      moveit_commander.roscpp_initialize(sys.argv)
      rospy.init_node("njh_move_panda",anonymous=True)

      robot = moveit_commander.RobotCommander()
      scene = moveit_commander.PlanningSceneInterface()

      group_name = "panda_arm"
      move_group = moveit_commander.MoveGroupCommander(group_name)
      move_group.set_pose_reference_frame("panda_link0")
      window = Tk()

      self.robot = robot
      self.scene = scene
      self.move_group = move_group
      self.window = window

      self.vision_position = 0
      self.vision_orientation = 0

      self.x_compensation = 0.254
      self.z_compensation = 0.576

      self.InitialGoalPosition_X = 0.4
      self.InitialGoalPosition_Y = 0.0
      self.InitialGoalPosition_Z = 0.5

      self.InitialCartesian_X = 0.0
      self.InitialCartesian_Y = 0.0
      self.InitialCartesian_Z = 0.0

      self.InitialTableSize = [0.8, 0.5, 0.1]
      self.InitialTablePose = [0.4, 0.5, 0.1]

      self.InitialBoxSize = [0.37, 0.765, 0.017]
      self.InitialBoxPose = [0.7,0.0, 0.6]

      self.e_GoalPosition_X = Entry(self.window)
      self.e_GoalPosition_Y = Entry(self.window)
      self.e_GoalPosition_Z = Entry(self.window)

      self.e_Certesian_X = Entry(self.window)
      self.e_Certesian_Y = Entry(self.window)
      self.e_Certesian_Z = Entry(self.window)

      self.e_TableSize_X = Entry(self.window)
      self.e_TableSize_Y = Entry(self.window)
      self.e_TableSize_Z = Entry(self.window)

      self.e_TablePose_X = Entry(self.window)
      self.e_TablePose_Y = Entry(self.window)
      self.e_TablePose_Z = Entry(self.window)

      self.e_BoxSize_X = Entry(self.window)
      self.e_BoxSize_Y = Entry(self.window)
      self.e_BoxSize_Z = Entry(self.window)

      self.e_BoxPose_X = Entry(self.window)
      self.e_BoxPose_Y = Entry(self.window)
      self.e_BoxPose_Z = Entry(self.window)

      self.e_VisionPose_X = Entry(self.window)
      self.e_VisionPose_Y = Entry(self.window)
      self.e_VisionPose_Z = Entry(self.window)

      # planning_frame = move_group.get_planning_frame()
      # print("============ Planning frame: %s" % planning_frame)
      # eef_link = move_group.get_end_effector_link()
      # print("============ End effector link: %s" % eef_link)

      # print("============ Printing robot state")
      # print(move_group.get_current_pose())
      # print("")


   def get_vision(self):

      rospy.wait_for_service('perception_command')
      
      try:
        service_proxy = rospy.ServiceProxy('perception_command', perception)

        #request
        request = perceptionRequest()
        request.detect_obj = True
        request.place = 1

        response = service_proxy(request)

        #response
        self.vision_position = response.det_3d.detections[0].bbox.center.position
        self.vision_orientation = response.det_3d.detctionp[0].bbox.center.orientation
        
      except rospy.ServiceException as e:
        print ("Service Call Failed : %s" %e)

   def plan_vision_panda(self):

      self.get_vision

      move_group = self.move_group

      pose_goal = geometry_msgs.msg.Pose()
      pose_goal.position.x = self.vision_position.x
      pose_goal.position.y = self.vision_position.y
      pose_goal.position.z = self.vision_position.z

      quaternion = tf.transformations.quaternion_from_euler(pi/2, 0, pi, 'ryxz') 
      pose_goal.orientation.x = quaternion[0] 
      pose_goal.orientation.y = quaternion[1]
      pose_goal.orientation.z = quaternion[2]
      pose_goal.orientation.w = quaternion[3]

      move_group.set_pose_target(pose_goal)
      move_group.plan()

   def plan_cartesian_path(self,scale=1):

      move_group = self.move_group

      wpose = move_group.get_current_pose().pose
      
      wpose.position.x += scale * float(self.e_Certesian_X.get()) #- self.x_compensation
      wpose.position.y += scale * float(self.e_Certesian_Y.get())
      wpose.position.z += scale * float(self.e_Certesian_Z.get()) #- self.z_compensation

      quaternion = tf.transformations.quaternion_from_euler(pi/2, 0, pi, 'ryxz')
      wpose.orientation.x = quaternion[0] 
      wpose.orientation.y = quaternion[1]
      wpose.orientation.z = quaternion[2] 
      wpose.orientation.w = quaternion[3]

      waypoints = []
      waypoints.append(copy.deepcopy(wpose))
      (plan, fraction) = move_group.compute_cartesian_path(waypoints, 0.01, 0.0)

      return plan
   
   def plan_move_panda(self):

      move_group = self.move_group
      
      #좌표 목표 계획 및 실행
      pose_goal = geometry_msgs.msg.Pose()
      pose_goal.position.x = float(self.e_GoalPosition_X.get()) 
      pose_goal.position.y = float(self.e_GoalPosition_Y.get())
      pose_goal.position.z = float(self.e_GoalPosition_Z.get())

      # 회전 순서 y->z->x
      quaternion = tf.transformations.quaternion_from_euler(pi/2, 0, pi, 'ryxz') 
      pose_goal.orientation.x = quaternion[0]
      pose_goal.orientation.y = quaternion[1]
      pose_goal.orientation.z = quaternion[2]
      pose_goal.orientation.w = quaternion[3]

      # pose_goal.orientation.x = -1/math.sqrt(2)  
      # pose_goal.orientation.y = 0
      # pose_goal.orientation.z = -1/math.sqrt(2)  
      # pose_goal.orientation.w = 0

      move_group.set_pose_target(pose_goal)
      move_group.plan()

   def move_panda(self):

      move_group = self.move_group

      move_group.go(wait = True)
      move_group.stop()      

   def move_cartesian_path(self):

      move_group = self.move_group

      plan = self.plan_cartesian_path()
      move_group.execute(plan, wait=True)

   def move_vision_panda(self):
      
      move_group = self.move_group
      
      move_group.go(wait = True)
      move_group.stop()

   def add_object(self, size_x, size_y, size_z, position_x, position_y, position_z, name):

      print("add_object_operation")

      object_name = name
      object_pose = Pose()
      object_pose.position.x = position_x
      object_pose.position.y = position_y
      object_pose.position.z = position_z
      object_dimensions = [size_x, size_y, size_z] 

      object = SolidPrimitive()
      object.type = SolidPrimitive.BOX
      object.dimensions = object_dimensions

      print("planning_frame:", self.robot.get_planning_frame())
      collision_object = moveit_commander.CollisionObject()
      collision_object.id = object_name
      collision_object.header.frame_id = "panda_link0"
      collision_object.primitives = [object]
      collision_object.primitive_poses = [object_pose]

      # Create a publisher for the planning scene
      planning_scene_publisher = rospy.Publisher('/planning_scene', moveit_msgs.msg.PlanningScene, queue_size=1)
      rospy.sleep(1)

      # Create a planning scene message and add the collision object
      planning_scene = moveit_msgs.msg.PlanningScene()
      planning_scene.world.collision_objects.append(collision_object)
      planning_scene.is_diff = True

      # Publish the planning scene message
      planning_scene_publisher.publish(planning_scene)
      rospy.sleep(1)

      # Make sure that the collision object was added to the planning scene
      current_scene = self.scene.get_attached_objects()

      if object_name in current_scene or object_name in self.scene.get_known_object_names():
        rospy.loginfo("Collision object added successfully.")
      else:
        rospy.logerr("Failed to add collision object.")

   def auto_move_panda(self,step):

      while step != "end":

         if step == 1 :

            print("step1 play............")

         elif step == 2 :

            print("step2 play............")
      
   def panda_GUI(self):

      self.window.iconbitmap = "tf_icon.png"
      self.window.geometry("1300x400+500+300")

      self.e_GoalPosition_X.insert(0, str(self.InitialGoalPosition_X))
      self.e_GoalPosition_Y.insert(0, str(self.InitialGoalPosition_Y))
      self.e_GoalPosition_Z.insert(0, str(self.InitialGoalPosition_Z))
      self.e_Certesian_X.insert(0, str(self.InitialCartesian_X))
      self.e_Certesian_Y.insert(0, str(self.InitialCartesian_Y))
      self.e_Certesian_Z.insert(0, str(self.InitialCartesian_Z))

      self.e_TableSize_X.insert(0, str(self.InitialTableSize[0]))
      self.e_TableSize_Y.insert(0, str(self.InitialTableSize[1]))
      self.e_TableSize_Z.insert(0, str(self.InitialTableSize[2]))
      self.e_TablePose_X.insert(0, str(self.InitialTablePose[0]))
      self.e_TablePose_Y.insert(0, str(self.InitialTablePose[1]))
      self.e_TablePose_Z.insert(0, str(self.InitialTablePose[2]))

      self.e_BoxSize_X.insert(0, str(self.InitialBoxSize[0]))
      self.e_BoxSize_Y.insert(0, str(self.InitialBoxSize[1]))
      self.e_BoxSize_Z.insert(0, str(self.InitialBoxSize[2]))
      self.e_BoxPose_X.insert(0, str(self.InitialBoxPose[0]))
      self.e_BoxPose_Y.insert(0, str(self.InitialBoxPose[1]))
      self.e_BoxPose_Z.insert(0, str(self.InitialBoxPose[2]))

      b_plan_move_panda = Button(self.window, text="plan_move_panda", command=self.plan_move_panda)
      b_move_panda = Button(self.window, text = "move_panda", command=self.move_panda)
      b_plan_cartesian_path = Button(self.window, text="plan_cartesian_path", command=self.plan_cartesian_path)
      b_move_cartesian_path = Button(self.window, text="move_cartesian_path", command=self.move_cartesian_path) 
      b_add_table_object = Button(self.window, text="add_table_object", command = lambda : self.add_object(float(self.e_TableSize_X.get()),float(self.e_TableSize_Y.get()),float(self.e_TableSize_Z.get()),float(self.e_TablePose_X.get()),float(self.e_TablePose_Y.get()), float(self.e_TablePose_Z.get()), "table"))
      b_add_box_object = Button(self.window, text="add_box_object", command = lambda : self.add_object(float(self.e_BoxSize_X.get()),float(self.e_BoxSize_Y.get()),float(self.e_BoxSize_Z.get()),float(self.e_BoxPose_X.get()),float(self.e_BoxPose_Y.get()), float(self.e_BoxPose_Z.get()), "box"))
      b_plan_vision_panda = Button(self.window, text="plan_vision_panda", command=self.plan_vision_panda)
      b_move_vision_panda = Button(self.window, text="move_vision_panda", command=self.move_vision_panda)

      Label(self.window, text="NJH_MOVE_PANDA").grid(row=0)
      Label(self.window, text="Goal_Position_X").grid(row = 1,column=0)
      Label(self.window, text="Goal_Position_Y").grid(row = 2,column=0)
      Label(self.window, text="Goal_Position_Z").grid(row = 3,column=0)
      self.e_GoalPosition_X.grid(row=1, column=1)
      self.e_GoalPosition_Y.grid(row=2, column=1)
      self.e_GoalPosition_Z.grid(row=3, column=1)
      b_plan_move_panda.grid(row=4, column=0)
      b_move_panda.grid(row=4, column = 1)

      Label(self.window, text="Certesian_X").grid(row = 1,column=2)
      Label(self.window, text="Certesian_Y").grid(row = 2,column=2)
      Label(self.window, text="Certesian_Z").grid(row = 3,column=2)
      self.e_Certesian_X.grid(row=1, column=3)
      self.e_Certesian_Y.grid(row=2, column=3)
      self.e_Certesian_Z.grid(row=3, column=3)
      b_plan_cartesian_path.grid(row=4, column=2)
      b_move_cartesian_path.grid(row=4, column=3)

      Label(self.window, text="\n").grid(row=5)

      Label(self.window, text="TableSize_X").grid(row = 6,column=0)
      Label(self.window, text="TableSize_Y").grid(row = 7,column=0)
      Label(self.window, text="TableSize_Z").grid(row = 8,column=0)
      self.e_TableSize_X.grid(row=6, column=1)
      self.e_TableSize_Y.grid(row=7, column=1)
      self.e_TableSize_Z.grid(row=8, column=1)
      b_add_table_object.grid(row=9, column = 0)

      Label(self.window, text="BoxSize_X").grid(row = 6,column=2)
      Label(self.window, text="BoxSize_Y").grid(row = 7,column=2)
      Label(self.window, text="BoxSize_Z").grid(row = 8,column=2)
      self.e_BoxSize_X.grid(row=6, column=3)
      self.e_BoxSize_Y.grid(row=7, column=3)
      self.e_BoxSize_Z.grid(row=8, column=3)
      b_add_box_object.grid(row=9, column = 2)

      Label(self.window, text="VisionPose_X").grid(row = 1,column=4)
      Label(self.window, text="VisionPose_Y").grid(row = 2,column=4)
      Label(self.window, text="VisionPose_Z").grid(row = 3,column=4)
      self.e_VisionPose_X.grid(row=1, column=5)
      self.e_VisionPose_Y.grid(row=2, column=5)
      self.e_VisionPose_Z.grid(row=3, column=5)
      b_plan_vision_panda.grid(row=4, column=4)
      b_move_vision_panda.grid(row=4, column=5)



      self.window.mainloop()

def main():

   move_panda = NJH_MovePanda()
   move_panda.panda_GUI()

if __name__ == "__main__":
    try:
        main()
    except rospy.ROSInterruptException:
        pass
