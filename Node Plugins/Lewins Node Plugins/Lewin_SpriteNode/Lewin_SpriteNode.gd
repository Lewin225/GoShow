extends Node

onready var io =  $"../viewport_renderer"
onready var viewport = $"../viewport_renderer/Viewport"
onready var sprite = $"../viewport_renderer/Viewport/Sprite"


# Called when the node enters the scene tree for the first time.
func _ready():
	io.OutValue = viewport.get_texture()

func _physics_process(_delta):
	if io.InValue != null:
		sprite.frame = 	io.InValue
		

