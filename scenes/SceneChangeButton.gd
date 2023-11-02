extends Button

@export var nextScene: PackedScene;

func _on_pressed():
	get_tree().change_scene_to_packed(nextScene);
