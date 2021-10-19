extends Node

onready var viewport =  $"../viewport_renderer"
onready var settings =  $"../settings"


# Called when the node enters the scene tree for the first time.
func _ready():
	viewport.OutValue = viewport.get_viewport().get_texture()
