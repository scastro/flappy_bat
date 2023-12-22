extends Control

@onready var lbl_hs_value = $MarginContainer/HBoxContainer/lbl_hs_value

# Called when the node enters the scene tree for the first time.
func _ready():
	lbl_hs_value.text = str(GameManager.score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Fly"):
		GameManager.load_game_scene()
