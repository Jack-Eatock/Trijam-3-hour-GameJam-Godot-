extends Area2D
@onready var bloblet_brain = %BlobletBrain

func _on_body_entered(_body):
	bloblet_brain.FinishedLevel()
	queue_free()
	pass # Replace with function body.
