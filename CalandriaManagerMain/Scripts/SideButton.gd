class_name SideButton

extends Button


@export var sceneToShow : PackedScene;

signal send_scene_to_show(newScene : String)

func _pressed() -> void:
	send_scene_to_show.emit(sceneToShow);
