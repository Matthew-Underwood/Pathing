class_name MUP_Test_WorldTest
extends GdUnitTestSuite

const __source = 'res://addons/pathing/src/world.gd'
#func setup_pathing():
#	var pathing_factory = load("res://addons/pathing/src/pathing_factory.gd")
#	pathing_factory = pathing_factory.new(_world)
#	_pathing = pathing_factory.create()


#func pathing_test():
#	var pathing_factory = load("res://addons/pathing/src/pathing_factory.gd")
#	var pathing = pathing_factory.create()



func test_world():

	var size = Vector2(10, 10)
	var unwalkable_points = [Vector2(1, 1)]
	var transformer = mock(MUP_World_Transformers_Screen_Tilemap)
	var world = load("res://addons/pathing/src/world.gd")
	world = world.new(size, unwalkable_points, transformer)


	var world_point1 = world.screen_to_world(Vector2(10, 10))
	var world_point2 = world.screen_to_world(Vector2(80, 80))
	var world_point3 = world.screen_to_world(Vector2(80, 0))
	var world_point4 = world.screen_to_world(Vector2(0, 80))

	var out_of_bounds1 = world.is_out_of_bounds(Vector2(12, 2))
	var out_of_bounds2 = world.is_out_of_bounds(Vector2(2, 21))
	var out_of_bounds3 = world.is_out_of_bounds(Vector2(-2, -1))
	var out_of_bounds4 = world.is_out_of_bounds(Vector2(11, 11))

	var in_bounds1 = world.is_out_of_bounds(Vector2(1, 1))
	var in_bounds2 = world.is_out_of_bounds(size - Vector2.ONE)

	var is_walkable = world.is_walkable(Vector2(10, 10))
	var is_not_walkable = world.is_walkable(Vector2(80, 80))

	assert_vector3(world_point1).is_equal(Vector3(0, 0, 0))
	assert_vector3(world_point2).is_equal(Vector3(1, 2, 0))
	assert_vector3(world_point3).is_equal(Vector3(1, 0, 0))
	assert_vector3(world_point4).is_equal(Vector3(0, 1, 0))

	assert_vector2(size).is_equal(world.get_size())
	
	assert_bool(out_of_bounds1).is_true
	assert_bool(out_of_bounds2).is_true
	assert_bool(out_of_bounds3).is_true
	assert_bool(out_of_bounds4).is_true


	assert_bool(in_bounds1).is_false
	assert_bool(in_bounds2).is_false

	assert_bool(is_walkable).is_true

	assert_bool(is_not_walkable).is_false
