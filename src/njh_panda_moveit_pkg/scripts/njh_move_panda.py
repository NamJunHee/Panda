#!/usr/bin/env python

DIGET = 3
PRINGLES = 4
GOTICA = 5
MILK = 8

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
from gripper_test import gripper_publisher


class NJH_MovePanda(object):

   def __init__(self):

      super(NJH_MovePanda, self).__init__()

      moveit_commander.roscpp_initialize(sys.argv)

      robot = moveit_commander.RobotCommander()
      scene = moveit_commander.PlanningSceneInterface()

      group_name = "arm"
      move_group = moveit_commander.MoveGroupCommander(group_name)
      move_group.set_pose_reference_frame("panda_link0")
      window = Tk()

      self.robot = robot
      self.scene = scene
      self.move_group = move_group
      self.window = window

      # self.vision_position = 0
      # self.vision_orientation = 0

      self.move_plan = moveit_msgs.msg.RobotTrajectory()
      self.vision_plan = moveit_msgs.msg.RobotTrajectory() 

      self.x_compensation = 0.254
      self.z_compensation = 0.576

      self.InitialGoalPosition_X = 0.4
      self.InitialGoalPosition_Y = 0.0
      self.InitialGoalPosition_Z = 0.5

      self.InitialCartesian_X = 0.0
      self.InitialCartesian_Y = 0.0
      self.InitialCartesian_Z = 0.0

      self.InitialTableSize = [0.5, 0.8, 1.0]
      self.InitialTablePose = [0.66 , 0.5, 0.5 - 0.576]

      self.InitialShelfSize = [0.5, 0.765, 1.0]
      self.InitialShelfPose = [0.66 ,-0.45, 0.5 - 0.576]

      self.vision_posion = []
      self.vision_orientation = []

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

      self.e_ShelfSize_X = Entry(self.window)
      self.e_ShelfSize_Y = Entry(self.window)
      self.e_ShelfSize_Z = Entry(self.window)

      self.e_ShelfPose_X = Entry(self.window)
      self.e_ShelfPose_Y = Entry(self.window)
      self.e_ShelfPose_Z = Entry(self.window)

      self.e_VisionPose_X = Entry(self.window)
      self.e_VisionPose_Y = Entry(self.window)
      self.e_VisionPose_Z = Entry(self.window)

      self.e_SelectObject = Entry(self.window)
      self.Select_Object = ["coffee","potato_chip","milk","cookie"]
      self.Object_Number = 0

      self.object_id = IntVar()

      # planning_frame = move_group.get_planning_frame()
      # print("============ Planning frame: %s" % planning_frame)
      # eef_link = move_group.get_end_effector_link()
      # print("============ End effector link: %s" % eef_link)

      # print("============ Printing robot state")
      # print(move_group.get_current_pose())
      # print("")

   def plan_vision_panda(self):

      rospy.wait_for_service('perception_command')
      
      try:
        service_proxy = rospy.ServiceProxy('perception_command', perception)

        #request
        request = perceptionRequest()
        request.detect_obj = True
        request.place = 1
        response = service_proxy(request)

        print(self.object_id.get())
     
        for object_id in range(len(response.det_3d.detections)) :
           print(object_id)
           if response.det_3d.detections[object_id].results[0].id == self.object_id.get():
              vision_position = response.det_3d.detections[object_id].bbox.center.position

      #   vision_position = response.det_3d.detections[0].bbox.center.position
      #   vision_orientation = response.det_3d.detections[0].bbox.center.orientation

        move_group = self.move_group

        pose_goal = geometry_msgs.msg.Pose()
           
        pose_goal.position.x = vision_position.x
        pose_goal.position.y = vision_position.y
        pose_goal.position.z = vision_position.z

        if pose_goal.position.x > 0 :
           pose_goal.position.x -= 0.05
        else :
           pose_goal.position.x += 0.05

        if pose_goal.position.y > 0 :
           pose_goal.position.y -= 0.01
        else :
           pose_goal.position.y += 0.01

        if pose_goal.position.z > 0 :
           pose_goal.position.z += 0.01
        else :
           pose_goal.position.z -= 0.01

        quaternion = tf.transformations.quaternion_from_euler(pi*2/3, 0, pi, 'ryxz') 
        pose_goal.orientation.x = quaternion[0] 
        pose_goal.orientation.y = quaternion[1]
        pose_goal.orientation.z = quaternion[2]
        pose_goal.orientation.w = quaternion[3]

      #   print(pose_goal.position)
   
        move_group.set_pose_target(pose_goal)
        self.vision_plan = move_group.plan()

        self.e_VisionPose_X.insert(0, str(vision_position.x))
        self.e_VisionPose_Y.insert(0, str(vision_position.y))
        self.e_VisionPose_Z.insert(0, str(vision_position.z))
        
      except rospy.ServiceException as e:
        print ("Service Call Failed : %s" %e)

   def plan_view(self):
      move_group = self.move_group
      # move_group.plan()

   def plan_cartesian_path(self,scale=1):

      move_group = self.move_group

      wpose = move_group.get_current_pose().pose
      
      wpose.position.x += scale * float(self.e_Certesian_X.get()) - self.x_compensation
      wpose.position.y += scale * float(self.e_Certesian_Y.get())
      wpose.position.z += scale * float(self.e_Certesian_Z.get()) - self.z_compensation

      # quaternion = tf.transformations.quaternion_from_euler(pi*2/3, 0, pi, 'ryxz')
      # wpose.orientation.x = quaternion[0] 
      # wpose.orientation.y = quaternion[1]
      # wpose.orientation.z = quaternion[2] 
      # wpose.orientation.w = quaternion[3]

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
      quaternion = tf.transformations.quaternion_from_euler(pi*2/3, 0, pi, 'ryxz') 
      pose_goal.orientation.x = quaternion[0]
      pose_goal.orientation.y = quaternion[1]
      pose_goal.orientation.z = quaternion[2]
      pose_goal.orientation.w = quaternion[3]

      # pose_goal.orientation.x = -1/math.sqrt(2)  
      # pose_goal.orientation.y = 0
      # pose_goal.orientation.z = -1/math.sqrt(2)  
      # pose_goal.orientation.w = 0

      move_group.set_pose_target(pose_goal)
      self.move_plan = move_group.plan()
 
   def move_panda(self):

      move_group = self.move_group
      move_group.execute(self.move_plan[1],wait = True)

   def move_cartesian_path(self):

      move_group = self.move_group

      plan = self.plan_cartesian_path()
      move_group.execute(plan, wait=True)

   def move_vision_panda(self):
      
      move_group = self.move_group
      move_group.execute(self.vision_plan[1], wait = True)

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
      self.window.geometry("350x580+500+300")

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

      self.e_ShelfSize_X.insert(0, str(self.InitialShelfSize[0]))
      self.e_ShelfSize_Y.insert(0, str(self.InitialShelfSize[1]))
      self.e_ShelfSize_Z.insert(0, str(self.InitialShelfSize[2]))
      self.e_ShelfPose_X.insert(0, str(self.InitialShelfPose[0]))
      self.e_ShelfPose_Y.insert(0, str(self.InitialShelfPose[1]))
      self.e_ShelfPose_Z.insert(0, str(self.InitialShelfPose[2]))

      self.e_SelectObject.insert(0, "coffee")

      b_plan_move_panda = Button(self.window, text="plan_move_panda", command=self.plan_move_panda)
      b_move_panda = Button(self.window, text = "move_panda", command=self.move_panda)
      b_plan_cartesian_path = Button(self.window, text="plan_cartesian_path", command=self.plan_cartesian_path)
      b_move_cartesian_path = Button(self.window, text="move_cartesian_path", command=self.move_cartesian_path) 
      b_add_table_object = Button(self.window, text="add_table_object", command = lambda : self.add_object(float(self.e_TableSize_X.get()),float(self.e_TableSize_Y.get()),float(self.e_TableSize_Z.get()),float(self.e_TablePose_X.get()),float(self.e_TablePose_Y.get()), float(self.e_TablePose_Z.get()), "table"))
      b_add_shelf_object = Button(self.window, text="add_shelf_object", command = lambda : self.add_object(float(self.e_ShelfSize_X.get()),float(self.e_ShelfSize_Y.get()),float(self.e_ShelfSize_Z.get()),float(self.e_ShelfPose_X.get()),float(self.e_ShelfPose_Y.get()), float(self.e_ShelfPose_Z.get()), "shelf"))
      b_plan_vision_panda = Button(self.window, text="plan_vision_panda", command=self.plan_vision_panda)
      b_move_vision_panda = Button(self.window, text="move_vision_panda", command=self.move_vision_panda)
      b_plan_view = Button(self.window, text= "plan_view", command=self.plan_view)

      Label(self.window, text="NJH_MOVE_PANDA").grid(row=0)
      Label(self.window, text="Goal_Position_X").grid(row = 1,column=0)
      Label(self.window, text="Goal_Position_Y").grid(row = 2,column=0)
      Label(self.window, text="Goal_Position_Z").grid(row = 3,column=0)
      self.e_GoalPosition_X.grid(row=1, column=1)
      self.e_GoalPosition_Y.grid(row=2, column=1)
      self.e_GoalPosition_Z.grid(row=3, column=1)
      b_plan_move_panda.grid(row=4, column=0)
      b_move_panda.grid(row=4, column = 1)

      Label(self.window, text="Certesian_X").grid(row = 5,column=0)
      Label(self.window, text="Certesian_Y").grid(row = 6,column=0)
      Label(self.window, text="Certesian_Z").grid(row = 7,column=0)
      self.e_Certesian_X.grid(row=5, column=1)
      self.e_Certesian_Y.grid(row=6, column=1)
      self.e_Certesian_Z.grid(row=7, column=1)
      b_plan_cartesian_path.grid(row=8, column=0)
      b_move_cartesian_path.grid(row=8, column=1)

      # Label(self.window, text="\n").grid(row=5)

      Label(self.window, text="TableSize_X").grid(row =  9,column=0)
      Label(self.window, text="TableSize_Y").grid(row = 10,column=0)
      Label(self.window, text="TableSize_Z").grid(row = 11,column=0)
      self.e_TableSize_X.grid(row=9, column=1)
      self.e_TableSize_Y.grid(row=10, column=1)
      self.e_TableSize_Z.grid(row=11, column=1)
      b_add_table_object.grid(row=12, column = 0)

      Label(self.window, text="ShelfSize_X").grid(row = 13,column=0)
      Label(self.window, text="ShelfSize_Y").grid(row = 14,column=0)
      Label(self.window, text="ShelfSize_Z").grid(row = 15,column=0)
      self.e_ShelfSize_X.grid(row=13, column=1)
      self.e_ShelfSize_Y.grid(row=14, column=1)
      self.e_ShelfSize_Z.grid(row=15, column=1)
      b_add_shelf_object.grid(row=16, column = 0)

      Label(self.window, text="VisionPose_X").grid(row = 17,column=0)
      Label(self.window, text="VisionPose_Y").grid(row = 18,column=0)
      Label(self.window, text="VisionPose_Z").grid(row = 19,column=0)
      # Label(self.window, text="Select_Object").grid(row = 20, column=0)
      self.e_VisionPose_X.grid(row=17, column=1)
      self.e_VisionPose_Y.grid(row=18, column=1)
      self.e_VisionPose_Z.grid(row=19, column=1)
      # self.e_SelectObject.grid(row=20, column=1)
      b_plan_vision_panda.grid(row=22, column=0)
      b_move_vision_panda.grid(row=22, column=1)

      Radiobutton(self.window, text = "Diget", padx=20,variable=self.object_id, value = DIGET).grid(row=20, column=0)
      Radiobutton(self.window, text = "Pringles", padx=20,variable=self.object_id, value = PRINGLES).grid(row=20, column=1)
      Radiobutton(self.window, text = "Gotica", padx=20,variable=self.object_id, value = GOTICA).grid(row=21, column=0)
      Radiobutton(self.window, text = "Milk", padx=20,variable=self.object_id, value = MILK).grid(row=21, column=1)

      # b_plan_view.grid(row=21, column= 0)

      self.window.mainloop()

def main():
   rospy.init_node("njh_move_panda",anonymous=True)
   # input("reset&activate")
   gripper_publisher('r')
   gripper_publisher('a')
   # input("close")
   # gripper_publisher('c')
   # input("open")
   # gripper_publisher('o')
   
   move_panda = NJH_MovePanda()
   move_panda.panda_GUI()

if __name__ == "__main__":   
    try:
        main()
    except rospy.ROSInterruptException:
        pass
