class_name MUP_Pathing_Factory 

var _world : MUP_World

func _init(world : MUP_World):
	_world = world


func create() -> MUP_Pathing:
	var pathing = load("res://addons/pathing/src/pathing/pathing.gd")
	var aStar = AStar.new()
	pathing = pathing.new(aStar, _world)
	return pathing
