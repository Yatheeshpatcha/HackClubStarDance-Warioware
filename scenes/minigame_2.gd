extends Node2D
@onready var themed_timer: Node2D = $"."
@onready var timer: RichTextLabel = $Timer 

var time 

var buttons_pressed := 0
var timer_end = false

func Timer(start_time: float): # making a new function for timer countdown!
	# we want the timer to go down, and when it reaches 0 it transitions 
	# to the next scene!
	
	time = start_time
	
	while time > 0.0: # run if timer hasnt reached 0
		await wait(0.10)
		time = time - 0.10
	
	#when timer reaches 0
	return
	
func wait(seconds: float) -> void: # write this simple function out for wait!
	await get_tree().create_timer(seconds).timeout # makes u wait

func _ready() -> void:
	
	
	await themed_timer.Timer(5.0)
	#after this is completed...
	timer_end = true 


func _process(delta: float) -> void:	
	timer.text = str(time) # this makes names easier
	if buttons_pressed == 4:
		if Global.minigames_done > 3:
			get_tree().change_scene_to_file("res://scenes/end_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
	
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -=1
		get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
