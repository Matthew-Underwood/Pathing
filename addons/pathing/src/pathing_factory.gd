class_name MUP_Pathing_Factory 

var _world : MUP_World

func _init(world : MUP_World):
	_world = world


func create() -> MUP_Pathing:
	var aStar = AStar.new()
	return  MUP_Pathing.new(aStar, _world)
