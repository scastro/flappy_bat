extends Node2D

@onready var obstaclesHolder = $Obstacles
@onready var up_marker = $UpMarker
@onready var low_marker = $LowMarker
@onready var spawn_timer = $SpawnTimer

@export var obstacles : Array[PackedScene]

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.on_game_over.connect(on_game_over)
	spawnObstacle()
	GameManager.game_start()


func _on_spawn_timer_timeout():
	spawnObstacle()
	

func spawnObstacle():
	var new_obstacle = obstacles.pick_random().instantiate()
	var y_pos = randf_range(up_marker.position.y, low_marker.position.y)
	
	new_obstacle.position = Vector2(up_marker.position.x, y_pos)
	obstaclesHolder.add_child(new_obstacle)
	
func stopObstacles():
	for obstacle in obstaclesHolder.get_children():
		obstacle.set_process(false)

func on_game_over():
	spawn_timer.stop()
	stopObstacles()
