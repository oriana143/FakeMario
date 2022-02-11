extends Node2D

const SPEED = 300
	
	
func _process(delta):
	position.y += SPEED * delta
	manage_collision()

	
func manage_collision():
	var collider = $Area2D.get_overlapping_bodies()
	for object in collider:
		if object.name == "Bee":
			get_tree().call_group("GameState", "hurt")
			

		
		
