extends Control

@onready var lbl_game_over = $lbl_GameOver
@onready var lbl_press_space = $lbl_PressSpace
@onready var timer = $Timer

func _ready():
	GameManager.on_game_over.connect(on_game_over)

func on_game_over():
	show()
	timer.start()

func _process(_delta):
	if lbl_press_space.visible && Input.is_action_just_pressed("Fly"):
		GameManager.load_main_scene()

func _on_timer_timeout():
	lbl_game_over.hide()
	lbl_press_space.show()
