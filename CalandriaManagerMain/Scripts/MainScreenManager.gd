class_name MainScreenManager;
extends ScrollContainer

func ChangeScene(newScene : PackedScene) -> void:
	for child in get_child(0).get_children():
		child.queue_free();
	var scene = newScene.instantiate();
	get_child(0).add_child(scene);
