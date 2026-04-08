extends Node

const TRANSR = preload("res://scenes/ComplexTransition/transition.tscn")
const GAME = preload("res://scenes/game.tscn")
const MAIN = preload("res://scenes/UI/main.tscn")
const SIMPLE_TRANSITION = preload("res://scenes/UI/simple_transition.tscn")

var next_scene: PackedScene


func add_complex() -> void:
	var ct = TRANSR.instantiate()
	add_child(ct)

func load_game_scene() -> void:
	next_scene = GAME
	add_complex()
	get_tree().change_scene_to_packed(SIMPLE_TRANSITION)
	
func load_main_scene() -> void:
	next_scene = MAIN
	add_complex()
	get_tree().change_scene_to_packed(SIMPLE_TRANSITION)
