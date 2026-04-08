extends Control


@onready var highscore_number: Label = $MarginContainer/Highscore_number

const GAME = preload("res://scenes/game.tscn")


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Jump") == true:
		get_viewport().set_input_as_handled()
		GameManager.load_game_scene()


func _ready() -> void:
	get_tree().paused = false
	highscore_number.text = "%04d" % ScoreManager.high_score
