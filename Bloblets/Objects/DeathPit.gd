extends Area2D

@onready var bloblet_brain = %BlobletBrain


func _on_body_entered(_body):
	
	print ("Entered")
	bloblet_brain.KillBlob(_body);
	pass # Replace with function body.
