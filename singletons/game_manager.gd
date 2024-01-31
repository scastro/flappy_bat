extends Node

signal on_game_over
signal on_score_updated

const GROUP_PLAYER: String = "player"

var game_scene : PackedScene = preload("res://game/game.tscn")
var main_scene : PackedScene = preload("res://main/main.tscn")

var score_timer = Timer.new() #by default the timer is set to 1 second
var score: int = 0: set = set_score
var highScore: int = 0

func _ready():
	score_timer.timeout.connect(on_score_timeout)
	add_child(score_timer)
	on_game_over.connect(_on_game_over)

func load_game_scene():
	get_tree().change_scene_to_packed(game_scene)

func load_main_scene():
	get_tree().change_scene_to_packed(main_scene)

func set_score(value):
	score = value
	if score > highScore:
		highScore = score
	on_score_updated.emit()

func game_start():
	score = 0
	score_timer.start()

func on_score_timeout():
	set_score(score + 1)

func _on_game_over():
	score_timer.stop()
