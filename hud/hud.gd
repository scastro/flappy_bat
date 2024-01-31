extends Control

@onready var lbl_score = $MarginContainer/lbl_score

func _ready():
	GameManager.on_score_updated.connect(on_score_updated)

func on_score_updated():
	lbl_score.text = str(GameManager.score)
