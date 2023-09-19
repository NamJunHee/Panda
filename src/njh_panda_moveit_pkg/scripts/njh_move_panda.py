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

      group_name = "arm"#"panda_arm"
      move_group = moveit_commander.MoveGroupCommander(group_name)
      move_group.set_pose_reference_frame("panda_link0")
      window = Tk()

      self.robot = robot
      self.scene = scene
      self.move_group = move_group
      self.window = window

      self.x_compensation = 0.254
      self.z_compensation = 0.576

      self.InitialGoalPosition_X = 0.4
      self.InitialGoalPosition_Y = 0.0
      self.InitialGoalPosition_Z = 0.5

      self.InitialCartesian_X = 0.1
      self.InitialCartesian_Y = 0.0
      self.InitialCartesian_Z = 0.0

      self.e_GoalPosition_X = Entry(self.window)
      self.e_GoalPosition_Y = Entry(self.window)
      self.e_GoalPosition_Z = Entry(self.window)

      self.e_Certesian_X = Entry(self.window)
      self.e_Certesian_Y = Entry(self.window)
      self.e_Certesian_Z = Entry(self.window)

      self.e_wpose0_X = Entry(self.window)
      self.e_wpose0_Y = Entry(self.window)
      self.e_wpose0_Z = Entry(self.window)

      self.e_wpose1_X = Entry(self.window)
      self.e_wpose1_Y = Entry(self.window)
      self.e_wpose1_Z = Entry(self.window)

      self.e_wpose2_X = Entry(self.window)
      self.e_wpose2_Y = Entry(self.window)
      self.e_wpose2_Z = Entry(self.window)

      planning_frame = move_group.get_planning_frame()
      print("============ Planning frame: %s" % planning_frame)
      eef_link = move_group.get_end_effector_link()
      print("============ End effector link: %s" % eef_link)

      print("============ Printing robot state")
      print(move_group.get_current_pose())
      print("")


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
        position = response.det_3d.detections[0].bbox.center.position
        orientation = response.det_3d.detctionp[0].bbox.center.orientation

        # Calculate transformation from panda_link0 to object
        translation = np.array([position.x, position.y, position.z])
        rotation = R.from_quat([orientation.x, orientation.y, orientation.z, orientation.w])
        transform = np.eye(4)
      #   transform2[:3, :3] = rotation.as_matrix()
        
      except rospy.ServiceException as e:
        print ("Service Call Failed : %s" %e)

   def plan_cartesian_path(self,scale=1):

      move_group = self.move_group

      wpose = move_group.get_current_pose().pose
      
      wpose.position.x += scale * float(self.e_Certesian_X.get()) - self.x_compensation
      wpose.position.y += scale * float(self.e_Certesian_Y.get())
      wpose.position.z += scale * float(self.e_Certesian_Z.get()) - self.z_compensation

      quaternion = tf.transformations.quaternion_from_euler(pi/2, 0, pi, 'ryxz')
      wpose.orientation.x = quaternion[0] 
      wpose.orientation.y = quaternion[1]
      wpose.orientation.z = quaternion[2] 
      wpose.orientation.w = quaternion[3]

      waypoints = []
      waypoints.append(copy.deepcopy(wpose))

      # wpose0 = move_group.get_current_pose().pose
      # quaternion = tf.transformations.quaternion_from_euler(pi/2, 0, pi/4, 'ryxz')

      # wpose0.orientation.x = quaternion[0]  
      # wpose0.orientation.y = quaternion[1]
      # wpose0.orientation.z = quaternion[2]
      # wpose0.orientation.w = quaternion[3]

      # print(wpose0)

      # waypoints.append(copy.deepcopy(wpose0))

      # wpose1 = Pose()
      # wpose1.position.x = float(self.e_wpose1_X.get())
      # wpose1.position.y = float(self.e_wpose1_Y.get())
      # wpose1.position.z = float(self.e_wpose1_Z.get())

      # wpose1.orientation.x = quaternion[0]
      # wpose1.orientation.y = quaternion[1]
      # wpose1.orientation.z = quaternion[2]
      # wpose1.orientation.w = quaternion[3]

      # waypoints.append(copy.deepcopy(wpose1))

      # wpose2 = Pose()
      # wpose2.position.x = float(self.e_wpose2_X.get())
      # wpose2.position.y = float(self.e_wpose2_Y.get())
      # wpose2.position.z = float(self.e_wpose2_Z.get())

      # wpose2.orientation.x = quaternion[0]
      # wpose2.orientation.y = quaternion[1]
      # wpose2.orientation.z = quaternion[2]
      # wpose2.orientation.w = quaternion[3]

      # waypoints.append(copy.deepcopy(wpose2))

      (plan, fraction) = move_group.compute_cartesian_path(waypoints, 0.01, 0.0)
      return plan
      # move_group.execute(plan, wait=True)
   
   def plan_move_panda(self):

      move_group = self.move_group
      
      # display_trajectory_publisher = rospy.Publisher("/move_group/display_planned_path",moveit_msgs.msg.DisplayTrajectory,queue_size=20,)

      #좌표 목표 계획 및 실행
      pose_goal = geometry_msgs.msg.Pose()
      pose_goal.position.x = float(self.e_GoalPosition_X.get()) #+ self.x_compensation
      pose_goal.position.y = float(self.e_GoalPosition_Y.get())
      pose_goal.position.z = float(self.e_GoalPosition_Z.get()) #+ self.z_compensation

      quaternion = tf.transformations.quaternion_from_euler(pi/2, 0, pi, 'ryxz') #real_robot
      # 회전 순서 y->z->x
      # quaternion = tf.transformations.quaternion_from_euler(pi/2, 0, pi/4, 'ryxz') #my_computer
      pose_goal.orientation.x = quaternion[0]
      pose_goal.orientation.y = quaternion[1]
      pose_goal.orientation.z = quaternion[2]
      pose_goal.orientation.w = quaternion[3]

      # pose_goal.orientation.x = -1/math.sqrt(2)  
      # pose_goal.orientation.y = 0
      # pose_goal.orientation.z = -1/math.sqrt(2)  
      # pose_goal.orientation.w = 0

      # waypoints = []
      # waypoints.append(copy.deepcopy(pose_goal))
      # (plan, fraction) = move_group.compute_cartesian_path(waypoints, 0.01, 0.0)

      # return plan
      # move_group.execute(plan, wait=True)

      move_group.set_pose_target(pose_goal)

      plan = move_group.plan()

      wpose = move_group.get_current_pose().pose
      print(wpose)
      # display_tracjectory = moveit_msgs.msg.DisplayTrajectory()
      # display_tracjectory.trajectory_start = move_group.get_current_state()
      # display_tracjectory.trajectory.append(plan)
 
   def move_panda(self):

      move_group = self.move_group

      plan = self.plan_cartesian_path()
      move_group.execute(plan, wait=True)

      # move_group.go(wait = True)
      # move_group.stop()      

   def add_object(self):

      object_name = "box"
      object_pose = Pose()
      object_pose.position.x = 0.4
      object_pose.position.y = 0.0
      object_pose.position.z = 0.5
      object_dimensions = [0.05, 0.05, 0.1]  # [length, width, height]

      object_box = SolidPrimitive()
      object_box.type = SolidPrimitive.BOX
      object_box.dimensions = object_dimensions

      print("planning_frame:", self.robot.get_planning_frame())
      collision_object = moveit_commander.CollisionObject()
      collision_object.id = object_name
      collision_object.header.frame_id = "panda_link0"
      collision_object.primitives = [object_box]
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
      self.window.geometry("700x500+500+300")

      Label(self.window, text="NJH_MOVE_PANDA")
      Label(self.window, text="Goal_Position_X").grid(row = 0,column=0)
      Label(self.window, text="Goal_Position_Y").grid(row = 1,column=0)
      Label(self.window, text="Goal_Position_Z").grid(row = 2,column=0)

      Label(self.window, text="Certesian_X").grid(row = 0,column=2)
      Label(self.window, text="Certesian_Y").grid(row = 1,column=2)
      Label(self.window, text="Certesian_Z").grid(row = 2,column=2)

      Label(self.window, text="Wpose0_X").grid(row = 5,column=0)
      Label(self.window, text="Wpose0_Y").grid(row = 6,column=0)
      Label(self.window, text="Wpose0_Z").grid(row = 7,column=0)

      Label(self.window, text="Wpose1_X").grid(row = 9,column=0)
      Label(self.window, text="Wpose1_Y").grid(row = 10,column=0)
      Label(self.window, text="Wpose1_Z").grid(row = 11,column=0)

      Label(self.window, text="Wpose2_X").grid(row = 13,column=0)
      Label(self.window, text="Wpose2_Y").grid(row = 14,column=0)
      Label(self.window, text="Wpose2_Z").grid(row = 15,column=0)

      self.e_GoalPosition_X.insert(0, str(self.InitialGoalPosition_X))
      self.e_GoalPosition_Y.insert(0, str(self.InitialGoalPosition_Y))
      self.e_GoalPosition_Z.insert(0, str(self.InitialGoalPosition_Z))

      self.e_Certesian_X.insert(0, str(self.InitialCartesian_X))
      self.e_Certesian_Y.insert(0, str(self.InitialCartesian_Y))
      self.e_Certesian_Z.insert(0, str(self.InitialCartesian_Z))

      b_move_panda = Button(self.window, text = "MOVE_PANDA", command=self.move_panda)
      b_plan_move_panda = Button(self.window, text="plan_move_panda", command=self.plan_move_panda)
      b_plan_cartesian_path = Button(self.window, text="plan_certesian_path", command=self.plan_cartesian_path)
      b_add_object = Button(self.window, text="add_object", command=self.add_object)

      self.e_GoalPosition_X.grid(row=0, column=1)
      self.e_GoalPosition_Y.grid(row=1, column=1)
      self.e_GoalPosition_Z.grid(row=2, column=1)

      self.e_Certesian_X.grid(row=0, column=3)
      self.e_Certesian_Y.grid(row=1, column=3)
      self.e_Certesian_Z.grid(row=2, column=3)

      b_move_panda.grid(row=1, column=6)
      b_plan_move_panda.grid(row=3, column=1)
      b_plan_cartesian_path.grid(row=3, column=3)
      b_add_object.grid(row=4, column = 0)

      self.e_wpose0_X.grid(row=5, column=1)
      self.e_wpose0_Y.grid(row=6, column=1)
      self.e_wpose0_Z.grid(row=7, column=1)

      self.e_wpose1_X.grid(row=9, column=1)
      self.e_wpose1_Y.grid(row=10, column=1)
      self.e_wpose1_Z.grid(row=11, column=1)

      self.e_wpose2_X.grid(row=13, column=1)
      self.e_wpose2_Y.grid(row=14, column=1)
      self.e_wpose2_Z.grid(row=15, column=1)

      self.window.mainloop()

def main():

   move_panda = NJH_MovePanda()
   move_panda.panda_GUI()


if __name__ == "__main__":
    try:
        main()
    except rospy.ROSInterruptException:
        pass
