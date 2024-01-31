extends Area2D

const SCROLL_SPEED : float = 200.0

func _process(delta):
	position.x -= SCROLL_SPEED * delta

func _on_screen_exited():
	queue_free()

func _on_body_entered(body):
	if body.is_in_group(GameManager.GROUP_PLAYER):
		body.die()
