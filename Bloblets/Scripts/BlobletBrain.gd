extends Node

var array = []
var bloblet  = preload("res://Objects/rigid_bloblet.tscn")

@export var scene: String = "test"
@onready var audio_stream_player_2d = %AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range (0, 1):
		var blobian = bloblet.instantiate()
		blobian.position.x = 10
		blobian.position.y = 40 + i
		array.append(blobian)
		add_child(blobian)
	
	pass # Replace with function body.

var inputDirection = Vector2()

func FinishedLevel():
	print("Level Finished")
	get_tree().change_scene_to_file("res://Scenes/" + scene  +".tscn")
	

func SpawnBloblets(pos):
	for i in range (0, 5):
		var blobian = bloblet.instantiate()
		blobian.position.x = pos.x
		blobian.position.y = pos.y - 30 - i
		array.append(blobian)
		call_deferred("add_child", blobian)


func KillBlob(body):
	audio_stream_player_2d.play()
	var i = 0 
	for bloblet in array:
		if (bloblet == body):
			array.remove_at(i)
			break;
		i = i+1
	body.queue_free()

func _process(_delta):
	if Input.is_key_pressed(KEY_R):
		get_tree().change_scene_to_file("res://Scenes/" + get_tree().current_scene.name + ".tscn")

func _physics_process(_delta):
	inputDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if (inputDirection.y > 0):
		inputDirection.y = 0
	for bloblet in array:
		bloblet.ApplyMovementForce(inputDirection)

