extends Node2D

@onready var platform_generator = $PlatformGenerator
@onready var camera = $Camera2D

@export var camera_speed: float = 100.0 

func _ready():
	camera.position = Vector2(camera.position.x, 720)
	platform_generator.generate_platforms()

func _process(delta):
	camera.position.y -= camera_speed * delta
