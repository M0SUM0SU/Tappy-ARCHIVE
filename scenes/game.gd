extends Node2D

const PIPES = preload("res://scenes/pipes.tscn")


@onready var pipes_holder: Node = $PipesHolder
@onready var upperpoint: Marker2D = $Upperpoint
@onready var lowerpoint: Marker2D = $Lowerpoint

func _ready() -> void:
	spawn_pipes()

func _enter_tree() -> void:
	SignalHub.on_plane_died.connect(_on_plane_died)

func spawn_pipes() -> void:
	var np = PIPES.instantiate()
	var y_pos: float = randf_range(upperpoint.position.y, lowerpoint.position.y,)
	np.position = Vector2(upperpoint.position.x, y_pos,)
	pipes_holder.add_child(np)


func _on_spawn_timer_timeout() -> void:
	spawn_pipes()


func _on_plane_died() -> void:
	get_tree().paused = true
