extends Node2D

const SPEED: float = 120.0

@onready var laser: Area2D = $Laser

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= SPEED * delta
	
	if position.x < get_viewport_rect().position.x - 100.0:
		queue_free()


func _screen_exited() -> void:
	queue_free()


func _on_pipe_body_entered(body: Node2D) -> void:
	if body is Tappy:
		body.die()
		set_physics_process(false)


func _on_laser_body_entered(body: Node2D) -> void:
	if body is Tappy:
		laser.body_entered.disconnect(_on_laser_body_entered)
		SignalHub.emit_point_scored()
