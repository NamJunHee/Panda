#!/usr/bin/env python

import sys
import rospy
from service_pkg.srv import *

def add_two_ints_client():
   while True:
      x = int(input('x입력 :'))
      y = int(input('y입력 :'))

      print ("Requesting %s + %s" %(x,y))

      rospy.wait_for_service('add_two_ints')
      
      try:
         add_two_ints = rospy.ServiceProxy('add_two_ints', service_srv)
         resp1 = add_two_ints(x,y)
         # return resp1.sum
         print ("%s + %s = %s" %(x, y, resp1.sum))   

      except rospy.ServiceException as e:
         print ("Service call failed: %s" %e) 
   # rospy.spin()

def usage():
   return "%s [x y]" %sys.argv[0]

if __name__=="__main__":
   # if len(sys.argv) == 3:
   #    x = int(sys.argv[1])
   #    y = int(sys.argv[2])
   # else:
   #    print (usage())
   #    sys.exit(1)

   add_two_ints_client()

   # x = int(input('x입력 :'))
   # y = int(input('y입력 :'))

   # print ("Requesting %s + %s" %(x,y))
   # print ("%s + %s = %s" %(x, y, add_two_ints_client(x,y)))