extends Node2D

@export var platform_scene: PackedScene
@export var platform_count: int = 10 
@export var spawn_range: Vector2 = Vector2(50, 430)
@export var y_spacing: Vector2 = Vector2(150, 200)

var last_y = 720 

func _ready():
	generate_platforms()

func generate_platforms():
	# Generate the initial set of platforms
	for i in range(platform_count):
		create_platform()

func create_platform():
	if not platform_scene:
		print("ERROR: platform_scene is not assigned!")
		return
	
	var platform = platform_scene.instantiate()
	add_child(platform)
	
	
	var x_position = randf_range(spawn_range.x, spawn_range.y)
	var y_position = last_y - randf_range(y_spacing.x, y_spacing.y)
	last_y = y_position
	
	platform.position = Vector2(x_position, y_position)
	print("Created platform at:", platform.position)
