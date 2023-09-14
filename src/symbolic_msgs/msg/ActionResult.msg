int32 action_id
int32[] objects
int32 result

# action_id
int32 ACTION_MOVE_FREE = 100 # objects = []
int32 ACTION_MOVE_HOLDING = 101 # objects = [holding_object]
int32 ACTION_PICK = 102 # objects = [picked_object]
int32 ACTION_PLACE_ON = 103 # objects = [object_top, object_bottom]
int32 ACTION_PLACE_IN = 104 # objects = [object_inner, object_outer]
int32 ACTION_STACK_IN = 105 # objects = [object_top, object_bottom]

# result
int32 SUCCESS = 1
int32 STATE_UPDATE_REQUIRED = 0
int32 FAILED = -1
