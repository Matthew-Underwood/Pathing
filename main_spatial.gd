extends Spatial

func _ready():
    var world_factory = load("res://addons/pathing/src/world_factory.gd")
    world_factory = world_factory.new(Vector2(10, 10), [])
    world_factory.create_spatial(get_viewport().get_camera(), get_world())