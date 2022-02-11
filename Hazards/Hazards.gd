extends Area2D


func _on_Spike_body_entered(body):
#	if body.has_method("hurt"):
#		body.hurt()
	get_tree().call_group("GameState", "hurt")
	
	
	
func _on_Area2D_body_entered(body):
	if hurt():
		$AnimationPlayer.play("hurt")
		$AudioStreamPlayer.play()

func hurt():
	queue_free()




