extends Area2D

@onready var bloblet_brain = %BlobletBrain

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(_body):
	
	print ("Entered")
	
	bloblet_brain.SpawnBloblets(position)
	
	queue_free()
	pass # Replace with function body.
