class_name MUP_World_Factory

var _world = load("res://addons/pathing/src/world.gd")
var _size : Vector2
var _unwalkable_points : Array

func _init(size : Vector2, unwalkable_points = []):
    _size = size
    _unwalkable_points = unwalkable_points

func create_spatial(camera : Camera, world : World) -> MUP_World:
    var mesh_picking = load("res://addons/pathing/src/world/mesh_picking.gd")
    var screen_mesh_transformer = load("res://addons/pathing/src/world/transformers/screen_mesh.gd")

    mesh_picking = mesh_picking.new(camera, world)
    screen_mesh_transformer = screen_mesh_transformer.new(mesh_picking)
    return _world.new(_size, _unwalkable_points, screen_mesh_transformer)


func create_2d(tilemap : TileMap) -> MUP_World:
    var screen_tilemap_transformer = load("res://addons/pathing/src/world/transformers/screen_tilemap.gd")
    screen_tilemap_transformer = screen_tilemap_transformer.new(tilemap)
    return _world.new(_size, _unwalkable_points, screen_tilemap_transformer)