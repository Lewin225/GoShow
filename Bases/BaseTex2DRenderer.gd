extends "res://Bases/Base Node.gd"

onready var viewport = $preview/viewport
onready var preview = $preview

var intypes = []
var outtypes = []

func _ready():
	preview.OutValue = viewport.get_texture()
	if store_populated():
		settings_changed()


# Handle settings menu changes
func _on_settings_x_value_changed(value):
	save_store('render_size_x', int(value))

func _on_settings_y_value_changed(value):
	save_store('render_size_y', int(value))

func _on_settings_transparency_toggled(button_pressed):
	save_store('transparency', button_pressed)

func _on_settings_hdr_toggled(button_pressed):
	save_store('hdr', button_pressed)

func _on_settings_clear_toggled(button_pressed):
	save_store('clear', button_pressed)

# Apply settings
func settings_changed():
	print("VP size X changed ",load_store('render_size_x'))
	viewport.size.x = load_store('render_size_x')
	$settings_menu/settings/list/res/x.value = load_store('render_size_x')
	
	viewport.size.y = load_store('render_size_y')
	$settings_menu/settings/list/res/y.value = load_store('render_size_y')
	
	viewport.transparent_bg = load_store('transparency')
	$settings_menu/settings/list/res/transparency.value = load_store('transparency')
	
	viewport.hdr = load_store('hdr')
	$settings_menu/settings/list/hdr.value = load_store('hdr')
	
	if load_store('clear'):
		viewport.render_target_clear_mode = Viewport.CLEAR_MODE_ALWAYS
	else:
		viewport.render_target_clear_mode = Viewport.CLEAR_MODE_NEVER
	$settings_menu/settings/list/clear.value = load_store('clear')
		
		
		
		
		
		
