extends Node2D

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_again_button_pressed() -> void:
	pass # Replace with function body.
