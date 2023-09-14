#!/usr/bin/env python

import sys
import rospy
import tf
import moveit_commander
import moveit_msgs.msg
import geometry_msgs.msg

from math import pi
from std_msgs.msg import String
import tf.transformations as tfm
import numpy as np
from sensor_msgs.msg import *
from vision_msgs.msg import *
from geometry_msgs.msg import *
from std_msgs.msg import *

#from obj_msg.msg import *
from visualization_msgs.msg import Marker
from vision_msgs.msg import Detection3DArray
#from draw_panda_env import *
from scipy.spatial import distance

# panda+robotiq variable
ROBOT_ARM_GROUP = 'arm'
ROBOT_EE_GROUP = 'hand'
ROBOT_EE_LINK = 'panda_link8'
ROBOT_FRAME = 'panda_link0'

class get_vision():
    def __init__(self):
        self.dataset = []
        self.base_to_camera_mat = {'mat': None, 'trans': None, 'rot': None}
        self.base_to_camera_mat = {'mat': None, 'trans': None, 'rot': None}
        self.head_to_camera_mat = {'mat': None, 'trans': None, 'rot': None}
        self.detected_object = []
        self.listener = tf.TransformListener()
        self.current_obstacles = {}
        self.table = []

        # Subscriber
        # rospy.Subscriber('/obj_info', ObjInfoArrayMsg, self._callback_objects)
        # rospy.Subscriber('/gr_info', GraspArray, self._callback_grasp)
        rospy.Subscriber('/bbox_3d', Detection3DArray, self._callback_bbox_3d)

    def _callback_bbox_3d(self, data):
        # print("test_callback")
        self.detected_object = []
        for d3d in data.detections:
            d3d.bbox.size.z += 0.04
            d3d.bbox.center.position.z += 0.02
            self.detected_object.append(d3d)

            # add static object(table)
        d3d = Detection3D()
        d3d.tracking_id = int(0)
        d3d.bbox.center.position.x = 0.55
        d3d.bbox.center.position.y = 0.0
        d3d.bbox.center.position.z = 0.80 / 2
        d3d.bbox.center.orientation.x = 0.0
        d3d.bbox.center.orientation.y = 0.0
        d3d.bbox.center.orientation.z = 0.0
        d3d.bbox.center.orientation.w = 1.0
        d3d.bbox.size.x = 0.60  # 0.5
        d3d.bbox.size.y = 1.2 #1.0  # 0.8
        d3d.bbox.size.z = 0.80  # 0.8
        self.table.append(d3d)



def move_panda():

    # moveit_commander 및 rospy 초기화
    moveit_commander.roscpp_initialize(sys.argv)
    rospy.init_node('ksh_move_panda_node', anonymous=True)
    
    
    group = moveit_commander.MoveGroupCommander("panda_arm")

    # 로봇의 현재 상태를 가져옴
    reference_frame = "/panda_link0"
    group.set_pose_reference_frame(reference_frame)

    # 목표 위치 설정
    target_pose = geometry_msgs.msg.Pose()
    target_pose.position.x = 0.3
    target_pose.position.y = 0.2
    target_pose.position.z = 0.5
    target_pose.orientation.x = 0
    target_pose.orientation.y = 0
    target_pose.orientation.z = 0
    target_pose.orientation.w = 1

    # 로봇 팔을 목표 위치로 이동
    group.set_pose_target(target_pose)
    group.go(wait=True)

    rospy.sleep(5)

if __name__ == '__main__':
    try:
        move_panda()
    except rospy.ROSInterruptException:
        pass