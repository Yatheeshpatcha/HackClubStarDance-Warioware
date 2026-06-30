extends Node2D
@onready var themed_timer: Node2D = $"."
@onready var timer: RichTextLabel = $Timer

var time 
# ^^^ You dragged this in the scene by the way 



var garlic_collected = 0 # just keeping track of garlic collected
var timer_end = false # boolean (true or false) stating whether the timer ended

func wait(seconds: float) -> void: # write this simple function out for wait!
	await get_tree().create_timer(seconds).timeout # makes u wait

func Timer(start_time: float): # making a new function for timer countdown!
	# we want the timer to go down, and when it reaches 0 it transitions 
	# to the next scene!
	
	time = start_time
	
	while time > 0.0: # run if timer hasnt reached 0
		await wait(0.10)
		time = time - 0.10
	
	#when timer reaches 0
	return

func _ready() -> void:



		#Below you can see that I have a function that I named. I grab a 
		#function from it that was created in it's script and use `await` to 
		# tell the script to wait for a signal, or for when a function finshes


	await themed_timer.Timer(10.0) #accessing a function from this node
	#after this is compeleted...
	timer_end = true # now we're saying "oh ye you ran out of time"

func _process(delta: float) -> void: # running every frame brochacho
	timer.text = str(time) # make ths text reflect the value of the time variable. this makes names easier. the str() converts the int to a String

	
	if garlic_collected == 3: # the double equals is just an argument asking if it's the same, with "=" it'll give an error
		print("garlic conected")
		if Global.minigames_done > 3: # we access a global script and see how many minigames have been compeleted
			get_tree().change_scene_to_file("res://scenes/end_screen.tscn") # change current play scene into another, but you make your own finish screen in a later challenge, dont worry abt this rn
		else:
			get_tree().change_scene_to_file("res://scenes/level_scene.tscn") # go back to the intermission scene
	
	if timer_end: # if the timer does end...
		Global.minigames_done -=1 #go back a minigame
		Global.lives -= 1 # lose ur lives
		print("timer end")
		get_tree().change_scene_to_file("res://scenes/level_scene.tscn") # back to intermission
		

func garlic_collect() -> void: # cool function that you connect to those garlics
	garlic_collected = garlic_collected +1
	return


func _on_sun_2_garlic_collected() -> void:
	garlic_collected = garlic_collected +1
	return



func _on_sun_3_garlic_collected() -> void:
	garlic_collected = garlic_collected +1
	return


func _on_sun_4_garlic_collected() -> void:
	garlic_collected = garlic_collected +1
	return
