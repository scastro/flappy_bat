extends Control

@onready var lbl_hs_value = $MarginContainer/HBoxContainer/lbl_hs_value
@onready var about_screen = $MarginContainer/About

func _ready():
	lbl_hs_value.text = str(GameManager.score)

func _process(_delta):
	if Input.is_action_just_pressed("Fly"):
		GameManager.load_game_scene()

func _on_about_pressed():
	if about_screen.visible:
		about_screen.hide()
	else:
		about_screen.show()