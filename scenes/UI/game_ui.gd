extends Control


const GAME_OVER = preload("res://assets/audio/game_over.wav")

@onready var sound: AudioStreamPlayer = $Sound
@onready var score: Label = $MarginContainer/Score
@onready var game_over: Label = $Game_over
@onready var press_space: Label = $Press_space
@onready var timer: Timer = $Timer
var _score: int = 0


func _ready() -> void:
	_score = 0
	
	

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Exit") == true:
		GameManager.load_main_scene()
	elif press_space.visible == true and event.is_action_pressed("Jump"):
		ScoreManager.high_score = _score
		GameManager.load_main_scene()

func _enter_tree() -> void:
	SignalHub.on_plane_died.connect(on_plane_died)
	SignalHub.on_point_scored.connect(on_point_scored)

func on_plane_died() -> void:
	sound.stop()
	sound.stream = GAME_OVER
	sound.play()
	game_over.show()
	timer.start()
	
func _on_timer_timeout() -> void:
	game_over.hide()
	press_space.show()

func on_point_scored() -> void:
	sound.play()
	_score += 1
	score.text = "%04d" % _score
