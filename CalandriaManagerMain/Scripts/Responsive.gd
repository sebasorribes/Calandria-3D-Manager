extends PanelContainer

@onready var main_container = $HBoxContainer
@onready var sidebar = $HBoxContainer/SideMenu

func _ready() -> void:
	get_tree().root.size_changed.connect(_on_window_resized)
	_on_window_resized()

func _on_window_resized() -> void:
	var screen_size = get_viewport().get_visible_rect().size
	
	if screen_size.x < screen_size.y:
		main_container.vertical = true 
		sidebar.custom_minimum_size.x = screen_size.x
		sidebar.custom_minimum_size.y = 80
	else:
		main_container.vertical = false
		sidebar.custom_minimum_size.x = 250
		sidebar.custom_minimum_size.y = 0
