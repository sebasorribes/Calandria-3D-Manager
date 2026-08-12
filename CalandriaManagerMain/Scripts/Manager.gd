class_name Manager
extends HBoxContainer


@onready var mainScreen = $MainScreen;
@onready var sideMenu = $SideMenu;


func _ready() -> void:
	ConnectSideButtons();

func ConnectSideButtons() -> void:
	for button in sideMenu.get_children():
		button.connect("send_scene_to_show",ChangeMainScreen);

func ChangeMainScreen(newScene : PackedScene) -> void:
	mainScreen.ChangeScene(newScene);
