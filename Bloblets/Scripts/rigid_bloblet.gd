extends RigidBody2D

var force = Vector2(200, 150)
var tmpVelocity = Vector2()
var grounded = true
var groundedItems = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func ApplyMovementForce(inputDir):
	#print("Test ",inputDir , " ", get_linear_velocity())
	
	if (grounded == false):
		inputDir.y = 0
	
	if (abs(inputDir.x) > 0):
		physics_material_override.absorbent = 1
	else:
		physics_material_override.absorbent = 0
	
	tmpVelocity = inputDir * force
	
	if (inputDir.y == 0):
		tmpVelocity.y = get_linear_velocity().y
	
	#print("Setting ", tmpVelocity)
	set_linear_velocity(tmpVelocity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_area_2d_body_entered(body):
	if body.is_in_group("Jumpable") && body != self:
		#print(groundedItems)
		groundedItems = groundedItems + 1
		if (groundedItems > 0):
			grounded = true

func _on_area_2d_body_exited(body):
	if body.is_in_group("Jumpable") && body != self:
		#print(groundedItems)
		groundedItems = groundedItems - 1
		if (groundedItems <= 0):
			grounded = false
